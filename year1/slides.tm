<TeXmacs|2.1>

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
    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    <doc-data|<doc-title|Annual Thesis Monitoring Committee (TMC) meeting>>

    <doc-data|<doc-title|Lax-Wendroff Flux Reconstruction : Blending limiters
    and relation to ADER>|<doc-misc|Arpit Babbar>|<doc-date|<date>>>
  </hidden>|<\hidden>
    <tit|Outline>

    <with|font-base-size|12|<\itemize>
      <unroll-greyed|<\shown>
        <item>Review of Lax-Wendroff Flux Reconstruction with D2 dissipation
        numerical flux.
      </shown>|<\shown>
        <item>Introduction to the blending limiter of
        <cite|HENNEMANN2021109935> in context of Lax-Wendroff
      </shown>|<\shown>
        <item>Extending Zhang-Shu's limiter <cite|Zhang2010b> to Lax-Wendroff
        schemes.
      </shown>|<\shown>
        <item>Admissibility preserving MUSCL-Hancock reconstruction on
        non-cell centred grids used by <cite|HENNEMANN2021109935>.
      </shown>|<\shown>
        <item>Prove equivalence of ADER and LW-D2 schemes with numerical
        verification
      </shown>|<\shown>
        <item>Numerical results in 1-D, 2-D demonstrating admissibility
        preservation and accuracy improvement of limiting procedure.
      </shown>|<\shown>
        <item>Code optimization in <verbatim|Julia>
      </shown>|<\shown>
        <item>Summary and reading activities of the year
      </shown>>
    </itemize>>
  </hidden>|<\hidden>
    <tit|Flux Reconstruction (FR) by Huynh <cite|Huynh2007>>

    <\with|font-base-size|8>
      <unroll-phantoms|<\shown>
        <\equation*>
          <large|<with|font-series|bold|u><rsub|t>+<with|font-series|bold|f><around*|(|<with|font-series|bold|u>|)><rsub|x>=0>
        </equation*>
      </shown>|<\shown>
        <\equation*>
          <tabular*|<tformat|<table|<row|<cell|<text| Degree <math|N>
          approximation>>>|<row|<cell|>>|<row|<cell|<large|<huge|\<Omega\>>=<big|cup><rsub|<huge|e>><huge|I<rsub|e>>>>>>>>
        </equation*>
      </shown>|<\shown>
        <with|gr-color|blue|gr-point-size|2ln|<with|font-base-size|11|gr-mode|<tuple|edit|point>|gr-frame|<tuple|scale|1cm|<tuple|0.67999gw|0.689995gh>>|gr-geometry|<tuple|geometry|1par|0.265183par|center>|<graphics||<line|<point|-10.8254|-0.173849>|<point|-8.76160867839661|-0.173849054107686>>|<with|arrow-end|\<gtr\>|<spline|<point|-9.2167|0.19657>|<point|-3.96732372006879|1.17024407990475>|<point|1.55721656303744|0.196570313533536>>>|<line|<point|-0.0514618|-0.110349>|<point|4.28773647307845|-0.173849054107686>>|<text-at|<tiny|<math|<with|font-base-size|10|x<rsub|e-<frac|1|2>>>>>|<point|-11.1058995898928|-0.51253424130176>>|<text-at|<tiny|<math|<with|font-base-size|10|x<rsub|e+<frac|1|2>>>>>|<point|-8.79869908056621|-0.576019451779336>>|<text-at|<tiny|<math|0>>|<point|-0.247288925783834|-0.459601041275301>>|<with|arrow-end|\<gtr\>|<spline|<point|1.79529|-0.814278>|<point|-4.03616549808176|-2.23245468977378>|<point|-9.27495369757905|-1.00477907130573>>>|<text-at|<large|<math|<small|I<rsub|e>>>>|<point|-10.0264|0.210064>>|<with|color|blue|point-size|2ln|<point|-10.3948|-0.173849>>|<with|color|blue|point-size|2ln|<point|-9.78272|-0.173849>>|<with|color|blue|point-size|2ln|<point|-9.19266|-0.173849>>|<with|color|blue|point-size|2ln|<point|0.813427|-0.123006>>|<with|color|blue|point-size|2ln|<point|2.22103|-0.152302>>|<with|color|blue|point-size|2ln|<point|3.47767|-0.161994>>|<with|color|blue|<\document-at>
          \;
        </document-at|<point|-11.8933|5.4261>>>|<with|color|blue|<\document-at>
          \;
        </document-at|<point|-11.0084998015611|-5.00388609604445>>>|<text-at|<math|<small|I>>|<point|1.96146977113375|0.104246593464744>>|<text-at|<math|<tiny|<with|font-base-size|10|x\<mapsto\>\<xi\><rsub|e><around*|(|x|)>>>>|<point|-4.49125214975526|1.51496560391586>>|<text-at|<tiny|<math|<with|font-base-size|10|\<xi\>\<mapsto\>x<rsub|e><around*|(|\<xi\>|)>>>>|<point|-4.60766966529964|-1.94580963090356>>|<with|color|blue|<\document-at>
          \;
        </document-at|<point|4.44186|-2.32501>>>|<with|color|blue|<text-at|<math|<tabular*|<tformat|<table|<row|<cell|x<rsub|e,j>\<mapsto\>\<xi\><rsub|j>>>>>>>|<point|-5.16169466860696|-0.560408122767562>>>|<text-at|<math|<tiny|1>>|<point|4.35570181240905|-0.52194404021696>>|<with|color|blue|<text-at|<math|<wide|r|^>=<wide|r|^><around*|(|\<xi\>|)>>|<point|4.62630638973409|0.711668210080698>>>|<with|color|blue|<\document-at>
          <math|<with|font-base-size|9|<pdv|r|x>=<frac|1|\<mathLaplace\>x<rsub|e>><pdv|<wide|r|^>|\<xi\>>>>
        </document-at|<point|4.52549940468316|-1.27926974467522>>>|<with|color|blue|<text-at|<math|<tabular*|<tformat|<table|<row|<cell|u<rsub|h>=u<rsub|h><around*|(|x|)>>>|<row|<cell|>>|<row|<cell|>>|<row|<cell|r=r<around*|(|x|)>>>>>>>|<point|-14.4766172774176|-0.422410371742294>>>>>>
      </shown>>
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
      border>|<with|font-base-size|9|gr-frame|<tuple|scale|1cm|<tuple|0.499999gw|0.150005gh>>|gr-geometry|<tuple|geometry|1par|0.586931par|center>|<graphics||<with|magnify|0.84629758534134|<line|<point|-0.0921688443002041|9.3846306204784>|<point|-0.0832120999999998|7.74555>|<point|-0.0742553852457589|6.68865765899957>>>|<with|arrow-end|\<gtr\>|<arrow-with-text|<point|-0.114962|5.26903>|<point|-0.0937954755920095|3.35343630109803>|<math-at|>>>|<with|line-width|2ln|<line|<point|-0.519281144992725|10.1258597565816>|<point|0.26883521524011|10.1360270104577>>>|<with|line-width|2ln|<line|<point|-0.093794987008864|9.7881436301098>|<point|-0.114962252520175|10.4231686731049>>>|<text-at|<image|Figures/cts_flux/fc_labeled.pdf|0.38par|||>|<point|-4.63407858182299|-1.78452837676941>>|<text-at|<math|<with|<with|<wide|f|^><rsub|h>=<wide|f|^><rsub|h><rsup|\<delta\>><with|color|black|+<with|color|white|<with|color|black|<around*|(|<with|color|black|<with|color|purple|f<rsub|e-<frac|1|2>>>>-<wide|f|^><rsub|h><rsup|\<delta\>><around*|(|0|)>|)>>>*g<rsub|L>+><with|color|white|<with|color|black|<around*|(|<with|color|purple|f<rsub|e+<frac|1|2>>>-<wide|f|^><rsub|h><rsup|\<delta\>><around*|(|1|)>|)>>>*g<rsub|R>>>>|<point|-4.77166291837545|5.59601137716629>>|<text-at|<image|Figures/cts_flux/fd_2.pdf|0.3par|||>|<point|-9.84111654980818|6.30509988093663>>|<text-at|<math|<wide|f|^><rsub|h><rsup|\<delta\>><around*|(|\<xi\><rsub|i>|)>=f<around*|(|<wide|u|^><rsub|h><around*|(|\<xi\><rsub|i>|)>|)>>|<point|-8.50760682629977|9.31078846408255>>|<text-at|<image|Figures/cts_flux/corr.pdf|0.3par|||>|<point|2.62351736392765|6.29747651805794>>|<text-at|<math|<tabular*|<tformat|<cwith|1|-1|1|1|font-base-size|8>|<table|<row|<cell|g<rsub|L><around*|(|0|)>=1,g<rsub|L><around*|(|1|)>=0>>|<row|<cell|g<rsub|R><around*|(|0|)>=0,g<rsub|R><around*|(|1|)>=1>>>>>>|<point|3.89615028442916|9.77645852626009>>>>>
    </shown>>>
  </hidden>|<\hidden>
    <tit|Lax-Wendroff Flux Reconstruction (LWFR) with D2 dissipation
    <cite|oldpaper>>

    <unroll|<\shown>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<large|u<rsup|n+1>=u<rsup|n>-\<mathLaplace\>t*F<rsup|n><rsub|x>>,>>|<row|<cell|<text|where
        >F=f<around*|(|u|)>+<frac|\<mathLaplace\>t|2><around*|(|f<around*|(|u|)>|)><rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>f<around*|(|u|)><rsub|t*t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N||t>f<around*|(|u|)>>>>>>
      </equation*>
    </shown>|<\shown>
      Approximate Lax-Wendroff procedure (Zorio Et Al.
      <cite|zorio_approximate_2017>)

      <\equation*>
        <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|f<around*|(|u|)><rsub|t>>|<cell|\<approx\>>|<cell|<frac|f<around*|(|u<around*|(|x,t+\<mathLaplace\>t|)>|)>-f<around*|(|u<around*|(|x,t-\<mathLaplace\>t|)>|)>|2\<mathLaplace\>t>+O<around*|(|\<mathLaplace\>t<rsup|2>|)>>>|<row|<cell|>|<cell|\<approx\>>|<cell|<frac|f<around*|(|u+\<mathLaplace\>t*<with|color|blue|u<rsub|t>>|)>-f<around*|(|u-\<mathLaplace\>t*<with|color|blue|u<rsub|t>>|)>|2\<mathLaplace\>t>+O<around*|(|\<mathLaplace\>t<rsup|2>|)>,>>>>>
      </equation*>

      and<with|color|blue| <with|color|blue|<with|color|blue|<math|<with|color|blue|u<rsub|t>=-f<around*|(|u|)><rsub|x>>>>>>.
    </shown>|<\shown>
      <math|F<rsub|h><rsup|\<delta\>>> corrected using
      <math|F<rsub|e+<frac|1|2>>>.
    </shown>|<\shown>
      Past works

      <\equation*>
        F<rsub|e+<frac|1|2>>=<frac|1|2>*<around|[|F<rsub|e+<frac|1|2>><rsup|->+F<rsub|e+<frac|1|2>><rsup|+>|]>-<frac|1|2>*\<lambda\><rsub|e+<frac|1|2>>*<around|[|<with|color|red|u<rsub|e+<frac|1|2>><rsup|+>>-<with|color|red|u<rsub|e+<frac|1|2>><rsup|->>|]>.
      </equation*>
    </shown>|<\shown>
      <with|font-series|bold|Dissipation 2> flux <cite|oldpaper>

      <\equation*>
        F<rsub|e+<frac|1|2>>=<frac|1|2>*<around|[|F<rsub|e+<frac|1|2>><rsup|->+F<rsub|e+<frac|1|2>><rsup|+>|]>-<frac|1|2>*\<lambda\><rsub|e+<frac|1|2>>*<around|[|<with|color|red|U<rsub|e+<frac|1|2>><rsup|+>>-<with|color|red|U<rsub|e+<frac|1|2>><rsup|->>|]>.
      </equation*>

      where

      <\equation*>
        U=u+<frac|\<mathLaplace\>t|2>u<rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>u<rsub|t*t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N|u|t>\<approx\><frac|1|\<mathLaplace\>t><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>u<rsub|h>*
        d t.
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Extension to 2-D>

    <with|font-base-size|7|<unroll|<\shown>
      <\equation*>
        u<rsub|t>+f<around*|(|u|)><rsub|x>+g<around*|(|u|)><rsub|y>=0
      </equation*>
    </shown>|<\hidden*>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|u<rsup|n+1>=u<rsup|n>-\<mathLaplace\>t*<around*|[|<pdv|F|x><around*|(|u<rsup|n>|)>+<pdv|G|y><around*|(|u<rsup|n>|)>|]>+O<around*|(|\<mathLaplace\>t<rsup|n>|)>>>|<row|<cell|F<around*|(|u|)>=<big|sum><rsub|m:1><rsup|N+1><frac|\<mathLaplace\>t<rsup|m>|<around*|(|m+1|)>!>*\<partial\><rsub|t><rsup|m>f<around*|(|u|)>,<space|2em>G<around*|(|u|)>=<big|sum><rsub|m=1><rsup|N+1><frac|\<mathLaplace\>t<rsup|m>|<around*|(|m+1|)>!>*\<partial\><rsub|t><rsup|m>g<around*|(|u|)>>>>>>
      </equation*>
    </hidden*>|<\hidden*>
      <with|font-base-size|7|<\equation*>
        <tabular*|<tformat|<table|<row|<cell|u<rsub|h><rsup|<with|font-series|bold|e>>=<big|sum><rsub|i,j=1><rsup|N+1>u<rsub|i\<nocomma\>j><rsup|<with|font-series|bold|e>>*\<ell\><rsub|i><around*|(|\<xi\>|)>*\<ell\><rsub|j><around*|(|\<eta\>|)>,>>|<row|<cell|F<rsub|h><rsup|\<delta\>><around*|(|\<xi\>,\<eta\>|)>=<big|sum><rsub|i,j=1><rsup|N+1>F<rsub|i\<nocomma\>j>*\<ell\><rsub|i><around*|(|\<xi\>|)>*\<ell\><rsub|j><around*|(|\<eta\>|)>,<space|2em>G<rsub|h><rsup|\<delta\>><around*|(|\<xi\>,\<eta\>|)>=<big|sum><rsub|i,j=1><rsup|N+1>G<rsub|i\<nocomma\>j>*\<ell\><rsub|i><around*|(|\<xi\>|)>*\<ell\><rsub|j><around*|(|\<eta\>|)>.>>>>>
      </equation*>>
    </hidden*>|<\hidden*>
      <with|font-base-size|7|<\equation*>
        <tabular*|<tformat|<table|<row|<cell|F<rsub|h><rsup|<with|font-series|bold|e>><around*|(|\<xi\>,\<eta\><rsub|j>|)>=<around|[|F<rsub|e<rsub|x>-<frac|1|2>,j>-F<rsub|h><rsup|\<delta\>><around*|(|0,\<eta\><rsub|j>|)>|]>*g<rsub|L><around*|(|\<xi\>|)>+F<rsub|h><rsup|\<delta\>><around*|(|\<xi\>,\<eta\><rsub|j>|)>+<around|[|F<rsub|e<rsub|x>+<frac|1|2>,j>-F<rsub|h><rsup|\<delta\>><around*|(|1,\<eta\><rsub|j>|)>|]>*g<rsub|R><around*|(|\<xi\>|)>,>>|<row|<cell|G<rsub|h><rsup|<with|font-series|bold|e>><around*|(|\<xi\><rsub|i>,\<eta\>|)>=<around|[|G<rsub|i,e<rsub|y>-<frac|1|2>>-G<rsub|h><rsup|\<delta\>><around*|(|\<xi\><rsub|i>,0|)>|]>*g<rsub|L><around*|(|\<eta\>|)>+G<rsub|h><rsup|\<delta\>><around*|(|\<xi\><rsub|i>,\<eta\>|)>+<around|[|G<rsub|i,e<rsub|y>+<frac|1|2>>-G<rsub|h><rsup|\<delta\>><around*|(|\<xi\><rsub|i>,1|)>|]>*g<rsub|R><around*|(|\<eta\>|)>.>>>>>
      </equation*>>
    </hidden*>|<\hidden*>
      <with|font-base-size|7|<\equation*>
        u<rsub|i\<nocomma\>j><rsup|n+1>=u<rsub|i\<nocomma\>j><rsup|n>-\<mathLaplace\>t*<around*|[|<pdv|F<rsub|h>|x><around*|(|\<xi\><rsub|i>,\<eta\><rsub|j>|)>+<pdv|G<rsub|h>|y><around*|(|\<xi\><rsub|i>,\<eta\><rsub|j>|)>|]>,<space|2em>1\<leq\>i,j\<leq\>N+1.
      </equation*>>
    </hidden*>>>
  </hidden>|<\hidden>
    <tit|Blending limiter (Hennemann Et Al. <cite|HENNEMANN2021109935>)>

    <unroll-compressed|<\shown>
      High order LWFR update

      <\equation*>
        <with|font-series|bold|u><rsub|e><rsup|H,n+1>=<with|font-series|bold|u><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><with|font-series|bold|R><rsub|e><rsup|H>.
      </equation*>
    </shown>|<\shown>
      Lower order subcell update (FO FVM or MUSCL-Hancock)

      <\equation*>
        <with|font-series|bold|u><rsub|e><rsup|L,n+1>=<with|font-series|bold|u><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><with|font-series|bold|R><rsub|e><rsup|L>.
      </equation*>
    </shown>|<\shown>
      Blend residual with <math|\<alpha\><rsub|e>\<in\><around*|[|0,1|]>>

      <\equation*>
        <with|font-series|bold|R><rsub|e>=<around*|(|1-\<alpha\><rsub|e>|)>*<with|font-series|bold|R><rsub|e><rsup|H>+\<alpha\><rsub|e>*<with|font-series|bold|R><rsub|e><rsup|L>,
      </equation*>

      Limited update

      <\equation*>
        <with|font-series|bold|u><rsub|e><rsup|n+1>=<with|font-series|bold|u><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><with|font-series|bold|R><rsub|e>.
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Choice of <math|\<alpha\><rsub|e>> : Smoothness indicator (Hennemann
    Et Al. <cite|HENNEMANN2021109935>)>

    <unroll|<\shown>
      Legendre expansion of degree <math|N> polynomial
      <math|\<epsilon\>=\<epsilon\><around*|(|\<xi\>|)>>

      <\equation*>
        \<epsilon\>=<big|sum><rsub|j=1><rsup|N+1>m<rsub|j>L<rsub|j>,<space|2em>m<rsub|j>=<around*|\<langle\>|\<epsilon\>,L<rsub|j>|\<rangle\>><rsub|L<rsup|2>>,
      </equation*>

      Energy content (Persson and Peraire <cite|Persson2006>)

      <\equation*>
        \<bbb-E\>:=max<around*|(|<frac|m<rsub|N+1><rsup|2>|\<beta\><rsub|1>m<rsub|1><rsup|2>+<big|sum><rsub|j=2><rsup|N+1>m<rsub|j><rsup|2>>,<frac|m<rsub|N><rsup|2>|\<beta\><rsub|2>m<rsub|1><rsup|2>+<big|sum><rsub|j=2><rsup|N>m<rsub|j><rsup|2>>|)>.
      </equation*>
    </shown>|<\shown>
      In literature, <math|\<beta\><rsub|1>=\<beta\><rsub|2>=1>.
    </shown>|<\shown>
      <\equation*>
        \<epsilon\>=\<rho\>*p
      </equation*>
    </shown>|<\shown>
      <\wide-tabular>
        <tformat|<cwith|1|1|2|2|cell-valign|c>|<table|<row|<\cell>
          <image|illustrations/alpha_func.pdf|0.42par|||>
        </cell>|<\cell>
          <\equation*>
            \;
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
    <tit|Lower order update>

    <unroll-greyed|<\shown>
      <center|<image|illustrations/subcells.pdf|0.51par|||>>
    </shown>|<\shown>
      Subcell <math|<around|[|x<rsub|j-<frac|1|2>><rsup|e>,x<rsub|j+<frac|1|2>><rsup|e>|]>>

      <\equation*>
        x<rsub|j+<frac|1|2>><rsup|e>-x<rsub|j-<frac|1|2>><rsup|e>=\<mathLaplace\>x<rsub|e>*w<rsub|j>,<space|2em>1\<leq\>j\<leq\>N+1,
      </equation*>

      where <math|<around*|{|w<rsub|j>|}><rsub|j:1><rsup|N+1>> are the
      Gauss-Legendre quadrature weights.
    </shown>|<\shown>
      <center|<math|<tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-valign|c>|<cwith|1|1|3|3|cell-valign|c>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|<around*|(|1-<wide|\<alpha\>|\<wide-bar\>>|)>*F<rsup|LW><rsub|e-<frac|1|2>>+<wide|\<alpha\>|\<wide-bar\>>*f<rsub|<frac|1|2>><rsub|>>>|<cell|<image|illustrations/subcells_fvm.pdf|0.51par|||>>|<cell|<with|color|red|<around*|(|1-<wide|\<alpha\>|\<wide-bar\>>|)>*F<rsup|LW><rsub|e+<frac|1|2>>+<wide|\<alpha\>|\<wide-bar\>>*f<rsub|N+<frac|3|2>><rsub|>>>>>>>>>
    </shown>|<\shown>
      <\equation*>
        <large|<wide|u|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around|(|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|)>>.
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Interface numerical flux>

    <unroll-greyed|<\shown>
      Initial candidate

      <\equation*>
        <wide|<with|font-series|bold|F>|~><rsub|e+<frac|1|2>>=<around*|(|1-\<alpha\><rsub|e+<frac|1|2>>|)>*<with|font-series|bold|F><rsub|e+<frac|1|2>><rsup|LW>+\<alpha\><rsub|e+<frac|1|2>>*<with|font-series|bold|f><rsub|e,N+3/2>,<space|2em>\<alpha\><rsub|e+<frac|1|2>>=<frac|1|2><around*|(|\<alpha\><rsub|e>+\<alpha\><rsub|e+1>|)>.
      </equation*>
    </shown>|<\shown>
      Lower order update of last solution point of cell <math|e>

      <\equation*>
        <wide|<bu>|~><rsup|n+1>=<bu><rsub|e,N+1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>w<rsub|N+1>><around*|(|<wide|<with|font-series|bold|F>|~><rsub|e+<frac|1|2>>-<with|font-series|bold|f><rsub|e,N+1/2>|)>.
      </equation*>
    </shown>|<\shown>
      Assume <with|color|red|concave> <math|p> such that

      <\equation*>
        \<cal-U\><rsub|ad>=<around*|{|<bw>\<in\>\<Omega\>:p<rsub|i><around*|(|<with|font-series|bold|u>|)>\<gtr\>0|}>.
      </equation*>
    </shown>|<\shown>
      For purely low order

      <\equation*>
        <wide|<bu>|~><rsub|low><rsup|n+1>=<bu><rsub|e,N+1><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>w<rsub|N+1>><around*|(|<with|font-series|bold|f><rsub|e,N+3/2>-<with|font-series|bold|f><rsub|e,N+1/2>|)>\<in\>\<cal-U\><rsub|ad>.
      </equation*>
    </shown>|<\shown>
      Thus, for

      <\equation*>
        \<theta\>=min<around*|(|<around*|\||<frac|\<epsilon\>-p<around*|(|<wide|<bu>|~><rsub|low><rsup|n+1>|)>|p<around*|(|<wide|<bu>|~><rsup|n+1>|)>-p<around*|(|<wide|<bu>|~><rsub|low><rsup|n+1>|)>>|\|>,1|)>,
      </equation*>

      we will have

      <\equation*>
        p<around*|(|\<theta\>*<wide|<bu>|~><rsup|n+1>+<around*|(|1-\<theta\>|)>*<bu><rsub|low><rsup|n+1>|)>\<geq\>\<theta\>*p<around*|(|*<wide|<bu>|~><rsup|n+1>|)>+<around*|(|1-\<theta\>|)>*p<around*|(|<bu><rsub|low><rsup|n+1>|)>\<gtr\>\<epsilon\>.
      </equation*>
    </shown>|<\shown>
      Finally choose

      <\equation*>
        <with|font-series|bold|F><rsub|e+<frac|1|2>>=\<theta\>*<wide|<with|font-series|bold|F>|~><rsub|e+<frac|1|2>>+<around*|(|1-\<theta\>|)>*<with|font-series|bold|f><rsub|e,N+3/2>.
      </equation*>
    </shown>>
  </hidden>|<\shown>
    <tit|Extension of Zhang-Shu's limiter to Lax-Wendroff schemes>

    <unroll-greyed|<\shown>
      Low order residual

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<around*|(|<wide|<bw>|~><rsub|1><rsup|e>|)><rsup|n+1>=<around*|(|<bw><rsub|1><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|1>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|<frac|3|2>>-F<rsub|e-<frac|1|2>>|]>,>>|<row|<cell|<around*|(|<wide|<bw>|~><rsub|j><rsup|e>|)><rsup|n+1>=<around*|(|<bw><rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|j>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|j+<frac|1|2>>-f<rsub|j-<frac|1|2>>|]>,<space|2em>2\<leq\>j\<leq\>N,>>|<row|<cell|<around*|(|<wide|<bw>|~><rsub|N><rsup|e>|)><rsup|n+1>=<around*|(|<bw><rsub|N><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|N+1>*\<mathLaplace\>x<rsub|e>><around*|[|F<rsub|e+<frac|1|2>>-f<rsub|N-<frac|1|2>>|]>.>>>>>
      </equation*>
    </shown>|<\hidden*>
      By appropriate of <math|F<rsub|e\<pm\><frac|1|2>>>,

      <\equation*>
        <around*|(|<wide|<bw>|~><rsup|e><rsub|j>|)><rsup|n+1>\<in\>\<cal-U\><rsub|ad>,<space|2em>1\<leq\>j\<leq\>N+1.
      </equation*>
    </hidden*>|<\hidden*>
      <\equation*>
        \<Rightarrow\><wide|<bw>|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|<bw>|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around*|(|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|)>=<big|sum><rsub|j=1><rsup|N+1>w<rsub|j>*<wide|<bw>|~><rsub|j><rsup|n+1>\<in\>\<cal-U\><rsub|ad>.
      </equation*>
    </hidden*>|<\hidden*>
      Zhang-Shu's limiter applies.
    </hidden*>|<\hidden*>
      Similar approach used by Rossmanith Et Al. <cite|Felton2018-ip>.
    </hidden*>|<\hidden*>
      We can also aposteriorily modify <math|\<alpha\><rsub|e>> (Gassner and
      Ramírez <cite|Rueda-Ramirez2021-ib>).
    </hidden*>>

    \;
  </shown>|<\hidden>
    <tit|Low order residual : MUSCL-Hancock>

    <unroll|<\shown>
      <center|<image|illustrations/subcells.pdf|0.4par|||>>
    </shown>|<\hidden*>
      Integrate conservation law <math|I<rsup|e><rsub|j>\<times\><around*|[|t<rsup|n>,t<rsup|n+1>|]>>

      <\equation*>
        \<mathLaplace\>x<rsub|e>*w<rsub|j>*<around*|(|<bw><rsub|j><rsup|n+1>-<bw><rsub|j><rsup|n>|)>+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around|(|<with|font-series|bold|f><rsub|j+<frac|1|2>>-<with|font-series|bold|f><rsub|j-<frac|1|2>>|)>*d\<nocomma\>t=0.
      </equation*>
    </hidden*>|<\hidden*>
      Using the mid-point rule

      <\equation*>
        <bw><rsub|j><rsup|n+1>=<bw><rsub|j><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>w<rsub|j>>*<around*|(|<with|font-series|bold|f><rsub|j+1/2><rsup|n+1/2>-<with|font-series|bold|f><rsub|j-1/2><rsup|n+1/2>|)>
      </equation*>
    </hidden*>|<\hidden*>
      <\equation*>
        <with|font-series|bold|f><rsub|j+1/2><rsup|n+1/2>=<with|font-series|bold|f><around*|(|<bw><rsub|j+1/2-><rsup|n+1/2>,<bw><rsub|j+1/2+><rsup|n+1/2>|)>
      </equation*>
    </hidden*>|<\hidden*>
      <\equation*>
        <bw><rsub|j-<frac|1|2>+><rsup|n+1/2>=<bw><rsub|j-<frac|1|2>+><rsup|n>-<frac|\<mathLaplace\>t|2>*<frac|f<around|(|<bw><rsub|j+<frac|1|2>+>|)>-f<around|(|<bw><rsub|j-<frac|1|2>->|)>|x<rsub|j+<frac|1|2>>-x<rsub|j-<frac|1|2>>>,<space|1em><bw><rsub|j+<frac|1|2>-><rsup|n+1/2>=<bw><rsub|j+<frac|1|2>-><rsup|n>-<frac|\<mathLaplace\>t|2>*<frac|f<around|(|<bw><rsub|j+<frac|1|2>->|)>-f<around|(|<bw><rsub|j-<frac|1|2>+>|)>|x<rsub|j+<frac|1|2>>-x<rsub|j-<frac|1|2>>>.
      </equation*>

      \;
    </hidden*>|<\hidden*>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<bw><rsub|j-<frac|1|2>+>=<bw><rsub|j><around|(|x<rsub|j-<frac|1|2>>|)>,<space|1em><bw><rsub|j+<frac|1|2>->=<bw><rsub|j><around|(|x<rsub|j+<frac|1|2>>|)>>>|<row|<cell|<bw><rsub|j><around*|(|x|)>=<bw><rsub|j><rsup|n>+<with|font-series|bold|\<sigma\>><rsub|j>*<around*|(|x-x<rsub|j>|)>>>>>>
      </equation*>
    </hidden*>|<\hidden*>
      <\equation*>
        <tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<with|font-series|bold|\<sigma\>><rsub|j>=minmod<around*|(|\<beta\><rsub|e>*<frac|<bw><rsub|j+1>-<bw><rsub|j>|x<rsub|j+1>-x<rsub|j>>,D<rsub|cent><around*|(|<bw>|)><rsub|j>,\<beta\><rsub|e>*<frac|<bw><rsub|j><rsup|n>-<bw><rsub|j-1><rsup|n>|x<rsub|j>-x<rsub|j-1>>|)>>>|<row|<cell|\<beta\><rsub|e>=2-\<alpha\><rsub|e>>>>>>
      </equation*>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|Admissibility of low order method>

    <center|<image|illustrations/1dgrid_cells.pdf|0.6par|||>>

    <\theorem*>
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
        <bw><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<cal-U\><rsub|ad>.
      </equation*>

      Then, under <with|color|blue|appropriate> time step restrictions, the
      updated solution <math|<bw><rsub|i><rsup|n+1>>, defined by the
      MUSCL-Hancock procedure is in <math|\<cal-U\><rsub|ad>>.
    </theorem*>
  </hidden>|<\hidden>
    <tit|Generalizing Berthon's proof>

    <unroll|<\shown>
      Berthon defined <math|<bw><rsub|i><rsup|\<ast\>,\<pm\>>>

      <\equation*>
        <frac|1|2><bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<pm\>>+<frac|1|2><bw><rsub|i><rsup|n,+>=2<bw><rsub|i><rsup|n,\<pm\>>.
      </equation*>
    </shown>|<\hidden*>
      Our generalization

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<with|color|red|\<mu\><rsup|->>*<bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<pm\>>+<with|color|red|\<mu\><rsup|+>>*<bw><rsub|i><rsup|n,+>=2<bw><rsub|i><rsup|n,\<pm\>>,>>>>>
      </equation*>

      where

      <\equation*>
        <with|color|red|\<mu\><rsup|->>=<frac|x<rsub|i+1/2>-x<rsub|i>|x<rsub|i+1/2>-x<rsub|i-1/2>>,<space|1em><with|color|red|\<mu\><rsup|+>>=<frac|x<rsub|i>-x<rsub|i-1/2>|x<rsub|i+1/2>-x<rsub|i-1/2>>.
      </equation*>
    </hidden*>|<\hidden*>
      For <with|font-series|bold|conservative reconstruction>

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
    <tit|Idea of proof>

    <unroll|<\shown>
      <\center>
        <image|illustrations/non_interacting_rp1.pdf|0.65par|||>
      </center>
    </shown>|<\hidden*>
      <\equation*>
        <small|<frac|1|\<mathLaplace\>x<rsub|i>><big|int><rsub|x<rsub|i-1/2>><rsup|x<rsub|i+1/2>><bw><rsup|h><around*|(|x,\<mathLaplace\>t/2|)>*d
        x=<bw><rsub|i><rsup|n+<frac|1|2>,+>>
      </equation*>
    </hidden*>|<\hidden*>
      <center|<small|<math|<with|font-base-size|8|<small|<with|color|red|<frac|\<mu\><rsup|->|2>*><bw><rsub|i><rsup|n+<frac|1|2>,->+<frac|1|2>*<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+<with|color|red|<frac|\<mu\><rsup|+>|2>>*<bw><rsub|i><rsup|n+<frac|1|2>,+>=<bw><rsub|i><rsup|n>.>>>>>

      <\center>
        <image|illustrations/fv_evolution.pdf|0.63par|||>
      </center>
    </hidden*>>

    \;
  </hidden>|<\hidden>
    <tit|Enforcing slope restriction>

    <unroll|<\shown>
      Given candidate slope <math|<with|font-series|bold|\<sigma\>><rsub|i>>,

      <\equation*>
        <bw><rsub|i><rsup|\<ast\>,\<pm\>>:=<bw><rsub|i><rsup|n>+2*<around*|(|x<rsub|i\<pm\>1/2>-x<rsub|i>|)>*<with|font-series|bold|\<sigma\>><rsub|i>.
      </equation*>

      Find <math|\<theta\>\<in\><around*|[|0,1|]>>

      <\equation*>
        <bw><rsub|i><rsup|n>+2*<around*|(|x<rsub|i\<pm\>1/2>-x<rsub|i>|)>*\<theta\>*<with|font-series|bold|\<sigma\>><rsub|i>\<in\>\<cal-U\><rsub|ad>
      </equation*>

      by Zhang-Shu type procedure.
    </shown>>
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
        <big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><big|int><rsub|I<rsub|e>><rsup|><around*|(|\<partial\><rsub|t>u<rsub|h>+\<partial\><rsub|x>f<around*|(|u<rsub|h>|)>|)>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t=0
      </equation*>
    </shown>|<\hidden*>
      Integrate by parts in space

      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n+1>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x>|<cell|=>|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n>*\<ell\><rsub|i><around*|(|\<xi\>|)>*d
        x+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|I<rsub|e>><wide|f|~><rsub|h>\<partial\><rsub|x>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t>>|<row|<cell|>|<cell|>|<cell|<space|1em>+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><with|color|blue|f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>>\<ell\><rsub|i><around*|(|0|)>d
        t-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><with|color|blue|f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>>\<ell\><rsub|i><around*|(|1|)>d
        t.>>>>>
      </equation*>
    </hidden*>|<\hidden*>
      FR form

      <\equation*>
        <math|<tabular*|<tformat|<cwith|1|1|2|2|cell-halign|r>|<cwith|1|1|4|4|cell-halign|l>|<cwith|2|2|4|4|cell-halign|l>|<cwith|3|3|4|4|cell-halign|l>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|u<rsub|i><rsup|n>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>\<partial\><rsub|x><wide|f|~><rsub|h><around*|(|\<xi\><rsub|i>,\<tau\>|)>
        \ d t>>|<row|<cell|\<Rightarrow\>>|<cell|u<rsub|i><rsup|n+1>>|<cell|=>|<cell|<space|1em>-<with|color|blue|g<rsub|L><rprime|'><around*|(|\<xi\><rsub|i>|)>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|0,\<tau\>|)>d
        t>>|<row|<cell|>|<cell|>|<cell|>|<cell|<space|1em>-<with|color|blue|g<rsub|R><rprime|'><around*|(|\<xi\><rsub|i>|)>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>
        -<wide|f|~><rsub|h><around*|(|1,\<tau\>|)>d t>>>>>>
      </equation*>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|ADER and LWFR-D2 for constant linear advection>

    <unroll|<\shown>
      For

      <\equation*>
        u<rsub|t>+u<rsub|x>=0,
      </equation*>

      ADER update

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
      LWFR-D2 update

      <\equation>
        u<rsub|i><rsup|n+1>=u<rsub|i><rsup|n>-\<mathLaplace\>t*<around*|[|\<partial\><rsub|x>U<rsub|h><around*|(|\<xi\><rsub|i>|)>-g<rsub|L><rprime|'><around*|(|\<xi\><rsub|i>|)><around*|[|f<around|(|U<rsub|e-<frac|1|2>><rsup|->,U<rsub|e-<frac|1|2>><rsup|+>|)>-U<rsub|h><around*|(|0|)>|]>-g<rsub|R><rprime|'><around*|(|\<xi\><rsub|i>|)><around*|[|f<around|(|U<rsub|e+<frac|1|2>><rsup|->,U<rsub|e+<frac|1|2>><rsup|+>|)>-U<rsub|h><around*|(|1|)>|]>|]>,<label|eq:lwfr.linear.update>
      </equation>

      where

      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|U<rsub|h><rsup|n>>|<cell|=>|<cell|u+<frac|\<mathLaplace\>t|2>u<rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>u<rsub|t\<nocomma\>t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N|u|t>>>|<row|<cell|>|<cell|=>|<cell|u-<frac|\<mathLaplace\>t|2>u<rsub|x>+<frac|\<mathLaplace\>t<rsup|2>|3!>u<rsub|x\<nocomma\>x>+\<cdots\>+<around*|(|-1|)><rsup|N><frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N|u|x>.>>>>>
      </equation*>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|Equivalence of ADER-FR and LWFR-D2 for linear case>

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

        Thus, the ADER update <eqref|eq:ader.linear.update> and the LWFR-D2
        update <eqref|eq:lwfr.linear.update> are the same.<space|2em><qed>
      </shown>>
    </hidden*>>

    \;

    \;
  </hidden>|<\hidden>
    <tit|Equivalence of ADER-FR and LWFR for linear case>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|4|1|-1|cell-halign|c>|<cwith|5|5|1|-1|cell-halign|c>|<table|<row|<\cell>
        <tabular*|<tformat|<table|<row|<cell|<math|u<rsub|0><around*|(|x|)>=e<rsup|-10*x<rsup|2>>*sin<around*|(|10*\<pi\>*x|)>>,
        on periodic <math|<around*|[|-1,1|]>> with <math|120>
        dofs>>|<row|<cell|>>>>>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/equivalence_ader/error1.pdf|0.4par|||>
      </cell>|<\cell>
        <image|figures/equivalence_ader/error2.pdf|0.4par|||>
      </cell>>|<row|<\cell>
        <math|N=1>
      </cell>|<\cell>
        <math|N=2>
      </cell>>|<row|<\cell>
        <image|figures/equivalence_ader/error3.pdf|0.4par|||>
      </cell>|<\cell>
        <image|figures/equivalence_ader/error4.pdf|0.4par|||>
      </cell>>|<row|<\cell>
        <math|N=3>
      </cell>|<\cell>
        <math|N=4>
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|Equivalence of ADER-FR and LWFR for linear case>

    <\wide-tabular>
      <tformat|<cwith|3|3|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|4|4|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|5|5|1|1|cell-halign|c>|<cwith|5|5|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <tabular*|<tformat|<table|<row|<cell|<math|u<rsub|0><around*|(|x|)>=e<rsup|-10*x<rsup|2>>*sin<around*|(|10*\<pi\>*x|)>>,
        on <with|color||periodic <math|<around*|[|-1,1|]>>> with 120
        dofs>>|<row|<cell|>>>>>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/equivalence_ader/energy1.pdf|0.4par|||>
      </cell>|<\cell>
        <image|figures/equivalence_ader/energy2.pdf|0.4par|||>
      </cell>>|<row|<\cell>
        <math|N=1>
      </cell>|<\cell>
        <math|N=2>
      </cell>>|<row|<\cell>
        <image|figures/equivalence_ader/energy3.pdf|0.4par|||>
      </cell>|<\cell>
        <image|figures/equivalence_ader/energy4.pdf|0.4par|||>
      </cell>>|<row|<\cell>
        <math|N=3>
      </cell>|<\cell>
        <math|N=4>
      </cell>>>>
    </wide-tabular>
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
          <around*|\<\|\|\>|u<rsup|n+1><rsub|ADER>-u<rsup|n+1><rsub|LW>|\<\|\|\>><rsub|\<infty\>>=O<around*|(|\<mathLaplace\>t<rsup|N+1>|)>.
        </equation*>
      </theorem>
    </shown>>

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
      <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|5|5|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|u<rsub|t>+u<rsub|x>>|<cell|=>|<cell|0,>|<cell|<space|1em>>|<cell|x\<in\><around*|[|-1,1|]>,<space|1em>t\<gtr\>0,>>|<row|<cell|u<rsub|0><around*|(|x|)>>|<cell|=>|<cell|sin<around*|(|2*\<pi\>*x|)>.>|<cell|>|<cell|>>>>>
    </equation*>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <image|figures/scalar/convergence_pure_fv.pdf|0.5par|||>
      </cell>>>>
    </wide-tabular>

    \;
  </hidden>|<\hidden>
    <tit|Optimal convergence with limiter>

    <\equation*>
      <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|5|5|cell-halign|l>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|u<rsub|t>+u<rsub|x>>|<cell|=>|<cell|0,>|<cell|<space|1em>>|<cell|x\<in\><around*|[|-2,2|]>,<space|1em>t\<gtr\>0,>>|<row|<cell|u<rsub|0><around*|(|x|)>>|<cell|=>|<cell|e<rsup|-10*x<rsup|2>>*sin<around*|(|10*\<pi\>*x|)>,>|<cell|>|<cell|x\<in\><around*|[|-2,2|]>.>>>>>
    </equation*>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <image|figures/scalar/convergence_wpack.pdf|0.5par|||>
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|Composite signal>

    \;

    \;

    \;

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
        <image|figures/scalar/composite_good_only.pdf|0.8par|||>
      </cell>>|<row|<\cell>
        Indicator parameters - <math|\<beta\><rsub|1>=0.1,\<beta\><rsub|2>=1.0>
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <switch|<\shown>
      \;

      \;

      \;

      \;

      \;

      \;

      \;

      \;

      \;

      \;

      <doc-data|<doc-title|<with|font-base-size|10|<huge|1-D Euler's
      equations>>>>

      <\equation*>
        <huge|<tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|\<rho\>>|<cell|\<rightarrow\>>|<cell|density>>|<row|<cell|v>|<cell|\<rightarrow\>>|<cell|velocity>>|<row|<cell|p>|<cell|\<rightarrow\>>|<cell|pressure>>>>>>
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Shu-Osher <cite|Shu1989>>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <image|figures/euler1d/shuosher.pdf|0.7par|||>
      </cell>>>>
    </wide-tabular>

    Transmissive boundary conditions on <math|<around*|[|-5,5|]>> with

    <\equation*>
      <around*|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|(3.857143,
      2.629369, 10.333333),>|<cell|<space|1em>>|<cell|if
      x\<less\>-4,>>|<row|<cell|(1+0.2*sin(5x),0,1),>|<cell|>|<cell|if
      x\<geq\>-4.>>>>>
    </equation*>
  </hidden>|<\hidden>
    <tit|Blast wave <cite|Woodward1984>>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        <image|figures/euler1d/blast.pdf|0.7par|||>
      </cell>>>>
    </wide-tabular>

    Solid wall boundary conditions on <math|<around*|[|0,1|]>> with intial
    condition

    <\equation*>
      <around*|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|1,0,1000|)>,>|<cell|<space|1em>>|<cell|if
      x\<less\>0.1,>>|<row|<cell|<around*|(|1,0,0.01|)>,>|<cell|>|<cell|0.1\<less\>x\<less\>0.9,>>|<row|<cell|<around*|(|1,0,100|)>,>|<cell|>|<cell|x\<gtr\>0.9.>>>>>
    </equation*>
  </hidden>|<\hidden>
    <tit|Sedov's blast wave <cite|SEDOV1959146>>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<table|<row|<\cell>
        <image|figures/euler1d/sedov_density.pdf|0.5par|||>
      </cell>|<\cell>
        <image|figures/euler1d/sedov_pressure.pdf|0.5par|||>
      </cell>>>>
    </wide-tabular>

    We impose transmissive boundary conditions with initial data

    <\equation*>
      \<rho\><around*|(|x|)>=1,<space|1em>v<around*|(|x|)>=0,<space|1em>p<around*|(|x|)>=<choice|<tformat|<table|<row|<cell|<around*|(|\<gamma\>-1|)><frac|3.2\<times\>10<rsup|6>|\<mathLaplace\>x>,>|<cell|<space|1em>>|<cell|<around*|\||x|\|>\<leq\><frac|\<mathLaplace\>x|2>,>>|<row|<cell|<around*|(|\<gamma\>-1|)>10<rsup|-12>,>|<cell|>|<cell|otherwise.>>>>>
    </equation*>
  </hidden>|<\hidden>
    <tit|Double rarefaction>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<table|<row|<\cell>
        <image|figures/euler1d/double_rarefaction.pdf|0.49par|||>
      </cell>|<\cell>
        <image|figures/euler1d/double_rarefaction_pressure.pdf|0.49par|||>
      </cell>>>>
    </wide-tabular>

    We impose transmissive boundary conditions with intial conditions

    <\equation*>
      <around*|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|7,-1,0.2|)>,>|<cell|<space|1em>>|<cell|if
      x\<less\>0,>>|<row|<cell|<around*|(|7,1,0.2|)>,>|<cell|>|<cell|if
      x\<gtr\>0.>>>>>
    </equation*>
  </hidden>|<\hidden>
    <tit|Leblanc's test>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<table|<row|<\cell>
        <image|figures/euler1d/leblanc.pdf|0.49par|||>
      </cell>|<\cell>
        <image|figures/euler1d/leblanc_pressure.pdf|0.49par|||>
      </cell>>>>
    </wide-tabular>

    We impose transmissive boundary conditions with intial conditions

    <\equation*>
      <around*|(|\<rho\>,v,p|)>=<choice|<tformat|<table|<row|<cell|<around*|(|2,0,10<rsup|9>|)>,>|<cell|<space|1em>>|<cell|if
      x\<less\>0,>>|<row|<cell|<around*|(|0.001,0,1|)>,>|<cell|>|<cell|if
      x\<gtr\>0.>>>>>
    </equation*>
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

    \;

    <doc-data|<doc-title|<with|font-base-size|12|2-D Results>>>

    \;
  </hidden>|<\hidden>
    <tit|2-D Composite signal <cite|LeVeque1996>>

    <\wide-tabular>
      <tformat|<cwith|2|2|1|1|cell-row-span|1>|<cwith|2|2|1|1|cell-col-span|2>|<cwith|4|4|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-row-span|1>|<cwith|3|3|1|1|cell-col-span|2>|<cwith|3|3|1|1|cell-halign|c>|<cwith|5|5|1|1|cell-halign|c>|<cwith|5|5|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<table|<row|<\cell>
        <math|t=2*\<pi\>,<space|1em>NC=100\<times\>100,<space|1em>N=4>\ 
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/la2d/rotate_composite/initial.pdf|0.32par|||>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        Initial State
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/la2d/rotate_composite/tvb.pdf|0.32par|||>
      </cell>|<\cell>
        <image|figures/la2d/rotate_composite/blend.pdf|0.32par|||>
      </cell>>|<row|<\cell>
        <math|TVB-100>
      </cell>|<\cell>
        MUSCL-Hancock
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|Double Mach reflection <cite|Woodward1984>>

    \;

    \;

    \;

    \;

    <center|<with|gr-mode|<tuple|edit|math-at>|gr-frame|<tuple|scale|1cm|<tuple|0.509999gw|0.499999gh>>|gr-geometry|<tuple|geometry|0.869569par|0.295651par|center>|gr-color|<pattern|X/TeXmacs/misc/patterns/vintage/wood-xdark.png|1gu|>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-arrow-end|\<gtr\>|<graphics||<with|fill-color|<pattern|X/TeXmacs/misc/patterns/vintage/granite-dark.png|1gu|>|<cline|<point|2.74291|-2.6609>|<point|9.93232315185844|-0.105626073611297>|<point|9.97129717354466|-2.59786247037373>>>|<with|color|white|<math-at|<with|color|white|30<degreesign>>|<point|5.82234753274243|-2.23424064029634>>>|<line|<point|2.74291|-2.6609>|<point|-9.79876637121312|-2.63641023944966>>|<with|color|red|dash-style|10|<arc|<point|5.43925|-1.70256>|<point|5.66096705913481|-2.09100079375579>|<point|5.39989205957517|-2.63772891338334>>>|<with|color|<pattern|X/TeXmacs/misc/patterns/vintage/wood-xdark.png|1gu|>|dash-style|11100|<line|<point|1|-2.6575>|<point|1.0|1.0>>>|<with|arrow-end|\<gtr\>|color|<pattern|X/TeXmacs/misc/patterns/vintage/wood-xdark.png|1gu|>|<line|<point|0|1.5>|<point|2.0|1.5>>>|<with|color|<pattern|X/TeXmacs/misc/patterns/vintage/wood-xdark.png|1gu|>|<math-at|M=10|<point|0.2|1.7>>>>>>

    \;

    \;

    \;

    <with|font-base-size|12|<center|<hlink|Animation
    link|https://www.youtube.com/watch?v=tN26f4C7zpo>>>
  </hidden>|<\hidden>
    <tit|Double Mach Reflection>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|5|5|1|1|cell-halign|c>|<cwith|6|6|1|1|cell-halign|c>|<table|<row|<\cell>
        <math|t=0.2>, NC = <math|568\<times\>142>, Rusanov, <math|N=4>
      </cell>>|<row|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/euler2d/dmr/trixi_zoomed.pdf|0.44par|||>
      </cell>>|<row|<\cell>
        <verbatim|Trixi.jl>
      </cell>>|<row|<\cell>
        <image|figures/euler2d/dmr/mh_zoomed.pdf|0.44par|||>
      </cell>>|<row|<\cell>
        LWFR
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|Double Mach Reflection>

    <\wide-tabular>
      <tformat|<cwith|1|-1|1|1|cell-halign|c>|<table|<row|<\cell>
        <math|t=0.2>, NC=<math|568\<times\>142>, LWFR, <math|N=4>
      </cell>>|<row|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/euler2d/dmr/mh_hllc_zoomed.pdf|0.44par|||>
      </cell>>|<row|<\cell>
        HLLC, <math|\<beta\><rsub|1>=0.1,\<beta\><rsub|2>=1.0>
      </cell>>|<row|<\cell>
        <image|figures/euler2d/dmr/mh_zoomed.pdf|0.44par|||>
      </cell>>|<row|<\cell>
        Rusanov. <math|\<beta\><rsub|1>=\<beta\><rsub|2>=1.0>
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|Kelvin-Helmholtz Instability <cite|volkner2010|schaal2015>>

    <center|<image|figures/euler2d/kh_schaal/initial.pdf|0.6par|||>>

    <with|font-base-size|12|<center|<hlink|Animation
    link|https://www.youtube.com/watch?v=PFMaeZm95_A>>>
  </hidden>|<\hidden>
    <tit|Kelvin-Helmholtz Instability <cite|volkner2010|schaal2015>>

    \;

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|2|2|1|1|cell-row-span|1>|<cwith|2|2|1|1|cell-col-span|2>|<cwith|3|3|2|2|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|4|4|2|2|cell-halign|c>|<table|<row|<\cell>
        <math|Density profile> <math|t=0.4>, <math|NC=256<rsup|2>>,
        <math|N=4>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        \;

        \;
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/euler2d/kh_schaal/trixi.pdf|0.5par|||>
      </cell>|<\cell>
        <image|figures/euler2d/kh_schaal/lwfr.pdf|0.5par|||>
      </cell>>|<row|<\cell>
        <verbatim|Trixi.jl>
      </cell>|<\cell>
        LWFR
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|2-D Sedov blast <cite|SEDOV1959146>>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
        <math|t=0.001,<space|1em>NC=160<rsup|2>,<space|1em>N=4>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/euler2d/sedov_Density.pdf|0.45par|||>
      </cell>|<\cell>
        <image|figures/euler2d/sedov_Pressure.pdf|0.45par|||>
      </cell>>|<row|<\cell>
        Density
      </cell>|<\cell>
        Pressure
      </cell>>>>
    </wide-tabular>

    The initial condition is given by

    <\equation*>
      \<rho\>=1.0,<space|1em>v<rsub|1>=v<rsub|2>=0.0,<space|1em>E<around*|(|x,y|)>=<choice|<tformat|<table|<row|<cell|<frac|0.244816|\<mathLaplace\>x*\<mathLaplace\>y>>|<cell|<space|1em>>|<cell|x\<less\>\<mathLaplace\>x,y\<less\>\<mathLaplace\>y,>>|<row|<cell|10<rsup|-12>>|<cell|>|<cell|otherwise.>>>>>
    </equation*>

    <\equation*>
      \;
    </equation*>
  </hidden>|<\hidden>
    <tit|Astrophysial jet <cite|b0ca7a5eeb40423caed7422ff5e0b525>>

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    <with|font-base-size|12|<center|<hlink|Animation
    link|https://www.youtube.com/watch?v=8o187mfP9z8>>>
  </hidden>|<\hidden>
    <tit|Astrophysical jet Mach 80 <cite|b0ca7a5eeb40423caed7422ff5e0b525>>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|c>|<cwith|5|5|1|1|cell-row-span|1>|<cwith|5|5|1|1|cell-col-span|2>|<cwith|5|5|1|1|cell-halign|c>|<cwith|6|6|1|1|cell-halign|c>|<cwith|6|6|1|1|cell-row-span|1>|<cwith|6|6|1|1|cell-col-span|2>|<cwith|2|2|1|1|cell-row-span|1>|<cwith|2|2|1|1|cell-col-span|2>|<cwith|3|3|1|1|cell-row-span|1>|<cwith|3|3|1|1|cell-col-span|2>|<cwith|4|4|1|1|cell-row-span|1>|<cwith|4|4|1|1|cell-col-span|2>|<cwith|3|3|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
        Density profile, <math|NC=448\<times\>224>, <math|t=0.07>, <math|N=4>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/euler2d/M80/trixi.pdf|0.5par|||>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <verbatim|Trixi.jl>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/euler2d/M80/lwfr.pdf|0.5par|||>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        LWFR
      </cell>|<\cell>
        \;
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|Astrophysical jet Mach 2000 <cite|b0ca7a5eeb40423caed7422ff5e0b525>>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|5|5|1|1|cell-halign|c>|<cwith|6|6|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<table|<row|<\cell>
        Density profile, <math|NC=640\<times\>320>, <math|t=0.001>,
        <math|N=4>
      </cell>>|<row|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/euler2d/M2000/trixi.pdf|0.5par|||>
      </cell>>|<row|<\cell>
        <verbatim|Trixi.jl>
      </cell>>|<row|<\cell>
        <image|figures/euler2d/M2000/lwfr.pdf|0.5par|||>
      </cell>>|<row|<\cell>
        LWFR
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|Implementation in Julia <cite|Julia-2017>>

    <with|font-base-size|10|<\itemize>
      <with|font-base-size|12|<unroll-greyed|<\shown>
        <item><with|font-series|bold|Modularity> - new conservation law can
        be added without modifying base code. User need only supply physical
        flux, numerical flux and wave speed estimates.
      </shown>|<\hidden*>
        <item><with|font-series|bold|Portability> - Dependencies are handled
        by Julia's package manager
      </hidden*>|<\hidden*>
        <item><with|font-series|bold|Parallelization> - Shared-memory via
        multithreading
      </hidden*>|<\hidden*>
        <item><with|font-series|bold|Efficiency> - noticeably faster than
        some C++ implementations
      </hidden*>|<\hidden*>
        <item><with|font-series|bold|Visualization> - Postprocessing to
        <verbatim|vtr> format
      </hidden*>>>
    </itemize>>
  </hidden>|<\hidden>
    <tit|Type instabilities>

    <unroll|<\shown>
      <\wide-tabular>
        <tformat|<cwith|4|4|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-valign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|3|3|2|2|cell-valign|c>|<table|<row|<\cell>
          <\with>
            <\fortran-code>
              <\with|font-base-size|12>
                container = Dict( "u" =\<gtr\> u, ... )

                ...

                u = container["u"]

                for cell in eachelement(grid)

                \ \ \ \ ! heavy computation with u

                end
              </with>
            </fortran-code>
          </with>
        </cell>|<\cell>
          <with|font-base-size|12|<with|font-series|bold|Bad version>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>>|<row|<\cell>
          <\with>
            <\fortran-code>
              <\with|font-base-size|11>
                container = (; u, ...)

                ...

                u = container.u

                for cell in eachelement(grid)

                \ \ \ \ ! heavy computation with u

                end
              </with>
            </fortran-code>
          </with>
        </cell>|<\cell>
          <with|font-series|bold|<with|font-base-size|12|Good version>>
        </cell>>|<row|<\cell>
          \;
        </cell>|<\cell>
          \;
        </cell>>>>
      </wide-tabular>
    </shown>|<\hidden*>
      <with|font-base-size|10|Tool to find type instabilities -
      <hlink|<verbatim|ProfileView.jl>|https://github.com/timholy/ProfileView.jl>>
    </hidden*>|<\hidden*>
      <with|font-base-size|10|Tool to measure allocations -
      <verbatim|<hlink|BenchmarkTools.jl|https://github.com/JuliaCI/BenchmarkTools.jl>>,
      <hlink|<verbatim|TimerOutputs.jl>| https://github.com/KristofferC/TimerOutputs.jl>>
    </hidden*>|<\hidden*>
      <with|font-base-size|10|Fixing the problem - <hlink|JuliaLang -
      forum|https://discourse.julialang.org/>,
      <hlink|Zulip|https://discourse.julialang.org/t/come-join-the-julia-zulip-chat/36070>,
      <hlink|Slack|https://julialang.org/slack/>.>
    </hidden*>>
  </hidden>|<\hidden>
    <tit|Cache blocking (<verbatim|Trixi.jl> <cite|ranocha2022adaptive>,
    Akkurt Et Al <cite|akkurt2022>)>

    <with|gr-mode|<tuple|edit|line>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|1par|0.6par>|<with|font-base-size|16|gr-mode|<tuple|edit|text-at>|<graphics||<rectangle|<point|-10.8995|6.00045>|<point|-1.92472549279005|2.06341778012965>>|<rectangle|<point|4.93332|5.89461>|<point|11.3045376372536|2.04225095912158>>|<math-at|<with|font-base-size|16|F<rprime|'>>|<point|-6.94126207170261|3.75676346077523>>|<line|<point|3.49398|4.51877>|<point|4.25598624156634|3.58742889271068>>|<line|<point|4.19249|4.5611>|<point|3.55748114830004|3.62976253472682>>|<rectangle|<point|3.00714|2.04225>|<point|-0.421881201217092|6.00044648763064>>|<line|<point|-1.64956|4.45527>|<point|-0.697049874322|4.47643537504961>>|<line|<point|-1.62839|3.94726>|<point|-0.71821669533007|3.94726484984786>>|<math-at|<with|font-base-size|16|D>|<point|0.805794417250959|3.7144298187591>>|<math-at|<with|font-base-size|16|F>|<point|7.57917713983331|3.65092935573489>>|<rectangle|<point|1.27146|-0.0744311>|<point|7.15584071967191|-5.78947281386427>>|<math-at|<with|font-base-size|16|U>|<point|3.74798253737267|-3.18595382987168>>|<arc|<point|0.657627|0.348905>|<point|-0.252546633152533|-2.95311879878291>|<point|1.01746262733166|-6.40331062309829>>|<arc|<point|7.19817|0.412406>|<point|8.3623495171319|-3.1012865458394>|<point|7.28284164572033|-6.2551428760418>>|<\document-at>
      \;
    </document-at|<point|-3.1524|0.0102361>>|<\document-at>
      <\with|font-base-size|12>
        Pointwise

        \ Action
      </with>
    </document-at|<point|-3.38523614234687|-2.12761277946818>>|<rectangle|<point|-11.0476|0.0102361>|<point|-5.29025003307316|-5.83180645588041>>|<math-at|<with|font-base-size|16|F>|<point|-8.76160867839661|-3.18595382987168>>|<line|<point|-5.07858|-2.40278>|<point|-3.97790713057283|-2.38161463156502>>|<line|<point|-5.03625|-3.18595>|<point|-3.97790713057283|-3.18595382987168>>>>>
  </hidden>|<\hidden>
    <tit|Cache blocking (<verbatim|Trixi.jl> <cite|ranocha2022adaptive>,
    Akkurt Et Al <cite|akkurt2022>)>

    <with|gr-mode|<tuple|edit|math-at>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|1par|0.6par>|<with|font-base-size|16|<graphics||<rectangle|<point|-10.8995|6.00045>|<point|-1.92472549279005|2.06341778012965>>|<rectangle|<point|4.93332|5.89461>|<point|11.3045376372536|2.04225095912158>>|<math-at|<with|font-base-size|16|F<rprime|'>>|<point|-6.94126207170261|3.75676346077523>>|<line|<point|3.49398|4.51877>|<point|4.25598624156634|3.58742889271068>>|<line|<point|4.19249|4.5611>|<point|3.55748114830004|3.62976253472682>>|<with|fill-color|red|<rectangle|<point|3.00714|2.04225>|<point|-0.421881201217092|6.00044648763064>>>|<line|<point|-1.64956|4.45527>|<point|-0.697049874322|4.47643537504961>>|<line|<point|-1.62839|3.94726>|<point|-0.71821669533007|3.94726484984786>>|<math-at|<with|font-base-size|16|D>|<point|0.805794417250959|3.7144298187591>>|<math-at|<with|font-base-size|16|F>|<point|7.57917713983331|3.65092935573489>>|<rectangle|<point|1.27146|-0.0744311>|<point|7.15584071967191|-5.78947281386427>>|<math-at|<with|font-base-size|16|U>|<point|3.74798253737267|-3.18595382987168>>|<arc|<point|0.657627|0.348905>|<point|-0.252546633152533|-2.95311879878291>|<point|1.01746262733166|-6.40331062309829>>|<arc|<point|7.19817|0.412406>|<point|8.3623495171319|-3.1012865458394>|<point|7.28284164572033|-6.2551428760418>>|<\document-at>
      \;
    </document-at|<point|-3.1524|0.0102361>>|<\document-at>
      <\with|font-base-size|12>
        Pointwise

        \ Action
      </with>
    </document-at|<point|-3.38523614234687|-2.12761277946818>>|<rectangle|<point|-11.0476|0.0102361>|<point|-5.29025003307316|-5.83180645588041>>|<math-at|<with|font-base-size|16|F>|<point|-8.76160867839661|-3.18595382987168>>|<line|<point|-5.07858|-2.40278>|<point|-3.97790713057283|-2.38161463156502>>|<line|<point|-5.03625|-3.18595>|<point|-3.97790713057283|-3.18595382987168>>|<with|fill-color|red|<rectangle|<point|6.19458|5.89461>|<point|7.54506243969466|2.04225095912158>>>|<with|fill-color|red|<rectangle|<point|-9.37374|6.00045>|<point|-7.46979097615852|2.06341778012965>>>|<with|fill-color|red|<rectangle|<point|-10.16|0.0102361>|<point|-8.81623452641108|-5.83180645588041>>>|<with|fill-color|red|<rectangle|<point|2.10904|-0.0744311>|<point|3.62315744762398|-5.78947281386427>>>|<math-at|<wide|U|~>|<point|2.32980552983199|-3.19746328879481>>|<math-at|<wide|F|~>|<point|-9.94695065484852|-3.21863010980288>>|<math-at|<wide|F|~>|<point|6.42513890726287|3.64826696652996>>|<math-at|<wide|F|~><rprime|'>|<point|-8.93094324646117|3.76642082286017>>|<math-at||<point|8.16386|-1.50628>>>>>
  </hidden>|<\hidden>
    <tit|Cache blocking (<verbatim|Trixi.jl> <cite|ranocha2022adaptive>,
    Akkurt Et Al <cite|akkurt2022>)>

    <with|font-base-size|10|<\wide-tabular>
      <tformat|<cwith|4|4|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-valign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|3|3|2|2|cell-valign|c>|<table|<row|<\cell>
        <\fortran-code>
          for cell in eachelement(grid) ! Cell loop

          \ \ for i in eachnode(basis) \ \ \ ! DoF loop

          \ \ \ \ f[:,i,cell] = flux(u[:,i,cell])

          \ \ end

          \ \ BLAS.mul(D, f, res)

          end
        </fortran-code>
      </cell>|<\cell>
        <with|font-series|bold|Bad version>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <\fortran-code>
          for cell in eachelement(grid) ! Cell loop

          \ \ for i in eachnode(basis) \ \ \ ! DoF loop

          \ \ \ \ u_node = get_node_vars(eq, u, i, cell)

          \ \ \ \ f_node = flux(u_node)

          \ \ \ \ for ix in eachnode(basis)

          \ \ \ \ \ \ ! res[:,ix,i,cell] += D[ix,i] * f_node

          \ \ \ \ \ \ multiply_add_to_node_vars(eq, D[ix,i],

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ f_node,
          res,

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ iix,
          cell)

          \ \ \ \ end

          \ \ end

          end
        </fortran-code>
      </cell>|<\cell>
        <with|font-series|bold|Good version>
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>>>>
    </wide-tabular>>
  </hidden>|<\hidden>
    <tit|Conclusions>

    <\itemize>
      <with|font-base-size|12|<unroll-greyed|<\shown>
        <item>Sub-cell based blending limiter based on
        <cite|HENNEMANN2021109935> with MUSCL-Hancock reconstruction
        constructed for Lax-Wendroff schemes
      </shown>|<\hidden*>
        <item>MUSCL-Hancock blending more accurate than first order blending
      </hidden*>|<\hidden*>
        <item>MUSCL-Hancock for general grids proved to be admissibility
        preserving
      </hidden*>|<\hidden*>
        <item>Admissibility preserving Lax-Wendroff scheme constructed
      </hidden*>|<\hidden*>
        <item>Efficient 2-D implementation in <verbatim|Julia>
      </hidden*>|<\hidden*>
        <item>LW-D2 and ADER equivalent for linear, and
        <with|font-shape|italic|close> for non-linear equations
      </hidden*>|<\hidden*>
        <item>Mild instability for ADER and LW schemes for <math|N=4>
      </hidden*>|<\hidden*>
        <with|font-series|bold|<with|font-base-size|11|Future Plans>>
      </hidden*>|<\hidden*>
        <item>Extend the scheme to unstructured grids.
      </hidden*>>>
    </itemize>
  </hidden>|<\hidden>
    <tit|Textbooks and coursework>

    <with|font-base-size|12|<\itemize>
      <unroll-greyed|<\shown>
        <item><with|font-shape|italic|Continuum mechanics> by
        <with|font-shape|italic|Gonzales> and <with|font-shape|italic|Stuart>
      </shown>|<\hidden*>
        <item><with|font-shape|italic|A mathematical introduction to fluid
        mechanics> by <with|font-shape|italic|Chorin>
      </hidden*>|<\hidden*>
        <item><with|font-shape|italic|Gas Dynamics> at NPTEL-IISc
      </hidden*>|<\hidden*>
        <item><with|font-shape|italic|Riemann Solvers and Numerical Methods
        for Fluid Dynamics: A Practical Introduction> by
        <with|font-shape|italic|E.F. Toro>
      </hidden*>|<\hidden*>
        <item><with|font-shape|italic|Introduction to Numerical Methods for
        Time Dependent Differential Equations> by
        <with|font-shape|italic|Kreiss, Ortiz>
      </hidden*>>
    </itemize>>
  </hidden>|<\hidden>
    <tit|Publication>

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    <with|font-base-size|8|Arpit Babbar, Sudarshan Kumar
    Kenettinkara<localize|, and >Praveen Chandrashekar. Lax-wendroff flux
    reconstruction method for hyperbolic conservation laws.
    <newblock><with|font-shape|italic|Journal of Computational Physics>, 2022
    <hlink|https://doi.org/10.1016/j.jcp.2022.111423|https://doi.org/10.1016/j.jcp.2022.111423>,
    <hlink|https://arxiv.org/abs/2207.02954|https://arxiv.org/abs/2207.02954>>
  </hidden>|<\hidden>
    <tit|References>

    <\bibliography|bib|tm-plain|references>
      <\bib-list|22>
        <bibitem*|1><label|bib-akkurt2022>Semih Akkurt, Freddie
        Witherden<localize|, and >Peter Vincent. <newblock>Cache blocking
        strategies applied to flux reconstruction.
        <newblock><with|font-shape|italic|Computer Physics Communications>,
        271:108193, 2022.<newblock>

        <bibitem*|2><label|bib-oldpaper>Arpit Babbar, Sudarshan<nbsp>Kumar
        Kenettinkara<localize|, and >Praveen Chandrashekar.
        <newblock>Lax-wendroff flux reconstruction method for hyperbolic
        conservation laws. <newblock><with|font-shape|italic|Journal of
        Computational Physics>, <localize|page >111423, 2022.<newblock>

        <bibitem*|3><label|bib-Berthon2006>Christophe Berthon. <newblock>Why
        the MUSCL\UHancock scheme is l1-stable.
        <newblock><with|font-shape|italic|Numerische Mathematik>,
        104(1):27\U46, jun 2006.<newblock>

        <bibitem*|4><label|bib-Julia-2017>Jeff Bezanson, Alan Edelman, Stefan
        Karpinski<localize|, and >Viral<nbsp>B Shah. <newblock>Julia: a fresh
        approach to numerical computing. <newblock><with|font-shape|italic|SIAM
        Review>, 59(1):65\U98, 2017.<newblock>

        <bibitem*|5><label|bib-Dumbser2009>Michael Dumbser<localize| and
        >Olindo Zanotti. <newblock>Very high order PNPM schemes on
        unstructured meshes for the resistive relativistic MHD equations.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        228(18):6991\U7006, oct 2009.<newblock>

        <bibitem*|6><label|bib-Felton2018-ip>Camille Felton, Mariana Harris,
        Caleb Logemann, Stefan Nelson, Ian Pelakh<localize|, and
        >James<nbsp>A Rossmanith. <newblock>A positivity-preserving limiting
        strategy for locally-implicit Lax-Wendroff discontinuous galerkin
        methods. <newblock>Jun 2018.<newblock>

        <bibitem*|7><label|bib-b0ca7a5eeb40423caed7422ff5e0b525>Youngsoo Ha,
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

        <bibitem*|8><label|bib-HENNEMANN2021109935>Sebastian Hennemann,
        Andrés<nbsp>M.<nbsp>Rueda-Ramírez,
        Florian<nbsp>J.<nbsp>Hindenlang<localize|, and
        >Gregor<nbsp>J.<nbsp>Gassner. <newblock>A provably entropy stable
        subcell shock capturing approach for high order split form dg for the
        compressible euler equations. <newblock><with|font-shape|italic|Journal
        of Computational Physics>, 426:109935, 2021.<newblock>

        <bibitem*|9><label|bib-Huynh2007>H.<nbsp>T.<nbsp>Huynh. <newblock>A
        Flux Reconstruction Approach to High-Order Schemes Including
        Discontinuous Galerkin Methods. <newblock>Miami, FL, jun 2007.
        AIAA.<newblock>

        <bibitem*|10><label|bib-Jackson2017>Haran Jackson. <newblock>On the
        eigenvalues of the ADER-WENO galerkin predictor.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        333:409\U413, mar 2017.<newblock>

        <bibitem*|11><label|bib-LeVeque1996>Randall<nbsp>J.<nbsp>LeVeque.
        <newblock>High-Resolution Conservative Algorithms for Advection in
        Incompressible Flow. <newblock><with|font-shape|italic|SIAM Journal
        on Numerical Analysis>, 33(2):627\U665, apr 1996. <newblock>Bibtex:
        LeVeque1996.<newblock>

        <bibitem*|12><label|bib-Persson2006>Per-Olof Persson<localize| and
        >Jaime Peraire. <newblock>Sub-Cell Shock Capturing for Discontinuous
        Galerkin Methods. <newblock><localize|In
        ><with|font-shape|italic|44th AIAA Aerospace Sciences Meeting and
        Exhibit>, Aerospace Sciences Meetings. American Institute of
        Aeronautics and Astronautics, jan 2006.<newblock>

        <bibitem*|13><label|bib-ranocha2022adaptive>Hendrik Ranocha, Michael
        Schlottke-Lakemper, Andrew<nbsp>Ross Winters, Erik Faulhaber, Jesse
        Chan<localize|, and >Gregor Gassner. <newblock>Adaptive numerical
        simulations with Trixi.jl: A case study of Julia for scientific
        computing. <newblock><with|font-shape|italic|Proceedings of the
        JuliaCon Conferences>, 1(1):77, 2022.<newblock>

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
  </hidden>|<\hidden>
    <tit|Conservation property of LWFR>

    <unroll|<\shown>
      <\equation*>
        <around*|(|u<rsup|e><rsub|j>|)><rsup|n+1>=<around*|(|u<rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<pdv|F<rsub|h>|\<xi\>><around*|(|\<xi\><rsub|j>|)>,<space|2em>1\<leq\>j\<leq\>N+1.
      </equation*>
    </shown>|<\hidden*>
      For <math|<around*|{|w<rsub|j>|}><rsub|j=1><rsup|N+1>> being the
      quadrature weights associated with solution points:

      <\equation*>
        <big|sum><rsub|j=1><rsup|N+1>w<rsub|j><around*|(|u<rsup|e><rsub|j>|)><rsup|n+1>=<big|sum><rsub|j=1><rsup|N+1><around*|(|u<rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<big|sum><rsub|j=1><rsup|N+1>w<rsub|j>*<pdv|F<rsub|h>|\<xi\>><around*|(|\<xi\><rsub|j>|)>,
      </equation*>
    </hidden*>|<\hidden*>
      <\equation*>
        \<Rightarrow\><wide|u|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around*|[|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|]>.
      </equation*>
    </hidden*>>

    \;

    \;
  </hidden>|<\hidden>
    <tit|Interface numerical flux>

    \;

    <unroll|<\shown>
      High order

      <\equation*>
        <wide|u|\<wide-bar\>><rsub|e><rsup|H,n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<around*|(|F<rsub|e+<frac|1|2>><rsup|H>-F<rsub|e-<frac|1|2>><rsup|H>|)>
      </equation*>

      Low-order

      <\equation*>
        <wide|u|\<wide-bar\>><rsub|e><rsup|L,n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>>*<around*|(|F<rsub|e+<frac|1|2>><rsup|L>-F<rsub|e-<frac|1|2>><rsup|L>|)>.
      </equation*>

      For blended update

      <\equation*>
        <wide|u|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|u|\<wide-bar\>><rsub|e><rsup|n>-\<mathLaplace\>t*<around*|(|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|)>,
      </equation*>

      <\equation*>
        where<space|1em> F<rsub|e+<frac|1|2>>=\<alpha\><rsub|e>*F<rsub|e+<frac|1|2>><rsup|L>+<around*|(|1-\<alpha\><rsub|e>|)>*F<rsub|e+<frac|1|2>><rsup|H>.
      </equation*>

      Conservation requires

      <\equation*>
        \<alpha\><rsub|e>*F<rsub|e+<frac|1|2>><rsup|L>+<around*|(|1-\<alpha\><rsub|e>|)>*F<rsub|e+<frac|1|2>><rsup|H>=\<alpha\><rsub|e+1>*F<rsub|e+<frac|1|2>><rsup|L>+<around*|(|1-\<alpha\><rsub|e+1>|)>*F<rsub|e+<frac|1|2>><rsup|H>
      </equation*>

      <\equation*>
        \<Rightarrow\>F<rsub|e+<frac|1|2>><rsup|L>=F<rsub|e+<frac|1|2>><rsup|H>
      </equation*>
    </shown>>
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
    <tit|Choosing <math|\<beta\><rsub|1>,\<beta\><rsub|2>>>

    <unroll|<\shown>
      <\equation*>
        \<bbb-E\>=max<around*|(|<frac|m<rsub|N+1><rsup|2>|\<beta\><rsub|1>m<rsub|1>+<big|sum><rsub|j=2><rsup|N+1>m<rsub|j><rsup|2>>,<frac|m<rsub|N><rsup|2>|\<beta\><rsub|2>m<rsub|1>+<big|sum><rsub|j=2><rsup|N>m<rsub|j><rsup|2>>|)>
      </equation*>

      <switch|<\shown>
        <center|<wide-tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
          <image|figures/scalar/composite.pdf|0.71par|||>
        </cell>>|<row|<\cell>
          <math|\<beta\><rsub|2>=1.0>
        </cell>>>>>>
      </shown>|<\hidden>
        <center|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|<image|figures/scalar/composite_zoomed.pdf|0.71par|||>>>|<row|<cell|<math|\<beta\><rsub|2>=1.0>>>>>>>
      </hidden>|<\hidden>
        <\wide-tabular>
          <tformat|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
            <image|figures/scalar/composite_scaled.pdf|0.71par|||>
          </cell>>|<row|<\cell>
            <math|\<beta\><rsub|2>=1.0>
          </cell>>>>
        </wide-tabular>
      </hidden>>
    </shown>>
  </hidden>|<\hidden>
    <tit|Lemma of conservation laws>

    <\lemma*>
      Consider the 1-D Riemann problem

      <\equation*>
        <tabular*|<tformat|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|<bw><rsub|t>+<with|font-series|bold|f><around*|(|<bw>|)><rsub|x>>|<cell|=>|<cell|0,>>|<row|<cell|<bw><around*|(|x,0|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|<bw><rsub|l>,>|<cell|<space|1em>>|<cell|x\<less\>0,>>|<row|<cell|<bw><rsub|r>,>|<cell|>|<cell|x\<gtr\>0,>>>>>>>>>>
      </equation*>

      in <math|<around*|[|-h,h|]>\<times\><around*|[|0,\<mathLaplace\>t|]>>
      where

      <\equation*>
        <frac|\<mathLaplace\>t|h>*<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|l>,<bw><rsub|r>|)>|\|>\<leq\><frac|1|2>,
      </equation*>

      where <math|\<sigma\><rsub|e><around*|(|<bw><rsub|1>,<bw><rsub|2>|)>>
      denotes all eigenvalues of all Jacobian matrices at the states between
      <math|<bw><rsub|1>> and <math|<bw><rsub|2>>. Then, for all
      <math|t\<leq\>\<mathLaplace\>t>, we have

      <\equation*>
        <big|int><rsub|-h><rsup|h><bw><around*|(|x,t|)>*d
        x=h*<around*|(|<bw><rsub|l>+<bw><rsub|r>|)>-t<around*|(|<with|font-series|bold|f><around*|(|<bw><rsub|r>|)>-<with|font-series|bold|f><around*|(|<bw><rsub|l>|)>|)>.
      </equation*>
    </lemma*>
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
        <bw><rsub|i><rsup|n,\<pm\>>\<in\>\<cal-U\><rsub|ad><space|1em><text|and><space|1em><bw><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<cal-U\><rsub|ad>,
      </equation*>

      and the CFL restrictions

      <\equation>
        <tabular*|<tformat|<table|<row|<cell|<frac|\<mathLaplace\>t/2|<with|color|red|\<mu\><rsup|->>\<mathLaplace\>x/2>*max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n,->,<bw><rsub|i><rsup|\<ast\>,\<pm\>>|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<frac|\<mathLaplace\>t/2|<with|color|red|\<mu\><rsup|+>>\<mathLaplace\>x/2>*max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|\<ast\>,\<pm\>>,<bw><rsub|i><rsup|n,+>|)>|\|>|)>\<leq\><frac|1|2>,>>>>><label|eq:new.cfl1>
      </equation>

      where <math|\<sigma\><rsub|e><around*|(|<bw><rsub|1>,<bw><rsub|2>|)>>
      denotes the maximum spectral radius among all Jacobian matrices at
      states between <math|<bw><rsub|1>> and <math|<bw><rsub|2>>.

      Then, we have invariance of <math|\<cal-U\><rsub|ad>> under the first
      step of MUSCL-Hancock scheme, i.e.,

      <\equation*>
        <bw><rsub|i><rsup|n+1/2,\<pm\>>\<in\>\<cal-U\><rsub|ad>.
      </equation*>
    </lemma>
  </hidden>|<\hidden>
    <tit|Step 1 : Evolution to <math|n+1/2>>

    <unroll|<\shown>
      <with|font-series|bold|><with|font-series|bold|Proof>

      <center|<image|illustrations/non_interacting_rp1.pdf|0.9par|||>>

      \;
    </shown>|<\hidden*>
      <\equation*>
        <with|font-base-size|8|<tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<frac|1|\<mathLaplace\>x<rsub|i>><big|int><rsub|x<rsub|i-1/2>><rsup|x<rsub|i+1/2>><bw><rsup|h><around*|(|x,\<mathLaplace\>t/2|)>*d
        x>|<cell|=>|<cell|<frac|1|2><around*|(|<with|color|red|\<mu\><rsup|->><with|font-series|bold|w><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,+>+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n,+>|)>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|i>><around*|(|f<around*|(|<bw><rsub|i><rsup|n,+>|)>-f<around*|(|<bw><rsub|i><rsup|n,->|)>|)>>|<cell|>>|<row|<cell|>|<cell|=>|<cell|<bw><rsub|i><rsup|n,+>-<frac|\<mathLaplace\>t/2|\<mathLaplace\>x<rsub|i>><around*|(|f<around*|(|<bw><rsub|i><rsup|n,+>|)>-f<around*|(|<bw><rsub|i><rsup|n,->|)>|)>=<bw><rsub|i><rsup|n+<frac|1|2>,+>>|<cell|<qed>>>>>>>
      </equation*>
    </hidden*>>

    \;
  </hidden>|<\hidden>
    <tit|Step 2 : FVM type update>

    <unroll|<\shown>
      <with|font-base-size|7|<small|Define
      <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>>>

      <\equation*>
        <with|font-base-size|8|<small|<with|color|red|<frac|\<mu\><rsup|->|2>*><bw><rsub|i><rsup|n+<frac|1|2>,->+<frac|1|2>*<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+<with|color|red|<frac|\<mu\><rsup|+>|2>>*<bw><rsub|i><rsup|n+<frac|1|2>,+>=<bw><rsub|i><rsup|n>.>>
      </equation*>
    </shown>|<\hidden*>
      <center|<image|illustrations/fv_evolution.pdf|0.63par|||>>
    </hidden*>|<\hidden*>
      <with|font-base-size|8|<\small>
        <\equation*>
          <tabular*|<tformat|<cwith|3|3|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<bw><rsub|i><rsup|n+1,->>|<cell|:=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,->-<cfrac|\<mathLaplace\>t|<with|color|red|\<mu\><rsup|->>\<mathLaplace\>x<rsub|i>/2><around*|(|f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,->,<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)>-f<around*|(|<bw><rsub|i-1><rsup|n+<frac|1|2>,+>,<bw><rsub|i><rsup|n+<frac|1|2>,->|)>|)>>>|<row|<cell|<bw><rsub|i><rsup|n+1,\<ast\>>>|<cell|:=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>-<cfrac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|i>/2><around*|(|f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|i><rsup|n+<frac|1|2>,+>|)>-f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,->,<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>|)>|)>>>|<row|<cell|<bw><rsub|i><rsup|n+1,+>>|<cell|:=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,+>-<cfrac|\<mathLaplace\>t|<with|color|red|\<mu\><rsup|+>>\<mathLaplace\>x<rsub|i>/2><around*|(|f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,+>,<bw><rsub|i+1><rsup|n+<frac|1|2>,->|)>-f<around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>,<bw><rsub|i><rsup|n+<frac|1|2>,+>|)>|)>>>>>>
        </equation*>
      </small>>
    </hidden*>|<\hidden*>
      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<with|font-base-size|8|<small|<bw><rsub|i><rsup|n+1>>>>|<cell|=>|<cell|<bw><rsub|i><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x><around*|(|<with|font-series|bold|f><around*|(|<bw><rsub|i><rsup|n+<frac|1|2>,+>,<bw><rsub|i+1><rsup|n+<frac|1|2>,->|)>-<with|font-series|bold|f><around*|(|<bw><rsub|i-1><rsup|n+<frac|1|2>,+>,<bw><rsub|i><rsup|n+<frac|1|2>,->|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<with|color|red|<frac|\<mu\><rsup|->|2>*><bw><rsub|i><rsup|n+1,->+<frac|1|2>*<bw><rsub|i><rsup|n+1,\<ast\>>+<with|color|red|<frac|\<mu\><rsup|+>|2>>*<bw><rsub|i><rsup|n+1,+>>>>>>
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
        belong to <math|\<cal-U\><rsub|ad>>, where
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
          <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>=<around*|(|2<bw><rsub|i><rsup|n>-<around*|(|<with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n,->+<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n,+>|)>|)>-<frac|\<mathLaplace\>t|2\<mathLaplace\>x<rsub|i>><around*|[|<around*|(|f<around*|(|<with|color|blue|<bw><rsub|i><rsup|n,->>|)>-f<around*|(|<with|color|blue|<bw><rsub|i><rsup|n,+>>|)>|)>|]>>
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
        <math|<bw><rsub|i><rsup|\<ast\>,\<ast\>>> are in
        <math|\<cal-U\><rsub|ad>>. Consider the CFL conditions

        <\equation>
          <tabular|<tformat|<table|<row|<cell|<frac|\<mathLaplace\>t/2|<with|color|red|\<mu\><rsup|->>\<mathLaplace\>x/2>max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|\<ast\>,\<ast\>>,<bw><rsub|i><rsup|n,->|)>|\|>|)>\<leq\><frac|1|2>,>>|<row|<cell|<frac|\<mathLaplace\>t/2|<with|color|red|\<mu\><rsup|+>>\<mathLaplace\>x/2>max<rsub|i\<in\>\<bbb-Z\>><around*|(|<around*|\||\<sigma\><rsub|e><around*|(|<bw><rsub|i><rsup|n,+>,<bw><rsub|i><rsup|\<ast\>,\<ast\>>|)>|\|>|)>\<leq\><frac|1|2>,>>>>><label|eq:new.cfl3>
        </equation>

        then <math|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>\<in\>\<cal-U\><rsub|ad>>.
      </lemma>
    </hidden*>|<\hidden*>
      <\remark>
        For conservative reconstruction, we actually have
        <math|<with|font-series|bold|<bw>><rsub|i><rsup|\<ast\>,\<ast\>>=<bw><rsub|i>>.
        So, this lemma isn't placing new restrictions.
      </remark>
    </hidden*>>

    \;
  </hidden>|<\hidden>
    <tit|Final admissibility condition>

    <unroll|<\shown>
      <with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|0.529998gw|0.539998gh>>|gr-geometry|<tuple|geometry|0.956522par|0.339126par|center>|<graphics||<line|<point|1.98464|-2.90614>|<point|-0.706806455880407|0.342737134541606>>|<line|<point|-6.90399|-2.94341>|<point|6.59779732768885|-2.90769281651012>>|<with|dash-style|10|<line|<point|-6.90399|-2.94341>|<point|-6.86833575869824|3.20025797063104>>>|<with|dash-style|10|<line|<point|6.5978|-2.90769>|<point|6.54415266569652|3.11096044450324>>>|<point|-2.61154|-2.93205>|<math-at|x<rsub|i>|<point|-2.70707104114301|-3.28274242624686>>|<with|dash-style|10|<line|<point|-2.61154|-2.93205>|<point|-2.63563302024077|3.21811747585659>>>|<math-at|x<rsub|i+1/2>|<point|5.9012104775764|-3.24702341579574>>|<math-at|x<rsub|i-1/2>|<point|-6.92191427437492|-3.2648829210213>>|<math-at|x<rsub|i-1/4>|<point|-5.27135575340654|-3.28532361555761>>|<math-at|x<rsub|i+1/4>|<point|1.69252423997883|-3.2747246051065>>|<point|1.98875|-2.91989>|<line|<point|1.98875|-2.91989>|<point|3.0683622172245|0.503555364466199>>|<line|<point|1.98875|-2.91989>|<point|4.40716364598492|0.260136922873396>>|<line|<point|1.98875|-2.91989>|<point|3.50228204788993|0.46122172245006>>|<line|<point|1.98875|-2.91989>|<point|4.01028575208361|0.33422079640164>>|<point|-4.82983|-2.93792>|<line|<point|-4.82983|-2.93792>|<point|-6.34855801031883|0.347284693742559>>|<line|<point|-4.82983|-2.93792>|<point|-3.998677073687|0.362299907395158>>|<line|<point|-4.82983|-2.93792>|<point|-3.06773382722582|0.122056488953565>>|<line|<point|-4.82983|-2.93792>|<point|-3.6908651938087|0.227162984521762>>|<line|<point|-4.82983|-2.93792>|<point|-3.35302288662522|0.137071702606165>>|<math-at|<bw><rsub|i><rsup|n,+>|<point|-6.67009525069454|-2.62791043788861>>|<text-at|<with|font-series|bold|Proof.>|<point|-11.2954|3.11891>>|<math-at|<bw><rsub|i><rsup|\<ast\>,\<ast\>>|<point|-4.0865359174494|-2.5416225691229>>|<math-at|<bw><rsub|i><rsup|\<ast\>,\<ast\>>|<point|-1.30151144331261|-2.56173104908057>>|<math-at|<bw><rsub|i><rsup|n,-<rsub|>>|<point|3.83620518587115|-2.5717852890594>>|<text-at||<point|9.76821|-2.29027>>>>
    </shown>|<\hidden*>
      <\equation*>
        <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<frac|1|\<mathLaplace\>x<rsub|i>><big|int><rsub|x<rsub|i-1/2>><rsup|x<rsub|i+1/2>><bw><rsup|h><around*|(|x,<frac|\<mathLaplace\>t|2>|)>
        d\<nocomma\>x>|<cell|=>|<cell|<frac|1|2><around*|(|<with|color|red|\<mu\><rsup|+>><bw><rsub|i><rsup|n,+>+<bw><rsub|i><rsup|\<ast\>,\<ast\>>+<with|color|red|\<mu\><rsup|->><bw><rsub|i><rsup|n,->|)>-<frac|\<mathLaplace\>t|2*\<mathLaplace\>x<rsub|i>><around*|(|f<around*|(|<bw><rsub|i><rsup|n,->|)>-f<around*|(|<bw><rsub|i><rsup|n,+>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>>>>>>
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
          convex set <math|\<cal-U\><rsub|ad>>. Let
          <math|<around*|{|<bw><rsub|i><rsup|n>|}><rsub|i\<in\>\<bbb-Z\>>> be
          the approximate solution at time level <math|n> and assume that
          <math|<bw><rsup|n><rsub|i>\<in\>\<cal-U\><rsub|ad>> for all
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
            <bw><rsub|i><rsup|\<ast\>,\<pm\>>\<in\>\<cal-U\><rsub|ad>.
          </equation*>

          Then, under time step restrictions <eqref|eq:new.cfl1>,
          <eqref|eq:new.cfl2>, <eqref|eq:new.cfl3>, the updated solution
          <math|<bw><rsub|i><rsup|n+1>>, defined by the MUSCL-Hancock
          procedure is in <math|\<cal-U\><rsub|ad>>.
        </with>
      </theorem>
    </shown>|<\hidden*>
      <\proof>
        <\with|font-base-size|7>
          We only need <math|<bw><rsub|i><rsup|n,\<pm\>>\<in\>\<cal-U\><rsub|ad>>
          to apply the Lemmas <reference|lemma:m.h.step.1>,
          <reference|lemma:muscl.step2.general>,
          <reference|lemma:muscl.step3.wss>. To that end, notice

          <\equation*>
            <bw><rsub|i><rsup|n,\<pm\>>=<frac|1|2><bw><rsub|i><rsup|\<ast\>,\<pm\>>+<frac|1|2><bw><rsub|i><rsup|n>.
          </equation*>
        </with>
      </proof>
    </hidden*>>

    \;

    \;

    \;
  </hidden>|<\hidden>
    <\tit>
      Enforcing slope restriction
    </tit>

    <unroll|<\shown>
      Given candidate slope <math|<with|font-series|bold|\<sigma\>><rsub|i>>,

      <\equation*>
        <bw><rsub|i><rsup|\<ast\>,\<pm\>>:=<bw><rsub|i><rsup|n>+2*<around*|(|x<rsub|i\<pm\>1/2>-x<rsub|i>|)>*<with|font-series|bold|\<sigma\>><rsub|i>.
      </equation*>

      Find <math|\<theta\>\<in\><around*|[|0,1|]>>

      <\equation>
        <bw><rsub|i><rsup|n>+2*<around*|(|x<rsub|i\<pm\>1/2>-x<rsub|i>|)>*\<theta\>*<with|font-series|bold|\<sigma\>><rsub|i>\<in\>\<cal-U\><rsub|ad>.<label|eq:admissible.theta.defn>
      </equation>

      For <with|color|red|concave> <math|p=p<around*|(|<bw>|)>>, assume

      <\equation*>
        \<cal-U\><rsub|ad>=<around*|{|<bw>\<in\>\<Omega\>:p<around*|(|<with|font-series|bold|u>|)>\<gtr\>0|}>
      </equation*>

      We pick

      <\equation*>
        \<theta\><rsub|\<pm\>>=min<around*|(|<around*|\||<frac|\<epsilon\>-p<around*|(|<bw><rsub|i><rsup|n>|)>|p<around*|(|<bw><rsub|i><rsup|\<ast\>,\<pm\>>|)>-p<around*|(|<bw><rsub|i><rsup|n>|)>>|\|>,1|)>
      </equation*>

      and

      <\equation*>
        \<theta\>=min<around*|(|\<theta\><rsub|+>,\<theta\><rsub|->|)>.
      </equation*>

      By concavity,

      <\equation*>
        *p<around*|(|\<theta\>*<bw><rsub|i><rsup|\<ast\>,\<pm\>>+<around*|(|1-\<theta\>|)>*<bw><rsub|i><rsup|n>|)>\<gtr\>\<theta\>*p<around*|(|<bw><rsub|i><rsup|\<ast\>,\<pm\>>|)>+<around*|(|1-\<theta\>|)>*p<around*|(|<bw><rsub|i><rsup|n>|)>\<gtr\>\<epsilon\>\<gtr\>0.
      </equation*>

      Thus, this <math|\<theta\>> will give us
      <eqref|eq:admissible.theta.defn>.
    </shown>>
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
    <tit|ADER correction step - writing as FR>

    <unroll|<\shown>
      <\equation*>
        <big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><big|int><rsub|I<rsub|e>><rsup|><around*|(|\<partial\><rsub|t>u<rsub|h>+\<partial\><rsub|x>f<around*|(|u<rsub|h>|)>|)>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t=0
      </equation*>
    </shown>|<\hidden*>
      Integrate by parts in space

      <\equation*>
        <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n+1>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x>|<cell|=>|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n>*\<ell\><rsub|i><around*|(|\<xi\>|)>*d
        x+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|I<rsub|e>><wide|f|~><rsub|h>\<partial\><rsub|x>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t>>|<row|<cell|>|<cell|>|<cell|<space|1em>+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><with|color|blue|f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>>\<ell\><rsub|i><around*|(|0|)>d
        t-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><with|color|blue|f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>>\<ell\><rsub|i><around*|(|1|)>d
        t.>>>>>
      </equation*>
    </hidden*>|<\hidden*>
      Another integration by parts

      <\equation*>
        <tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n+1>\<ell\><rsub|i><around*|(|\<xi\>|)>d
        x>|<cell|=>|<cell|<big|int><rsub|I<rsub|e>>u<rsub|h><rsup|n>\<ell\><rsub|i><around*|(|\<xi\>|)>d
        x- <big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><big|int><rsub|I<rsub|e>>\<partial\><rsub|x><wide|f|~><rsub|h>\<ell\><rsub|i><around*|(|\<xi\>|)>
        d x d t>>|<row|<cell|>|<cell|>|<cell|+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around*|(|f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>-<with|color|blue|<wide|f|~><rsub|h><around*|(|0,\<tau\>|)>>|)>\<ell\><rsub|i><around*|(|0|)>d
        t>>|<row|<cell|>|<cell|>|<cell|-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around*|(|f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>-<with|color|blue|<wide|f|~><rsub|h><around*|(|1,\<tau\>|)>>|)>\<ell\><rsub|i><around*|(|1|)>d
        t,>>>>
      </equation*>
    </hidden*>|<\hidden*>
      Quadrature on solution points

      <switch|<\shown>
        <\equation*>
          <tabular*|<tformat|<cwith|1|1|2|2|cell-halign|r>|<cwith|1|1|4|4|cell-halign|l>|<cwith|2|2|4|4|cell-halign|l>|<cwith|3|3|4|4|cell-halign|l>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|u<rsub|i><rsup|n>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>\<partial\><rsub|x><wide|f|~><rsub|h><around*|(|\<xi\><rsub|i>,\<tau\>|)>
          \ d t>>|<row|<cell|\<Rightarrow\>>|<cell|u<rsub|i><rsup|n+1>>|<cell|=>|<cell|<space|1em>+<frac|\<ell\><rsub|i><around*|(|0|)>|<with|color|blue|w<rsub|i>>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|0,\<tau\>|)>*d
          t>>|<row|<cell|>|<cell|>|<cell|>|<cell|<space|1em>-<frac|\<ell\><rsub|i><around*|(|1|)>|<with|color|blue|w<rsub|i>>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|1,\<tau\>|)>
          d t>>>>>
        </equation*>
      </shown>|<\hidden>
        <\equation*>
          <tabular*|<tformat|<cwith|1|1|2|2|cell-halign|r>|<cwith|1|1|4|4|cell-halign|l>|<cwith|2|2|4|4|cell-halign|l>|<cwith|3|3|4|4|cell-halign|l>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|u<rsub|i><rsup|n>-<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>\<partial\><rsub|x><wide|f|~><rsub|h><around*|(|\<xi\><rsub|i>,\<tau\>|)>
          \ d t>>|<row|<cell|\<Rightarrow\>>|<cell|u<rsub|i><rsup|n+1>>|<cell|=>|<cell|<space|1em>-<with|color|blue|g<rsub|L><rprime|'><around*|(|\<xi\><rsub|i>|)>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e-<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e-<frac|1|2>><rsup|+><around*|(|t|)>|)>-<wide|f|~><rsub|h><around*|(|0,\<tau\>|)>d
          t>>|<row|<cell|>|<cell|>|<cell|>|<cell|<space|1em>-<with|color|blue|g<rsub|R><rprime|'><around*|(|\<xi\><rsub|i>|)>><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around|(|<wide|u|~><rsub|e+<frac|1|2>><rsup|-><around*|(|t|)>,<wide|u|~><rsub|e+<frac|1|2>><rsup|+><around*|(|t|)>|)>
          -<wide|f|~><rsub|h><around*|(|1,\<tau\>|)>d t>>>>>
        </equation*>
      </hidden>>
    </hidden*>>
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
          <around*|\<\|\|\>|u<rsup|n+1><rsub|ADER>-u<rsup|n+1><rsub|LW>|\<\|\|\>><rsub|\<infty\>>=O<around*|(|\<mathLaplace\>t<rsup|N+1>|)>.
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
  </hidden>>
</body>

<\initial>
  <\collection>
    <associate|font|roman>
    <associate|font-base-size|7>
    <associate|font-family|sans>
    <associate|info-flag|none>
    <associate|math-font|roman>
    <associate|page-height|auto>
    <associate|page-medium|beamer>
    <associate|page-type|4:3>
    <associate|page-width|auto>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
    <associate|bib-Berthon2006|<tuple|3|?>>
    <associate|bib-Dumbser2009|<tuple|5|?>>
    <associate|bib-Felton2018-ip|<tuple|6|?>>
    <associate|bib-HENNEMANN2021109935|<tuple|8|?>>
    <associate|bib-Huynh2007|<tuple|9|?>>
    <associate|bib-Jackson2017|<tuple|10|?>>
    <associate|bib-Julia-2017|<tuple|4|?>>
    <associate|bib-LeVeque1996|<tuple|11|?>>
    <associate|bib-Persson2006|<tuple|12|?>>
    <associate|bib-Rueda-Ramirez2021-ib|<tuple|14|?>>
    <associate|bib-SEDOV1959146|<tuple|16|?>>
    <associate|bib-Shu1989|<tuple|17|?>>
    <associate|bib-Woodward1984|<tuple|19|?>>
    <associate|bib-Xu2019|<tuple|20|?>>
    <associate|bib-Zhang2010b|<tuple|21|?>>
    <associate|bib-akkurt2022|<tuple|1|?>>
    <associate|bib-b0ca7a5eeb40423caed7422ff5e0b525|<tuple|7|?>>
    <associate|bib-oldpaper|<tuple|2|?>>
    <associate|bib-ranocha2022adaptive|<tuple|13|?>>
    <associate|bib-schaal2015|<tuple|15|?>>
    <associate|bib-volkner2010|<tuple|18|?>>
    <associate|bib-zorio_approximate_2017|<tuple|22|?>>
    <associate|eq:ader.linear.update|<tuple|1|?>>
    <associate|eq:admissible.theta.defn|<tuple|7|?>>
    <associate|eq:lemma.1.used|<tuple|5|?>>
    <associate|eq:lwfr.linear.update|<tuple|2|?>>
    <associate|eq:new.cfl1|<tuple|3|?>>
    <associate|eq:new.cfl2|<tuple|4|?>>
    <associate|eq:new.cfl3|<tuple|6|?>>
    <associate|eq:non.con.face.defn1|<tuple|8|?>>
    <associate|eq:quadrature1|<tuple|9|?>>
    <associate|lemma:m.h.step.1|<tuple|3|?>>
    <associate|lemma:muscl.step2.general|<tuple|4|?>>
    <associate|lemma:muscl.step3.wss|<tuple|5|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      HENNEMANN2021109935

      Zhang2010b

      HENNEMANN2021109935

      Huynh2007

      Huynh2007

      Huynh2007

      oldpaper

      zorio_approximate_2017

      oldpaper

      HENNEMANN2021109935

      HENNEMANN2021109935

      Persson2006

      Felton2018-ip

      Rueda-Ramirez2021-ib

      Berthon2006

      Jackson2017

      Dumbser2009

      Shu1989

      Woodward1984

      SEDOV1959146

      LeVeque1996

      Woodward1984

      volkner2010

      schaal2015

      volkner2010

      schaal2015

      SEDOV1959146

      b0ca7a5eeb40423caed7422ff5e0b525

      b0ca7a5eeb40423caed7422ff5e0b525

      b0ca7a5eeb40423caed7422ff5e0b525

      Julia-2017

      ranocha2022adaptive

      akkurt2022

      ranocha2022adaptive

      akkurt2022

      ranocha2022adaptive

      akkurt2022

      HENNEMANN2021109935
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>