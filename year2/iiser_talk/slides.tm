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

    <assign|Dv*|<\macro|degree|num|den>
      <frac|<math|D<rsup|<arg|degree>><arg|num>>|D
      <math|<arg|den><rsup|<arg|degree>>>>
    </macro>>

    # Vectors

    <assign|vX|<math|<with|font-series|bold|X>>>

    <assign|va|<math|<with|font-series|bold|a>>>

    <assign|vxi|<with|font-series|bold|<math|\<xi\>>>>

    <assign|vQ|<with|font-series|bold|<math|u>>>

    <assign|vF|<with|font-series|bold|<math|f>>>

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

    <assign|bx|<macro|\<b-x\>>>

    <assign|bX|<macro|<math|<with|font-series|bold|X>>>>

    #Bold symbols-end

    \;

    # Hats

    <assign|hx|<macro|<wide|x|^>>>

    <assign|hy|<macro|<wide|y|^>>>

    <assign|hz|<macro|<wide|z|^>>>

    # Vectors

    <assign|vX|<math|<wide|X|\<vect\>>>>

    <assign|va|<math|<wide|a|\<vect\>>>>

    <assign|vxi|<math|<wide|\<xi\>|\<vect\>>>>

    <assign|vQ|<math|<wide|Q|\<vect\>>>>

    <assign|vF|<math|<wide|F|\<vect\>>>>
  </hide-preamble>

  <screens|<\hidden>
    \;

    \;

    \;

    \;

    <doc-data|<doc-title|Lax-Wendroff Flux Reconstruction for hyperbolic
    conservation laws>|<\doc-misc>
      Arpit Babbar

      <verbatim|arpit@tifrbng.res.in>

      <image|illustrations/tifrlogo.png|0.2par|||>

      <with|color|blue|TIFR-CAM, Bangalore>

      \;

      <with|color|red|Department of Mathematics>

      <with|color|red|IISER Trivandrum>
    </doc-misc>|<doc-date|<date>>>
  </hidden>|<\hidden>
    <tit|Outline>

    <with|font-base-size|12|<\itemize>
      <unroll-greyed|<\shown>
        <item>Review of Finite Volume Method (FVM) and Flux Reconstruction
        (FR)\ 
      </shown>|<\shown>
        <item>Introduce Lax-Wendroff Flux Reconstruction (LWFR) where
        numerical fluxes are carefully constructed to improve accuracy and
        stability
      </shown>|<\shown>
        <item>Introduce a second order variant of blending limiter of
        Henneman Et Al <cite|HENNEMANN2021109935> in context of LW schemes
        which will be used to create a provably admissibility preserving LW
        scheme
      </shown>|<\shown>
        <item>Extend LWFR to unstructured, curved meshes with free stream
        preservation
      </shown>>
    </itemize>>
  </hidden>|<\hidden>
    <unroll-phantoms|<\shown>
      <\tit>
        Finite Volume Method
      </tit>

      <switch|<\hidden>
        <\equation*>
          <with|color|white|<big|int><rsub|I<rsub|e>>><tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|1|1|1|1|cell-halign|r>|<cwith|2|2|1|1|cell-halign|r>|<table|<row|<cell|u<rsub|t>+f<around*|(|u|)><rsub|x>>|<cell|=>|<cell|0,>>|<row|<cell|u<around*|(|x,0|)>>|<cell|=>|<cell|u<rsub|0><around*|(|x|)>.>>>>>
        </equation*>

        <\equation*>
          <with|color|white|f<rsub|e+1/2>=<frac|f<around*|(|<wide|u|\<wide-bar\>><rsub|e>|)>+f<around*|(|<wide|u|\<wide-bar\>><rsub|e+1>|)>|2>+max<rsub|u\<in\>I<around*|[|<wide|u|\<wide-bar\>><rsub|e>,<wide|u|\<wide-bar\>><rsub|e+1>|]>><around*|\||f<rprime|'><around*|(|u|)>|\|><frac|<wide|u|\<wide-bar\>><rsub|e>-<wide|u|\<wide-bar\>><rsub|e+1>|2>>
        </equation*>

        <center|<center|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<image|Figures/fvm_dg_intro/init_fvm.pdf|0.61par|||>>>|<row|<cell|Piecewise
        constant states>>>>>>>
      </hidden>|<\hidden>
        <\equation*>
          <with|color|blue|<big|int><rsub|I<rsub|e>>>u<rsub|t>+<with|color|blue|<big|int><rsub|I<rsub|e>>>f<around*|(|u|)><rsub|x>
          =0
        </equation*>

        <\equation*>
          <with|color|white|f<rsub|e+1/2>=<frac|f<around*|(|<wide|u|\<wide-bar\>><rsub|e>|)>+f<around*|(|<wide|u|\<wide-bar\>><rsub|e+1>|)>|2>+max<rsub|u\<in\>I<around*|[|<wide|u|\<wide-bar\>><rsub|e>,<wide|u|\<wide-bar\>><rsub|e+1>|]>><around*|\||f<rprime|'><around*|(|u|)>|\|><frac|<wide|u|\<wide-bar\>><rsub|e>-<wide|u|\<wide-bar\>><rsub|e+1>|2>>
        </equation*>

        <center|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<image|Figures/fvm_dg_intro/init_fvm.pdf|0.61par|||>>>|<row|<cell|Piecewise
        constant states>>>>>>
      </hidden>|<\hidden>
        <\equation*>
          <with|color|white|<big|int><rsub|I<rsub|e>>><with|color|white|<big|int><rsub|I<rsub|e>>><dv|<wide|u|\<wide-bar\>><rsub|e><rsup|n>|t><rsub|><rsup|>+<frac|f<rsub|e+<frac|1|2>>-f<rsub|e-<frac|1|2>>|\<mathLaplace\>x<rsub|e>>=0
        </equation*>

        <\equation*>
          <with|color|white|f<rsub|e+1/2>=<frac|f<around*|(|<wide|u|\<wide-bar\>><rsub|e>|)>+f<around*|(|<wide|u|\<wide-bar\>><rsub|e+1>|)>|2>+max<rsub|u\<in\>I<around*|[|<wide|u|\<wide-bar\>><rsub|e>,<wide|u|\<wide-bar\>><rsub|e+1>|]>><around*|\||f<rprime|'><around*|(|u|)>|\|><frac|<wide|u|\<wide-bar\>><rsub|e>-<wide|u|\<wide-bar\>><rsub|e+1>|2>>
        </equation*>

        <center|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<image|Figures/fvm_dg_intro/init_fvm.pdf|0.61par|||>>>|<row|<cell|Piecewise
        constant states>>>>>>
      </hidden>|<\hidden>
        <\equation*>
          <with|color|white|<big|int><rsub|I<rsub|e>>><with|color|white|<big|int><rsub|I<rsub|e>>><dv|<wide|u|\<wide-bar\>><rsub|e><rsup|n>|t><rsub|><rsup|>+<frac|f<rsub|e+<frac|1|2>>-f<rsub|e-<frac|1|2>>|\<mathLaplace\>x<rsub|e>>=0
        </equation*>

        <\equation*>
          f<rsub|e+<frac|1|2>>=<frac|f<around*|(|<wide|u|\<wide-bar\>><rsub|e>|)>+f<around*|(|<wide|u|\<wide-bar\>><rsub|e+1>|)>|2>+max<rsub|u\<in\>I<around*|[|<wide|u|\<wide-bar\>><rsub|e>,<wide|u|\<wide-bar\>><rsub|e+1>|]>><around*|\||f<rprime|'><around*|(|u|)>|\|><frac|<wide|u|\<wide-bar\>><rsub|e>-<wide|u|\<wide-bar\>><rsub|e+1>|2>
        </equation*>

        <center|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<image|Figures/fvm_dg_intro/init_fvm.pdf|0.61par|||>>>|<row|<cell|Piecewise
        constant states>>>>>>
      </hidden>|<\shown>
        <\equation*>
          <with|color|white|<big|int><rsub|I<rsub|e>>><with|color|white|<big|int><rsub|I<rsub|e>>><dv|<wide|u|\<wide-bar\>><rsub|e><rsup|n>|t><rsub|><rsup|>+<frac|f<rsub|e+<frac|1|2>>-f<rsub|e-<frac|1|2>>|\<mathLaplace\>x<rsub|e>>=0
        </equation*>

        <\equation*>
          f<rsub|e+<frac|1|2>>=<frac|f<around*|(|<wide|u|\<wide-bar\>><rsub|e>|)>+f<around*|(|<wide|u|\<wide-bar\>><rsub|e+1>|)>|2>+max<rsub|u\<in\>I<around*|[|<wide|u|\<wide-bar\>><rsub|e>,<wide|u|\<wide-bar\>><rsub|e+1>|]>><around*|\||f<rprime|'><around*|(|u|)>|\|><frac|<wide|u|\<wide-bar\>><rsub|e>-<wide|u|\<wide-bar\>><rsub|e+1>|2>
        </equation*>

        \;

        <center|<tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<image|Figures/fvm_dg_intro/final_fvm.pdf|0.61par|||>>>|<row|<cell|Piecewise
        constant states>>>>>>
      </shown>>
    </shown>>
  </hidden>|<\hidden>
    <tit|Flux Reconstruction (FR) by Huynh <cite|Huynh2007>>

    <\with|font-base-size|8>
      <unroll-phantoms|<\shown>
        <\equation*>
          <large|<with|font-series|bold|u><rsub|t>+<with|font-series|bold|f><around*|(|<with|font-series|bold|u>|)><rsub|x>=0>
        </equation*>
      </shown>|<\shown>
        <\equation*>
          <tabular*|<tformat|<table|<row|<cell|<text|Degree <math|N>
          approximation>>>|<row|<cell|>>|<row|<cell|<large|<huge|\<Omega\>>=<big|cup><rsub|<huge|e>><huge|I<rsub|e>>>>>>>>
        </equation*>
      </shown>|<\shown>
        <with|gr-color|blue|gr-point-size|2ln|<with|font-base-size|11|gr-mode|<tuple|edit|point>|gr-frame|<tuple|scale|1cm|<tuple|0.67999gw|0.689995gh>>|gr-geometry|<tuple|geometry|1par|0.265183par|center>|<graphics||<line|<point|-10.8254|-0.173849>|<point|-8.76160867839661|-0.173849054107686>>|<with|arrow-end|\<gtr\>|<spline|<point|-9.2167|0.19657>|<point|-3.96732372006879|1.17024407990475>|<point|1.55721656303744|0.196570313533536>>>|<line|<point|-0.0514618|-0.110349>|<point|4.28773647307845|-0.173849054107686>>|<text-at|<tiny|<math|<with|font-base-size|10|x<rsub|e-<frac|1|2>>>>>|<point|-11.1058995898928|-0.51253424130176>>|<text-at|<tiny|<math|<with|font-base-size|10|x<rsub|e+<frac|1|2>>>>>|<point|-8.79869908056621|-0.576019451779336>>|<text-at|<tiny|<math|0>>|<point|-0.247288925783834|-0.459601041275301>>|<with|arrow-end|\<gtr\>|<spline|<point|1.79529|-0.814278>|<point|-4.03616549808176|-2.23245468977378>|<point|-9.27495369757905|-1.00477907130573>>>|<text-at|<large|<math|<small|I<rsub|e>>>>|<point|-10.0264|0.210064>>|<with|color|blue|point-size|2ln|<point|-10.3948|-0.173849>>|<with|color|blue|point-size|2ln|<point|-9.78272|-0.173849>>|<with|color|blue|point-size|2ln|<point|-9.19266|-0.173849>>|<with|color|blue|point-size|2ln|<point|0.813427|-0.123006>>|<with|color|blue|point-size|2ln|<point|2.22103|-0.152302>>|<with|color|blue|point-size|2ln|<point|3.47767|-0.161994>>|<with|color|blue|<\document-at>
          \;
        </document-at|<point|-11.8933|5.4261>>>|<with|color|blue|<\document-at>
          \;
        </document-at|<point|-11.0084998015611|-5.00388609604445>>>|<text-at|<math|<small|I>>|<point|1.96146977113375|0.104246593464744>>|<with|color|blue|<\document-at>
          \;
        </document-at|<point|4.44186|-2.32501>>>|<text-at|<math|<tiny|1>>|<point|4.35570181240905|-0.52194404021696>>|<with|color|blue|<text-at|<math|<wide|r|^>=<wide|r|^><around*|(|\<xi\>|)>>|<point|4.62630638973409|0.711668210080698>>>|<with|color|blue|<\document-at>
          <math|<with|font-base-size|9|<pdv|r|x>=<frac|1|\<mathLaplace\>x<rsub|e>><pdv|<wide|r|^>|\<xi\>>>>
        </document-at|<point|4.52549940468316|-1.27926974467522>>>|<with|color|blue|<text-at|<math|<tabular*|<tformat|<table|<row|<cell|u<rsub|h>=u<rsub|h><around*|(|x|)>>>|<row|<cell|>>|<row|<cell|>>|<row|<cell|r=r<around*|(|x|)>>>>>>>|<point|-14.4766172774176|-0.422410371742294>>>|<with|color|blue|<text-at|<math|<tabular*|<tformat|<table|<row|<cell|x<rsub|e,j>\<mapsto\>\<xi\><rsub|j>>>>>>>|<point|-5.65800701150946|-0.543871543855007>>>|<text-at|<math|<tiny|<with|font-base-size|10|x\<mapsto\>\<xi\><rsub|e><around*|(|x|)>>>>|<point|-4.98060259293557|1.57747387220532>>|<text-at|<tiny|<math|<with|font-base-size|10|\<xi\>\<mapsto\>x<rsub|e><around*|(|\<xi\>|)>>>>|<point|-4.87364400052917|-2.77217555232174>>>>>
      </shown>|<\shown>
        We use Gauss-Legendre solution points.
      </shown>>
    </with>
  </hidden>|<\hidden>
    <unroll|<\shown>
      <\tit>
        Flux Reconstruction (FR) by Huynh <cite|Huynh2007>
      </tit>

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
      border>|<with|font-base-size|9|gr-frame|<tuple|scale|1cm|<tuple|0.499999gw|0.140005gh>>|gr-geometry|<tuple|geometry|1par|0.569531par|center>|gr-transformation|<tuple|<tuple|1.0|0.0|0.0|0.0>|<tuple|0.0|0.995004165278026|0.0998334166468281|0.0>|<tuple|0.0|-0.0998334166468281|0.995004165278026|0.0>|<tuple|0.0|0.0|0.0|1.0>>|<graphics||<with|magnify|0.84629758534134|<line|<point|-0.0921688443002041|9.3846306204784>|<point|-0.0832120999999998|7.74555>|<point|-0.0742553852457589|6.68865765899957>>>|<with|arrow-end|\<gtr\>|<arrow-with-text|<point|-0.114962|5.26903>|<point|-0.0937954755920095|3.35343630109803>|<math-at|>>>|<with|line-width|2ln|<line|<point|-0.519281144992725|10.1258597565816>|<point|0.26883521524011|10.1360270104577>>>|<with|line-width|2ln|<line|<point|-0.093794987008864|9.7881436301098>|<point|-0.114962252520175|10.4231686731049>>>|<text-at|<math|<with|<with|<wide|f|^><rsub|h>=<wide|f|^><rsub|h><rsup|\<delta\>><with|color|black|+<with|color|white|<with|color|black|<around*|(|<with|color|black|<with|color|purple|f<rsub|e-<frac|1|2>>>>-<wide|f|^><rsub|h><rsup|\<delta\>><around*|(|0|)>|)>>>*g<rsub|L>+><with|color|white|<with|color|black|<around*|(|<with|color|purple|f<rsub|e+<frac|1|2>>>-<wide|f|^><rsub|h><rsup|\<delta\>><around*|(|1|)>|)>>>*g<rsub|R>>>>|<point|-4.77166291837545|5.59601137716629>>|<text-at|<image|Figures/cts_flux/fd_2.pdf|0.3par|||>|<point|-9.84111654980818|6.30509988093663>>|<text-at|<math|<wide|f|^><rsub|h><rsup|\<delta\>><around*|(|\<xi\><rsub|i>|)>=f<around*|(|<wide|u|^><rsub|h><around*|(|\<xi\><rsub|i>|)>|)>>|<point|-8.50760682629977|9.31078846408255>>|<text-at|<image|Figures/cts_flux/corr.pdf|0.3par|||>|<point|2.62351736392765|6.29747651805794>>|<text-at|<math|<tabular*|<tformat|<cwith|1|-1|1|1|font-base-size|8>|<table|<row|<cell|g<rsub|L><around*|(|0|)>=1,g<rsub|L><around*|(|1|)>=0>>|<row|<cell|g<rsub|R><around*|(|0|)>=0,g<rsub|R><around*|(|1|)>=1>>>>>>|<point|3.89615028442916|9.77645852626009>>|<text-at|<image|Figures/cts_flux/fc_labeled.pdf|0.3par|||>|<point|-3.49105371080831|-1.80797724566742>>>>>
    </shown>>>

    <\equation*>
      <small|<with|color|purple|<normal-size|f<rsub|e+<frac|1|2>>=<frac|f<rsub|h><rsup|\<delta\>><around|(|u<rsub|e+<frac|1|2>><rsup|->|)>+f<around|(|u<rsub|e+<frac|1|2>><rsup|+>|)>|2>+max<rsub|u\<in\>I<around|[|u<rsub|e-1/2><rsup|->,u<rsub|e+1/2><rsup|+>|]>><around*|\||f<rprime|'><around*|(|u|)>|\|><frac|u<rsub|e+<frac|1|2>><rsup|->-u<rsub|e+<frac|1|2>><rsup|+>|2>>>>
    </equation*>
  </hidden>|<\hidden>
    <tit|Lax-Wendroff Flux Reconstruction (LWFR)>

    <unroll|<\shown>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<large|u<rsup|n+1>=u<rsup|n>-\<mathLaplace\>t*F<rsup|n><rsub|x>>,>>|<row|<cell|<text|where
        >F=f<around*|(|u|)>+<frac|\<mathLaplace\>t|2><around*|(|f<around*|(|u|)>|)><rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>f<around*|(|u|)><rsub|t*t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N||t>f<around*|(|u|)>\<approx\><frac|1|\<mathLaplace\>t>*<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>f<around*|(|u|)>*d
        t>>>>>
      </equation*>
    </shown>|<\shown>
      Taylor series method

      <\equation*>
        f<around*|(|u|)><rsub|t>=f<rprime|'><around*|(|u|)>*u<rsub|t>,<space|2em>u<rsub|t>=-f<around*|(|u|)><rsub|x>.
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
    </shown>>
  </hidden>|<\hidden>
    <tit|Numerical flux: D2>

    <unroll|<\shown>
      Past works : <with|font-series|bold|Dissipation 1> (D1)

      <\equation*>
        F<rsub|e+<frac|1|2>>=<frac|1|2>*<around|[|F<rsub|e+<frac|1|2>><rsup|->+F<rsub|e+<frac|1|2>><rsup|+>|]>-<frac|1|2>*\<lambda\><rsub|e+<frac|1|2>>*<around|[|<with|color|red|u<rsub|e+<frac|1|2>><rsup|+>>-<with|color|red|u<rsub|e+<frac|1|2>><rsup|->>|]>.
      </equation*>
    </shown>|<\shown>
      <with|font-series|bold|Dissipation 2> (D2) flux

      <\equation*>
        F<rsub|e+<frac|1|2>>=<frac|1|2>*<around|[|F<rsub|e+<frac|1|2>><rsup|->+F<rsub|e+<frac|1|2>><rsup|+>|]>-<frac|1|2>*\<lambda\><rsub|e+<frac|1|2>>*<around|[|<with|color|red|U<rsub|e+<frac|1|2>><rsup|+>>-<with|color|red|U<rsub|e+<frac|1|2>><rsup|->>|]>.
      </equation*>

      where

      <\equation*>
        U=u+<frac|\<mathLaplace\>t|2>u<rsub|t>+<frac|\<mathLaplace\>t<rsup|2>|3!>u<rsub|t*t>+\<cdots\>+<frac|\<mathLaplace\>t<rsup|N>|<around*|(|N+1|)>!><pdv*|N|u|t>\<approx\><frac|1|\<mathLaplace\>t><big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>>u<rsub|h>*
        d t.
      </equation*>
    </shown>|<\shown>
      Upwind flux for <math|u<rsub|t>+a*u<rsub|x>=0>

      <\equation*>
        F<rsub|e+<frac|1|2>>=<choice|<tformat|<cwith|2|2|2|2|cell-halign|r>|<table|<row|<cell|F<rsub|e+<frac|1|2>><rsup|->>|<cell|<space|1em>a\<gtr\>0,>>|<row|<cell|F<rsub|e+<frac|1|2>><rsup|->>|<cell|a\<leq\>0.>>>>>
      </equation*>
    </shown>|<\shown>
      Equivalent to ADER-DG for linear problems.
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Numerical flux: Central Part>

    <\wide-tabular>
      <tformat|<cwith|1|1|2|2|cell-valign|t>|<cwith|1|1|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-valign|t>|<cwith|2|2|2|2|cell-halign|c>|<table|<row|<\cell>
        <image|illustrations/ae.pdf|0.499par|||>
      </cell>|<\cell>
        <\with|font-series|bold>
          Average and Extrapolate (AE)
        </with>

        <\equation*>
          F<rsub|e+<frac|1|2>><rsup|\<pm\>>=F<rsub|h><rsup|\<delta\>><around|(|x<rsub|e+<frac|1|2>><rsup|\<pm\>>|)>
        </equation*>

        Sub-optimal accuracy for some non-linear problems, robustness issues
      </cell>>|<row|<\cell>
        <image|illustrations/ea.pdf|0.499par|||>
      </cell>|<\cell>
        <with|font-series|bold|Extrapolate and Average (EA)>

        Lax-Wendroff time averaging performed at faces, only
        <math|\<partial\><rsub|t><rsup|<around*|(|k|)>><with|font-series|bold|u>>
        terms extrapolated
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|Accuracy compared>

    <\wide-tabular>
      <tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|5|5|1|1|cell-halign|c>|<table|<row|<\cell>
        <\equation*>
          <image|figures/euler2d/dmr/tvb/lwfr_2_240.pdf|582pt|164pt||>
        </equation*>
      </cell>>|<row|<\cell>
        <with|font-series|bold|LWFR-D2> with <with|font-series|bold|EA>
        scheme
      </cell>>|<row|<\cell>
        \;
      </cell>>|<row|<\cell>
        <\equation*>
          <math|<image|figures/euler2d/dmr/tvb/rkfr_2_240.pdf|582pt|164pt||>>
        </equation*>
      </cell>>|<row|<\cell>
        <with|font-series|bold|RKFR>
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|Performance gains measured>

    <\wide-tabular>
      <tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|3|3|cell-halign|c>|<table|<row|<\cell>
        <image|figures/euler2d/dmr/tvb/isentropic_D1_D2_/grid_vs_ratios.pdf|0.45par|||>
      </cell>|<\cell>
        <space|1em>
      </cell>|<\cell>
        <image|figures/euler2d/dmr/tvb/grid_vs_ratios.pdf|0.45par|||>
      </cell>>|<row|<\cell>
        Performance gain of D2 over D1
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        Performance gain of LW over RK
      </cell>>>>
    </wide-tabular>

    For more results comparing LW-D2/LW-D1 and LW/RK, see <cite|oldpaper>.
  </hidden>|<\hidden>
    <tit|Subcell based limiters>

    <\with|font-base-size|9>
      <unroll|<\shown>
        <with|font-series|bold|Godunov's order barrier theorem>

        <with|font-shape|italic|Linear schemes which do not add oscillations
        can be at most first order accurate.>
      </shown>|<\shown>
        <with|gr-mode|<tuple|edit|line>|gr-frame|<tuple|scale|1cm|<tuple|0.699989gw|0.49gh>>|gr-geometry|<tuple|geometry|1par|0.25652par|center>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-color|red|gr-dash-style|10|<graphics||<line|<point|5|0>|<point|-7.0|0.0>>|<with|line-width|2ln|<line|<point|-4|0>|<point|-4.0|2.0>|<point|-4.0|-1.0>>>|<with|line-width|2ln|<line|<point|-1|2>|<point|-1.0|-1.0>>>|<with|line-width|2ln|<line|<point|2|2>|<point|2.0|-1.0>>>|<with|line-width|2ln|<line|<point|-7|2>|<point|-7.0|-1.0>>>|<line|<point|-7|0>|<point|-10.0|0.0>>|<math-at|\<Omega\><rsub|e>|<point|-2.6|-1.0>>|<with|color|blue|<line|<point|-2.5|0>|<point|-4.0|1.6>>>|<math-at|\<Omega\><rsub|e-1>|<point|-6.0|-1.0>>|<math-at|\<Omega\><rsub|e+1>|<point|0.0|-1.0>>|<with|color|blue|<math-at|<wide|u|\<wide-bar\>><rsub|e>-u<rsup|+><rsub|e-<frac|1|2>>|<point|-3.5|1.5>>>|<with|color|blue|<point|-2.5|0>>|<with|color|red|<point|-5.5|0>>|<with|color|red|<point|0.5|0>>|<with|color|red|<math-at|<with|color|red|<wide|u|\<wide-bar\>><rsub|e+1>-<wide|u|\<wide-bar\>><rsub|e>>|<point|0.0|-2.5>>>|<with|color|red|<text-at|TVD/TVB
        Limiter|<point|-15.4412124619659|0.425254663315253>>>|<with|color|dark
        orange|<math-at|<with|color|red|<wide|u|\<wide-bar\>><rsub|e>-<wide|u|\<wide-bar\>><rsub|e-1>>|<point|-6.71502513559995|1.65711403624818>>>|<with|color|red|dash-style|10|<line|<point|-2.5|0.0>|<point|0.529357941254253|-1.9957831723773>>>|<with|color|red|dash-style|10|<line|<point|-2.5|0>|<point|-5.5|1.0>>>>>
      </shown>|<\shown>
        <with|gr-mode|<tuple|edit|document-at>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.499999gh>>|gr-geometry|<tuple|geometry|1par|0.208695par|center>|<graphics||<\document-at>
          <math|\<alpha\><rsub|e>=\<alpha\><around*|(|<with|font-series|bold|u><rsub|e>|)>>
        </document-at|<point|-0.840785818229925|2.20865855271861>>|<\document-at>
          \;
        </document-at|<point|-8.89833|-0.554438>>|<\document-at>
          <with|color|red|<tabular|<tformat|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<cell|Blending
          limiter>>|<row|<cell|(Hennemann Et Al.
          <cite|HENNEMANN2021109935>)>>>>>>
        </document-at|<point|-11.2870750099219|1.17472549279005>>|<\document-at>
          <image|illustrations/subcells.pdf|0.51par|||>
        </document-at|<point|-4.45955152797989|1.01428760418045>>|<\document-at>
          \;
        </document-at|<point|-10.8848|2.19298>>>>
      </shown>>
    </with>
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
    <tit|Choice of <math|\<alpha\><rsub|e>> : Smoothness indicator
    <cite|HENNEMANN2021109935>>

    <unroll|<\shown>
      Legendre expansion of degree <math|N> polynomial
      <math|\<epsilon\>=\<epsilon\><around*|(|\<xi\>|)>>

      <\equation*>
        \<epsilon\>=<big|sum><rsub|j=1><rsup|N+1>m<rsub|j>L<rsub|j>,<space|2em>m<rsub|j>=<around*|\<langle\>|\<epsilon\>,L<rsub|j>|\<rangle\>><rsub|L<rsup|2>>,
      </equation*>

      Energy content (Persson and Peraire <cite|Persson2006>)

      <\equation*>
        \<bbb-E\>:=max<around*|(|<frac|m<rsub|N+1><rsup|2>|\<beta\><rsub|1>m<rsub|1><rsup|2>+<big|sum><rsub|j=2><rsup|N+1>m<rsub|j><rsup|2>>,<frac|m<rsub|N><rsup|2>|\<beta\><rsub|2>m<rsub|1><rsup|2>+<big|sum><rsub|j=2><rsup|N>m<rsub|j><rsup|2>>|)>,<space|2em>0\<leq\>\<beta\><rsub|i>\<leq\>1.
      </equation*>
    </shown>|<\shown>
      <\equation*>
        \<epsilon\>=\<rho\>*p
      </equation*>
    </shown>|<\shown>
      <\wide-tabular>
        <tformat|<cwith|1|1|2|2|cell-valign|c>|<table|<row|<\cell>
          <image|illustrations/alpha_func.pdf|0.38par|||>
        </cell>|<\cell>
          <\equation*>
            \<alpha\><around*|(|\<bbb-E\>|)>=<frac|1|1+exp<around*|(|-<frac|s|\<bbb-T\>><around*|(|\<bbb-E\>-\<bbb-T\>|)>|)>>
          </equation*>

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
        \<cal-U\><rsub|ad>=<around*|{|<bw>\<in\>\<Omega\>:p<around*|(|<with|font-series|bold|u>|)>\<gtr\>0|}>.
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
      <\equation*>
        Final choice: <space|2em><with|font-series|bold|F><rsub|e+<frac|1|2>>=\<theta\>*<wide|<with|font-series|bold|F>|~><rsub|e+<frac|1|2>>+<around*|(|1-\<theta\>|)>*<with|font-series|bold|f><rsub|e,N+3/2>.
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Extension of Zhang-Shu's limiter to Lax-Wendroff schemes>

    <unroll-greyed|<\shown>
      Low order residual

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<around*|(|<wide|<bw>|~><rsub|1><rsup|e>|)><rsup|n+1>=<around*|(|<bw><rsub|1><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|1>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|<frac|3|2>>-F<rsub|e-<frac|1|2>>|]>,>>|<row|<cell|<around*|(|<wide|<bw>|~><rsub|j><rsup|e>|)><rsup|n+1>=<around*|(|<bw><rsub|j><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|j>*\<mathLaplace\>x<rsub|e>><around*|[|f<rsub|j+<frac|1|2>>-f<rsub|j-<frac|1|2>>|]>,<space|2em>2\<leq\>j\<leq\>N,>>|<row|<cell|<around*|(|<wide|<bw>|~><rsub|N><rsup|e>|)><rsup|n+1>=<around*|(|<bw><rsub|N><rsup|e>|)><rsup|n>-<frac|\<mathLaplace\>t|w<rsub|N+1>*\<mathLaplace\>x<rsub|e>><around*|[|F<rsub|e+<frac|1|2>>-f<rsub|N-<frac|1|2>>|]>.>>>>>
      </equation*>
    </shown>|<\shown>
      By appropriate choice of <math|F<rsub|e\<pm\><frac|1|2>>>,

      <\equation*>
        <around*|(|<wide|<bw>|~><rsup|e><rsub|j>|)><rsup|n+1>\<in\>\<cal-U\><rsub|ad>,<space|2em>1\<leq\>j\<leq\>N+1.
      </equation*>
    </shown>|<\shown>
      <\equation*>
        \<Rightarrow\><wide|<bw>|\<wide-bar\>><rsub|e><rsup|n+1>=<wide|<bw>|\<wide-bar\>><rsub|e><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>><around*|(|F<rsub|e+<frac|1|2>>-F<rsub|e-<frac|1|2>>|)>=<big|sum><rsub|j=1><rsup|N+1>w<rsub|j>*<wide|<bw>|~><rsub|j><rsup|n+1>\<in\>\<cal-U\><rsub|ad>.
      </equation*>
    </shown>|<\shown>
      Zhang-Shu's scaling limiter applies.
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Lower order residual : MUSCL-Hancock>

    <unroll|<\shown>
      <center|<with|gr-mode|<tuple|edit|math-at>|gr-frame|<tuple|scale|1cm|<tuple|0.589996gw|0.340003gh>>|gr-geometry|<tuple|geometry|0.652164par|0.382594par|center>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-arrow-end|\<gtr\>|<graphics||<line|<point|-3|1>|<point|-3.0|-1.0>>|<line|<point|-1|1>|<point|-1.0|-1.0>>|<line|<point|2|1>|<point|2.0|-1.0>>|<line|<point|-6|0>|<point|-7.0|0.0>>|<line|<point|-4.6|1>|<point|-4.6|-1.0>>|<point|-4|0>|<point|-4|0>|<point|-1.6|0>|<point|-1.6|0>|<point|1|0>|<point|1|0>|<math-at|x<rsub|j-1>|<point|-4.4|-0.6>>|<math-at|x<rsub|j>|<point|-2.0|-0.5>>|<math-at|x<rsub|j+1>|<point|0.599999999999999|-0.5>>|<line|<point|4|0>|<point|-8.0|0.0>>|<line|<point|-8|4>|<point|4.0|4.0>>|<math-at|t<rsup|n>|<point|4.4|0>>|<math-at|t<rsup|n+1>|<point|4.5|4>>|<math-at|t<rsup|n+<frac|1|2>>|<point|4.5|2>>|<with|dash-style|10|<line|<point|-8|2>|<point|4.0|2.0>>>|<math-at|<very-small|f<rsub|j+<frac|1|2>><rsup|n+<frac|1|2>>>|<point|-1.4|3.0>>|<math-at|<very-small|f<rsub|j-<frac|1|2>><rsup|n+<frac|1|2>>>|<point|-3.4|3.0>>|<with|dash-style|10|<line|<point|-3|2.2>|<point|-3.0|1.8>>>|<with|dash-style|10|<line|<point|-1|1.8>|<point|-1.0|2.2>>>|<with|arrow-end|\<gtr\>|<line|<point|-2.5|0.4>|<point|-2.5|1.6>>>|<with|arrow-end|\<gtr\>|<line|<point|-1.4|0.4>|<point|-1.4|1.6>>>|<with|arrow-end|\<gtr\>|<line|<point|-2|2.5>|<point|-2.0|3.5>>>|<point|-1.7|4>|<text-at|<small|<math|<bw><rsub|j><rsup|n+1>=<bw><rsub|j><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|j>>*<around*|(|<with|font-series|bold|f><rsub|j+1/2><rsup|n+1/2>-<with|font-series|bold|f><rsub|j-1/2><rsup|n+1/2>|)>>>|<point|-2.0|5.0>>|<math-at||<point|-7.27641|3.13047>>|<math-at|<tiny|<with|font-series|bold|f<rsub|j\<pm\><frac|1|2>><rsup|n+<frac|1|2>>=><with|font-series|bold|f><around*|(|<with|font-series|bold|u><rsub|j\<pm\><frac|1|2>+><rsup|n+<frac|1|2>>,u<rsub|j\<pm\><frac|1|2>-><rsup|n+<frac|1|2>>|)>>|<point|-8.799923931737|2.90372403757111>>>>>
    </shown>|<\shown>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<bw><rsub|j-<frac|1|2>+>=<bw><rsub|j><around|(|x<rsub|j-<frac|1|2>>|)>,<space|1em><bw><rsub|j+<frac|1|2>->=<bw><rsub|j><around|(|x<rsub|j+<frac|1|2>>|)>>>|<row|<cell|<bw><rsub|j><around*|(|x|)>=<bw><rsub|j><rsup|n>+<with|font-series|bold|\<sigma\>><rsub|j>*<around*|(|x-x<rsub|j>|)>>>>>>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        <tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<cell|<with|font-series|bold|\<sigma\>><rsub|j>=minmod<around*|(|\<beta\><rsub|e>*<frac|<bw><rsub|j+1>-<bw><rsub|j>|x<rsub|j+1>-x<rsub|j>>,D<rsub|cent><around*|(|<bw>|)><rsub|j>,\<beta\><rsub|e>*<frac|<bw><rsub|j><rsup|n>-<bw><rsub|j-1><rsup|n>|x<rsub|j>-x<rsub|j-1>>|)>>>|<row|<cell|\<beta\><rsub|e>=2-\<alpha\><rsub|e>>>>>>
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Admissibility of low order method>

    <center|<image|illustrations/1dgrid_cells.pdf|0.6par|||>>

    <\theorem*>
      <with|font-shape|italic|<math|(>Extension of Berthon
      <math|<cite|Berthon2006>><math|)>> Consider the hyperbolic conservation
      law <math|<with|font-series|bold|u><rsub|t>+<with|font-series|bold|f><around*|(|<with|font-series|bold|u>|)><rsub|<with|font-series|bold|x>>=<with|font-series|bold|0>>
      which preserves the convex set <math|\<Omega\>>. Let
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
    </shown>|<\shown>
      Our generalization

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<with|color|red|\<mu\><rsup|->>*<bw><rsub|i><rsup|n,->+<bw><rsub|i><rsup|\<ast\>,\<pm\>>+<with|color|red|\<mu\><rsup|+>>*<bw><rsub|i><rsup|n,+>=2<bw><rsub|i><rsup|n,\<pm\>>,>>>>>
      </equation*>

      where

      <\equation*>
        <with|color|red|\<mu\><rsup|->>=<frac|x<rsub|i+1/2>-x<rsub|i>|x<rsub|i+1/2>-x<rsub|i-1/2>>,<space|1em><with|color|red|\<mu\><rsup|+>>=<frac|x<rsub|i>-x<rsub|i-1/2>|x<rsub|i+1/2>-x<rsub|i-1/2>>.
      </equation*>
    </shown>|<\shown>
      For <with|font-series|bold|conservative reconstruction>

      <\equation*>
        <bw><rsub|i><rsup|\<ast\>,\<pm\>>=<with|font-series|bold|<bw>><rsub|i><rsup|n>+2<around*|(|x<rsub|i\<pm\>1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>,
      </equation*>

      noting that

      <\equation*>
        <bw><rsub|i><rsup|n,+>=<bw><rsub|i>+<around*|(|x<rsub|i+1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>,<space|1em><bw><rsub|i><rsup|n,->=<bw><rsub|i>+<around*|(|x<rsub|i-1/2>-x<rsub|i>|)><with|font-series|bold|\<sigma\>><rsub|i>.
      </equation*>
    </shown>>

    \;
  </hidden>|<\hidden>
    <tit|Idea of proof>

    <unroll|<\shown>
      <\center>
        <image|illustrations/non_interacting_rp1.pdf|0.5par|||>
      </center>
    </shown>|<\shown>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<small|<frac|1|\<mathLaplace\>x<rsub|i>><big|int><rsub|x<rsub|i-1/2>><rsup|x<rsub|i+1/2>><bw><rsup|h><around*|(|x,\<mathLaplace\>t/2|)>*d
        x=<bw><rsub|i><rsup|n+<frac|1|2>,+>>>>>>>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        <small|<with|color|red|<frac|\<mu\><rsup|->|2>*><bw><rsub|i><rsup|n+<frac|1|2>,->+<frac|1|2>*<bw><rsub|i><rsup|n+<frac|1|2>,\<ast\>>+<with|color|red|<frac|\<mu\><rsup|+>|2>>*<bw><rsub|i><rsup|n+<frac|1|2>,+>=<bw><rsub|i><rsup|n>>
      </equation*>
    </shown>|<\shown>
      <\center>
        <image|illustrations/fv_evolution.pdf|0.5par|||>
      </center>
    </shown>>

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
    <tit|Unstructured, curvilinear grids>

    <\wide-tabular>
      <tformat|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
        <\equation*>
          <image|figures/euler2d/NACA0012.pdf|0.48par|||>
        </equation*>
      </cell>>|<row|<\cell>
        NACA0012 air foil
      </cell>>>>
    </wide-tabular>

    <\equation*>
      <with|gr-mode|<tuple|edit|math-at>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|1par|0.295651par|center>|<graphics||<\document-at>
        <image|<tuple|<#89504E470D0A1A0A0000000D4948445200000389000001D2080600000041F88E480000000473424954080808087C086488000000097048597300000EC300000EC301C76FA8640000200049444154789CECDD797055E7793FF0EFDD37ED12DA771012125A40026CC00E6063278E9DC4769A3DEEA453CF34E9B49976D2E964DA269D4EA7ED4C9B3F92B469D2C4719B9878891D1B83590D0803428005480249801690840442BBEEBE9DDF1FFC9ED7E702B63116BAC2FA7E663C76C5BDE7BC57A4E79EEF799FF7790D9AA6692022222222222202608CF70088888888888868FE604824222222222222852191888888888888148644222222222222521812898888888888486148242222222222228521918888888888881486442222222222225218128988888888884861482422222222222285219188888888888814864422222222222252181289888888888848614824222222222222852191888888888888148644222222222222521812898888888888486148242222222222228521918888888888881486442222222222225218128988888888884861482422222222222285219188888888888814864422222222222252181289888888888848614824222222222222852191888888888888148644222222222222521812898888888888486148242222222222228521918888888888881486442222222222225218128988888888884861482422222222222285219188888888888814864422222222222252CCF11EC042E3F57AE176BBE172B9E07038603432A71311111111D1FCC18432C7060707D1D8D88873E7CEC1EFF7C77B38444444444444311812E790A669E8E8E8C02F7EF10BFCFAD7BFC6E8E868BC87444444444444148321710EF5F4F4E0C489133879F224B66DDB869E9E1E78BDDE780F8B88888888884861489C43C78F1F4753531326272731303080C6C6460C0C0CC47B584444444444440A43E21CB976ED1A9A9B9BD1D6D606E07AE9E9CE9D3B71F6EC59040281388F8E8888888888E83A86C439D2D4D484D6D6568C8F8FAB9FB5B4B4E0F4E9D318191989E3C8888888888888DEC3903807344DC3EBAFBF8EAEAEAE989F47A3511C3A7408870F1F8ED3C8888888888888623124DE656EB71B478E1C415B5B1B2626266EFAF3B6B636343737B3D3291111111111CD0B0C8977D9F8F8385E7CF1450C0E0E22140ADDF4E7131313686D6DC5912347E2303A2222222222A2580C897791C7E341777737B66FDF8EA9A9A95BBE46D33474777763C78E1DF0783C8846A3733C4A2222222222A2F73024DE45838383686C6C447F7F3F82C1E0FBBE6E686808478E1CC1F9F3E7E1F7FBE77084444444444444B11812EF124DD3D0D9D98937DE78E3B65E3B323282E79E7B8E6B13898888888828AE1812EF929E9E1E9C3871023D3D3DB7F5FAA9A9296CDBB60D3D3D3DF07ABD777974444444444444B7C69078971C3F7E1C4D4D4DB71DF882C120060606D0D8D888818181BB3C3A2222222222A25B6348BC0BAE5DBB86E6E666B4B5B57DA4F7699A869D3B77E2ECD9B3080402776974444444444444EF8F21F12E686A6A426B6B2BC6C7C73FF27B5B5A5A70FAF4698C8C8CDC85911111111111117D3086C459A6691A5E7FFD75747575DDD1FBA3D1280E1D3A84C3870FCFF2C88888888888883E1C43E22C72BBDD3872E408DADADA30313171C7C7696B6B437373333B9D1211111111D19C63489C45E3E3E378F1C51731383888502874C7C7999898406B6B2B8E1C39328BA3232222222222FA700C89B3C4E3F1A0BBBB1BDBB76FC7D4D4D4C73A96A669E8EEEEC68E1D3BE0F178108D466769944444444444441F8C2171960C0E0EA2B1B111FDFDFD0806831FFB784343433872E408CE9F3F0FBFDF3F0B23242222222222FA700C89B340D334747676E28D37DE98D5638E8C8CE0B9E79EE3DA4422222222229A330C89B3A0A7A707274E9C404F4FCF4D7F66341AE1743AF1D4534F61D3A64DC8CDCD557FB676ED5A3CFEF8E3A8ABAB83D178F35FC5D4D414B66DDB869E9E1E78BDDEBBFA1988888888888800C01CEF017C121C3F7E1C4D4D4D3705B9B4B434545555E181071EC0830F3E88FDFBF7E3F2E5CBEACF8B8A8AB071E346B5EDC5A1438770E5CA1555AE1A0C0631303080C6C646E4E6E6A2BCBC7C4E3F1711111111112D3C0C891FD3B56BD7D0DCDC8CB6B636F53397CB85828202D4D7D763F3E6CDF8DCE73E87A4A424747474C06030A8D7592C16D4D4D4A0B2B2122B57AE447E7E3E9A9B9B71EEDC398C8E8E221C0E43D334ECDCB913B5B5B5282E2E86CD668BC7C72422222222A2058221F1636A6A6A426B6B2B26262660369BE172B9B06CD9327CED6B5FC3673FFB599496967EE831121313B16AD52AAC5AB50AFBF6EDC30B2FBC80C6C6465CBD7A153E9F0F2D2D2D387DFA3456AD5A8582828239F8544444444444B45031247E0C9AA6E1F5D75F47575717CC66338A8A8AF08D6F7C034F3DF5148A8A8AE0743A3FF231D7AD5B87CACA4A1C3972045BB66CC1B66DDB5439EAB265CBF0D5AF7EF52E7C122222222222A2EB1812EF90DBEDC6E9D3A7D1D6D686CCCC4C3CFDF4D3F8F4A73F8DE5CB972337371776BBFD8E8E6BB7DB919999890D1B36203F3F1F0F3DF4105E7DF5550C0C0CA0B9B9199B376F464646C62C7F1A2222222222A2EB1812EFD0CCCC0CF6EFDF8FD5AB57A3A2A2026BD7AEC5F2E5CBEF68F6F046269309191919484E4E4649490972737371F8F06198CD669C3A750A9B376F9E854F404444443437C6C7C771F9F2658C8D8DA1B8B81859595970381C0887C3989A9A426F6F2F66666660B55A919D9D8DE2E26298CDBC4D258A17FE7FDF1D321A8D70381C78E69967B06CD932A4A6A6CEFA392C160BB2B2B2F0D4534FA1AAAA0AE7CE9DE35618444444744F999999416F6F2FCE9F3FAF2AB1366CD880ACAC2CB8DD6E5CBD7A1557AE5C81C7E3C1E4E424AC562BEAEAEA505F5F0FABD51AEFE1132D480C8977283333137FF5577F0593C914D3B1F46E292F2FC7E2C58B110E87EFFAB988888888664B7777372E5CB800BBDD8EBABA3A3CF1C413181B1B436565253C1E0F344DC3238F3C82ACAC2C6CDDBA155BB66CC1EEDDBBF1F39FFF1C59595973729F4544B16EDEC19D6E8BC16080D96C9ED30B97D96CE61618444444744F3979F2241C0E071E7EF861242727C36030E0D5575FC5A1438790979787AF7DED6BC8CFCF87CD66C3D2A54BB178F162B4B4B4A0B7B79715544471C290788FE1D334222222BA17689A06BFDF0F8FC703A3D108B3D98C2B57AEC0E7F321393919B5B5B568686880CBE55295599148048140008140001E8F07914824DE1F83684162B929D10233363686B7DE7A0B46A31146A3119AA6C1E17060F9F2E5282C2CC4D8D8182E5CB880C1C141188D4644A351545656A2ACAC0C898989F11E3E1111DD4342A110162F5E8C9C9C1CB8DD6E747575C1EFF7A3A6A60675757558B46851CCEBC7C7C771F5EA5598CD66242727C362B1C469E4440B1B4322D102E3F3F9D0DADA8A999919F4F7F763626202F9F9F9F88BBFF80BE4E4E460626202870F1FC6DB6FBF8D929212242525212525058585850C894444F491984C26AC58B1024EA713D7AE5D436B6B2BA2D1286A6B6B51525272D3EBAF5EBD8ACB972F233D3D1D5959595C664314270C89440B4C666626FEF22FFF126D6D6DF8C52F7E8173E7CE010012131361341A919494048BC502BFDF8FF5EBD7A3BEBE1E050505484E4E56C78846A38844228846A3301A8D7CD24B44443731180C703A9D6A7BB00B172EA0BDBD1D168B05454545484F4F8F797D2412C1F0F030464747B172E54A242424C068E4CA28A2786048245A602C160BF2F2F2909999098FC78370388CE3C78FE3873FFC21FEF55FFF158D8D8DE8EBEBC3B3CF3E8BAF7CE52BB05AAD30994C315FD413131318181880D7EB456A6A2ACACBCBF9454E44441F686A6A0A9D9D9D282B2B436A6A2A4C2653CC9F5FBB760DC3C3C3301A8DA8A9A9E10348A2386248245A60A433AFD96CC6C68D1BD5BE54478F1EC5F7BFFF7D64656561D5AA55F8CC673E0397CB15F3DE999919BCFBEEBBF0FBFD484F4F87C160C0891327F0DC73CFE1D9679F45494909F7B42222A29B4C4D4D61707010D3D3D378F4D14791929272D36BFAFAFA30343484A4A4248644A238E3A37FA2052C2B2B0B1B376EC417BFF8454422111C3C7810E3E3E3C8CDCD456E6EEE4DAF9F9C9CC46BAFBD86CECE4E98CD6614161622393919BB76EDC2F1E3C731363616874F414444F3DDD5AB57D1D7D70700A8AEAE8E59C220BABBBB71E5CA15A4A4A460F9F2E50C894471C49048B4C0A5A5A5A1B2B212797979309BCDB876ED1AFAFBFB313A3A7AD36B354D83A669484B4B436A6A2A72727250505080A9A9295CBD7A95FB591111D12D0D0F0FA3A7A707369B0D555555EF1B12A7A6A690959585FCFCFC9BCA518968EEB0DC9468010B8542387FFE3C9A9A9A505D5D8D9494149C3F7F1EAFBEFA2A727373F1C4134FC06C36ABFD39737373F18FFFF88F70381C30994C989898C0B56BD760B55AB16CD932646464C4F9131111D17C343C3C8C8B172F223939194B962CB96939432412415F5F1FA2D1685C962E689A0680FB5113098644A205ECECD9B3D8B3670F060707F1EFFFFEEF181A1AC28F7EF423ECDBB70F3FFEF18F515A5A8AF2F272381C0E0080D96C467A7ABADA4BF1C48913E8EDEDC53FFCC33FA0A1A1815B641011D12D5DBD7A15131313A8AAAA82C3E1886976168944303434A44A4D972C5932E7E30B0683884422AA132BD142C79048B480689A069FCF87CB972F63707010AFBDF61ADC6E379E78E209E4E6E6222D2D0D8F3DF618AE5DBB86B6B636FCF0873FC49FFFF99FA3BCBC1C6969696A9B0CA7D389DCDC5C94959561626202FBF7EFC79A356B909E9ECE2EA744447493AAAA2A7CE31BDFC0F2E5CB6F9A450C8542387BF62C262727515C5C3CE721B1B7B7176D6D6D30994C78E28927E6F4DC44F3154322D102128944303636861D3B7660626202838383484F4F57ADC85D2E17B2B2B2B078F1624C4E4E626C6C0C870F1FC6E4E424AAABABB16CD932689A06BBDD8EACAC2C582C16689A8663C78E61F7EEDD309BCD282B2B8BF7C72422A27966F9F2E5C8CFCFC7A2458B60B3D962FE2C140AA1BDBD1D333333C8CDCD456969E99C8EEDC89123D8B16307B2B2B2B061C306242424B0EC94163C8644A205261A8D22180C222929090F3EF82092939363BEB0D3D2D2B066CD1A2C5BB60C46A311D16814E170187EBF1FC3C3C33879F2241A1A1A909E9E8EBCBC3C048341646464E0EDB7DF4679793943221111DD243B3B1BD9D9D9B7FCB3502884B6B636689A869C9C1C646666CEC998A2D12826262670F0E041ECDFBF1F4B972E455B5B1B1A1A1A6E0AB2440B0D4322D10262369B51545484BFF99BBF79DFD7AC59B3066BD6ACB9E9E7939393686C6CC4B7BEF52DFCEE77BFC3FAF5EB9190900000B0582CF0783C080683776DEC4444F4C9A3691AFC7E3F3A3A3A909A9A8ADCDC5C98CD73737B1A0C0671ECD831B4B6B66264640456AB15AFBCF20A2A2A2A60B55A399B480B1A170F11D16DB1D96CC8CACA5225434EA713A15008A3A3A33879F224D6AE5D3BE725424444746FF3FBFDAA694D4141C12DF7E8BD5BBC5E2FB66CD9824B972E01B8DE5C67D7AE5D18181840201098B37110CD479C4924A2DB62B3D950565686EF7DEF7BE8ECEC444F4F0F82C120464747F1E52F7F199FFEF4A751525212EF611211D13D647A7A1A1D1D1DF0FBFD282B2B9BB3903835358553A74EE1C48913989C9C040084C3618C8C8CE08D37DEC033CF3CC3079FB4A0312412D16D311A8D484D4DC5A73EF5295CB87001E17018914804999999C8CACA42494909EC767BBC87494444F710D95A69F3E6CD58BB76ED9C85C4E1E161BCF9E69B181E1E4628140270BDF4D5EBF562DBB66D58BB762DF2F2F2B83691162C864422BA6D26930929292958B56A55BC874244449F00090909A8ADAD85CD66434D4D0D929393EFFA393D1E0FCE9D3B879D3B77C2EFF7C7FC593018445B5B1B5A5A5AB074E952141717DFF5F110CD470C89444444441417369B0DF9F9F9C8CFCF9FB373F6F7F7A3B9B919172E5CB8E59F87C361BCFDF6DBA8A8A840616121F7FFA50589FFAB27222222A205A3A5A5057BF6ECF9C0D71C3B760C2D2D2D6ABD22D142C39048444444440B426F6F2F5A5A5A70FEFCF90F7C9DD7EB454B4B0B0E1D3A344723239A5F1812893E81A6A6A6D0D1D18177DE7907E7CF9FBF69CD051111D14274E4C811B4B4B4C0ED767FE0EB344DC399336770E0C001CCCCCC40D3B4391A21D1FCC03589449F00A15008333333B876ED1AAE5DBB86BEBE3E74747460787818151515F8E33FFE6364676773636022225A90A2D12826262670F0E041747676DED67B868686D0D2D282F6F676D4D7D7B3D3292D280C8944F7B06030089FCF87919111747676E2E0C183686A6AC2A54B97E0F7FB61B15870E0C0013CF8E083484B4BE3171C11112D48C16010C78E1D436B6B2B4647476FEB3DD16814972E5DC22BAFBC82F2F27258AD563E6CA505832191E81EA5691A5A5B5BB17DFB76ECDBB70FDDDDDDB0582C282B2BC3934F3E898282024C4C4CE0273FF90976ECD881D4D4542C5BB62CDEC32622229A731E8F075BB66CC1A54B973ED2FBAE5CB9829D3B77E25BDFFA165C2E17F703A605832191E81E1289443030308063C78EA1B1B1115D5D5DF0783C484E4EC6134F3C81D2D252A4A4A4202525054EA713D7AE5D437D7D3DF6EFDF8F952B5762E9D2A530994CF1FE1844444473666A6A0AA74E9DC28913273E72B7D270388C919111BCF1C61BF8E637BF89D2D2D2BB344AA2F9852191689E8B46A3F0F97C387BF62CDADBDBD1DEDE8EF3E7CF6374741469696958B264094A4B4B51585888CCCCCC98529868348A8D1B37E2C5175FC4E9D3A7515757C72F3822225A50868787F1E69B6F62787818A150E823BD57D33478BD5E6CDBB60DF7DF7F3FF2F2F2B8748316048644BA2B22910882C1208C46E3AC5C4C67666660B3D960B55A676174F706BFDF8FB1B1310C0C0CA0B7B717478E1C417B7B3B262727919A9A8A152B56A0B6B616F9F9F9703A9DB73C86D3E9445D5D1D76EFDE8DB6B6369C3C799221918888160C8FC78373E7CE61E7CE9DB7ECF46D30186EEA5C7AE3CF82C1205A5B5B71F2E4492C5DBA14C5C5C5777BD84471C79048B34ED3348C8E8EC2E3F1C0E572212B2BEB631FF3E2C58B484949415656D6273A286A9A864824028FC7834B972EA1A9A9096FBDF5160E1F3E0C97CB85AAAA2A6CD8B001B5B5B5484E4EFED0E3994C26242727A3B6B616274F9EC4B163C7F0F8E38F734D0511112D08FDFDFD686E6E467777B7FA99C16080C56281CBE582CD66C3E4E424FC7E3FCC66331C0E07EC763BBC5E2FFC7E3F22910880EB65A76FBFFD36CACBCB51585808A391BBC8D1271B4322CD2A298DFCD5AF7E85DADA5AAC5FBFFE43DFA37F5AF77E5DC3FAFBFB71FAF4692C5DBA146BD6AC99B5F1CE37C1601083838378FEF9E7B17BF76E0C0D0D212323035FF8C217D0D0D080ACAC2C381C0E582C968F74DCD5AB57E3DCB973E8E8E8C0891327F0C0030FDCA54F404444347FB4B4B460CF9E3D313FB3DBEDA8ADADC557BFFA55949696E29FFFF99F71ECD831141414E0E9A79FC6BA75EBF0F2CB2FA3B1B11157AE5C51EF3B76EC18EEBBEF3E7CEA539F425A5ADA5C7F14A239C590788F9199A6175E780157AF5EBDA363E4E4E460DDBA7558BC78F1AC8E2D1A8D62707010CF3DF71C2A2B2BB16CD932B85CAE0F7D5F7B7B3B3C1E0F4A4B4BDF77D6B1BEBE1E070F1E447B7B3B4C26131A1A1A6675ECF1E6F57AD1D1D1813D7BF6E0C08103181B1BC3A2458BB066CD1A2C59B204191919484D4DBDE3F6DB393939282929414F4F0F76EDDAC5904844449F78BDBDBD686969C1F9F3E7015C7F105D5F5F8F471F7D149B366D42696929262626548592C964426A6A2A1A1A1A505C5C8C071F7C10BB77EFC6BE7DFBE0F178E0F178D0D2D28243870EE1F39FFF7C3C3F1AD15DC790788F31180C30180C484B4B432814425F5F1F4E9C3881A1A121646666E2FEFBEFC792254B6282442814C2F8F8387A7B7BD1DEDE8EECEC6CE4E6E6CE7A48ECEFEF47636323868686F0F4D34F232F2FEFB666BC46464630363686E4E464180C0698CD66550222B2B3B3B17CF972BCF3CE3B78F3CD3751505080B4B4B48F3CA3369F689A86603088B6B6361C3F7E1C2D2D2DB870E102229108EAEAEA505E5E8EE2E262A4A7A77FEC73D9ED7694959561686808C78F1FC7C8C808D2D2D26036F3124044449F4C478E1C414B4B0BC2E130962C5982F5EBD7E381071EC07DF7DDA7EE95A6A7A763DE63341A91949484BCBC3C646666A2A8A808CB962DC3A1438770F6EC599C3D7B168D8D8DD8B46913121212B86F227D62F10EF11E643299B071E346F87C3EBCF3CE3B686E6E464747071C0E076A6A6AF0C8238FC45CB402810086878771F2E4498C8D8DA9CE98B3C9EFF7A3ADAD0D070F1EC4C68D1B919797F7A1EBDE64E6B1B7B717838383989E9E467A7ABA0AC1C5C5C5282A2A52AF2F2F2FC7C58B17D1DCDC8CFDFBF7E3D1471FBD27CB3D344DC3CCCC0C06070771E1C205ECDDBB17274F9E84CFE74351511156AF5E8DCACA4AB85CAE59FDF2292929C1B973E7D0D2D28293274F62EDDAB5484A4A9AB5E3131111CD07D168141313133872E408A6A7A7B17EFD7AAC5DBB164F3FFD34162F5EACAA9C3EA8D3A9C160406E6E2E323333515F5F8FA54B9762CF9E3D686D6D45575717DADBDB515F5FCF4EA7F489C590788F4A4C4C446262228A8A8A5052528203070E203D3D1D8B162DBA6570CACECEC6B265CBB076ED5A7CFBDBDF46281482A669B31642868686D0D1D181E9E9697CF18B5FFCC080A8691A028100464747F1FAEBAFA3B9B919FDFDFD0080B2B23278BD5E389D4E6CDEBC3926249ACD66545757E3EAD5ABF8C52F7E81EAEA6A242727DF53FBFE050201CCCCCCA0BDBD1D5BB76EC5ABAFBE0A4DD3505B5B8B279E7802B5B5B577AD314F6666260A0B0B71EAD4296CDFBE1D9595950C894444F489130A85D0D6D686F1F171AC5DBB165FF9CA57F0C0030FDCD13D8FD96C46565616BEF5AD6F61C3860DF8C31FFE80E6E666ECDEBD1B9595950C89F489C590B880D86C362C59B204D5D5D570381CF0783C4848489895631F3C781003030378E49147E070383EF042ECF57A71F2E4497CFFFBDF472010C033CF3C83BFFFFBBF472412C1D0D0106C361B72737391939373D37B737373B17CF972747777E3D4A953C8C8C8407676F6AC7C86B970ECD831BCF4D24B686C6CC4CCCC0CAAABABB171E346141515213131F1AE96CF1A0C06646666223F3F1F6FBDF5169E7DF659141414B0548688883E51A2D128A6A6A6F0BDEF7D0F858585484D4D9D95EFBA8282023CFBECB3D8BC7933DADBDB110E87118944EEA987D544B78B2171019196CF555555B05AAD989A9A9A95903839398953A74E61666606AB56ADFAC00B712412417373337EFAD39FA2BDBD1DDFFFFEF7F1F0C30FA3B4B4149AA6213F3F1F26930976BBFD96336A66B319E9E9E958B3660D8E1D3B86B2B2B2791F12272727D1DEDE8E37DE78032D2D2DF0FBFD282F2FC7B265CB50525282CCCC4C381C8E3969A79D9595858A8A0A343636A2ADAD0D393939C8CCCCBCEBE72522229A2B56AB156BD6AC416262221C0EC7AC8538B3D98CA4A42494959521232303494949DC0A833EB1181217A0254B96201289C0EBF5CECAF1CE9E3D8B2B57AE203333F3439BE10C0C0CA0A9A909274E9C40797939366EDC88D2D25255AE713BFBF725252561D3A64DF8FDEF7F8FBEBE3E343434CCCB062C81400067CF9E455353139A9A9A70EEDC39A4A7A7A3A6A606151515C8CBCBBBADEEAFB329292909454545484A4AC2F1E3C7515555C5904844449F282693E996D548B3C5E170C0E170DCB5E313CD07F3EFCE9AEEBAD2D252B8DDEE59DB50FDD4A953884422282828F8D00DDEBBBBBBD1DEDE8E68348A4D9B36213F3FFF23D7F3BB5C2EDC77DF7DF8D9CF7E86C1C141CCCCCC203535F5E37C8459150A85303232823367CE60CF9E3D387EFC383C1E0FAAABABB166CD1AB5683E180C221A8DCEE9D8AC562B3232325059598953A74E61E3C68DA8A9A99997219B88888888E28377860B506969E9AC1EAFAFAF0F090909C8CFCFFFD0D78E8C8CE0DAB56BB0DBED282F2FBFA3A02A6B2B6D369B3ADE7C0889D168147EBF1F972F5FC6EEDDBBF1FCF3CFE3DAB56BA8AAAAC297BEF425AC59B3069AA6C5BCC7EFF7CFF93825646FD9B2053D3D3D989E9EBE27BBC412111111D1DDC1426AFAD806060660341A919292F2A1AFCDC8C8407A7A3A2291083C1E0F2291C8473E9FC96442626222929393313939899191913B19F6AC9B9898C0F6EDDBF1DDEF7E173FF8C10F60B7DBF1CC33CFE04FFFF44F5153538348240283C100A3D108A3D118B7D93B97CB85FAFA7AB85C2EB5E7131111111191E04C22DD314DD3100A85303C3C8C8A8A8ADB0A8935353558BB762DDADBDBB16BD72EE4E4E4C062B16066660666B359ED47949898F8810D708C4623B2B3B3E1F57AE31A12354D432412C1FEFDFBF1D65B6FA1A5A505C160104F3EF924EAEAEA909B9B8BE4E464180C06F87C3E555A6B3018E2D65554360A5EBC78312E5FBE8CB367CFE281071E88CB588888888868FE61482400D7C34E7F7F3F868686E0F3F960301810080450525282828202389DCE9BDE130E8731363686999919D8EDF6DBDA732F333313D5D5D5A8AEAEC6D0D010F6EDDBA79AB798CD66389D4E2C5EBC180909091F1AA2D2D2D230343484B1B1B13BFBD01F93DBED466F6F2F1A1B1B71E8D0210C0F0F23353515B5B5B5A8AEAE46565696EA7A26FFD6340DD168140683216E2DB3E5DCE5E5E5686A6AC2850B17D4DE9444444444440C890400E8E8E8405F5F1FA6A6A6A0691A8C4623FAFAFA70FEFC792C5FBE1CF5F5F53735A589442298989840281482DD6EBFADF585C3C3C30887C358B56A15BC5E2FC2E130525252909494A482A9C964BA69EDDEAD389D4E040201B8DDEE3BFEDC77221C0EE3F2E5CB686F6FC73BEFBC831D3B76C06AB5A2B6B616F7DD771F2A2A2A60369B55C8957FDB6C36188DC6989F9BCD66442291DBFABCB3ADACAC0CCDCDCDB874E912FAFBFB51515131E76320222222A2F9872191108D46F1F39FFF1C252525F8CC673E8365CB9601000E1C3880FFF88FFFC0DB6FBF8DBFFDDBBFC5BA75EB62DE27E5A6122A3F6CAF209FCF877DFBF6A1A7A7072B56ACC017BEF0858F356E099373D521341A8D22180C627878187FF8C31FF0FAEBAFA3BBBB1B15151578ECB1C75051518184840484C361188D46689A0693C9A442A1AC41D4074587C3018FC713979058545484458B1661747414EFBEFB2E4322111111110160E39A054F4A468F1D3B86BD7BF7E2CC9933EACFD6AE5D8BDCDC5C74777763DFBE7D1FFB5CBB76EDC2850B17505A5A8A471F7DF4631F4F82D55CADED73BBDD387CF830BEF39DEFE03FFFF33F118D46F1277FF227F8EBBFFE6B2C5FBE1C4EA713D16814A150089148047EBF1F814000C16010814000914804E170189AA6A93589FA1039D72C310FB3950000200049444154160BF2F2F2108D4671E2C489B88C8188888888E61FCE242E70269309494949F8EA57BF8AE4E464545555A93F0B85420887C3B0582CB75C6F68341AE1743A61341A110A85100A856E790E9981DBB56B172A2B2BB17EFDFA59D98436140AC16432C162B17CEC637DD8793A3A3AB075EB56BCF5D65B8846A3D8B87123EAEAEA5058588894941415FC64F6D06432C16C36AB7587D168149AA621180CC26432A999C68FBA47E46C32180C28282840777737CE9C3983999919389DCEB8AD9524222222A2F98121718133180CB0D96C78E2892760B3D962F6CB6B6E6EC6CCCC0C962F5F8EB56BD7DEF45EB3D98CF4F474D8ED76F87C3E783C9E5B9EC3EBF5A2B5B515232323D8B469130A0A0A6665EC535353B0D96CB7D530E74E8D8C8CA0A9A9097BF7EEC5C99327015C9F61ADAEAE466E6E2E1C0E0742A1902A2535180CB0582C30180CB05AAD2A38CACCA1BE2C371A8DAA2D40E475732D3F3F1F191919686D6D457B7B3B6A6A6A90909030E7E320222222A2F983219100004B962C412814C2E4E4242E5EBC88E9E969BCF5D65B484949C1860D1B505F5F7FD37B4C261352535391969686402080A9A9A95B1EDBEBF5E2C48913088542B0D96CB3B63FE0E8E828929393B168D1A259399E9EDFEF477F7F3F0E1F3E8C37DF7C137D7D7DC8CDCDC5FAF5EB515555A5662FC3E13042A1504C18B4582C884422316B106576CE62B1A85944098E66B359ADED9C6B191919C8C9C9C1A953A7D0D8D888D2D2528644222222A2058E21F11EA76FDC22258D77CAEBF5A2ABAB0BFBF6ED43474707C6C7C7F1477FF447D8B061C3FB1ED76030203F3F1FD168F47D4362241281DBEDC6952B5730343484C9C949242727DF7159A37CE6B1B131E4E7E7233333F38E8E732BD168143E9F0F3D3D3DF8CD6F7E83D75F7F1D369B0D0F3CF000366FDE8CE4E464188D46350328EF91F586B2BE30180CC2E170A8A63E66B339A6918DFC0CB81E22A3D1E89C35E0D1B3582C58B46811D2D3D371E0C0017CF18B5F447676F69C8F8388888888E60F86C47B9CDFEF57E16C7272121E8F079148E48E025862622256AF5E8D9A9A1A0402016CDDBA157BF7EEC5850B17F0ED6F7F1B8B172FBEE5FB645DDBE8E8E82DFFDC6EB7A3BCBC1CD3D3D3F8CD6F7E83502884AF7CE52BC8CACAFAC86304AE87CEF1F171B8DD6EA4A5A5CD6A489C9898C0AE5DBBF0CB5FFE126D6D6D58BD7A35366DDA84F2F272D8EDF65B7628953588F23B979F47A35184C361F5DFB25588BC5F82A3D96CFED0CEB077537A7A3AF2F2F2B073E74E8C8D8D211C0ECFDA6C2F11111111DD7B7827788FD1340D914804FFF33FFF83CB972F63606000172E5C40464606262626F0C20B2FE0E8D1A3484848404646069E7EFAE9DB2EC7341A8DB0D96CB0D96CD0340D8F3DF618CE9D3B87E6E666180C06FCDBBFFD5B4C38126565653875EA142E5EBC8868347A53E0494848C0BA75EB70FFFDF7E3E8D1A3F8F9CF7F8E83070FA2AEAE4E85D2ACACACDB0EB61E8F4775E3CCC9C9414646C66DBDEFC31C3D7A14AFBFFE3A9A9A9AE0F7FBF1A52F7D09A5A5A5282C2C84C96442201080C16040341A8D0976326E9925D4772E95D7C8EC21703DE4CAAC61301884DD6E8FCB2CA2484F4FC792254BE0F57AD1DEDE8EA2A222E4E6E6C66D3C44444444145F0C89F72083C180C2C242B85C2E14151561C58A15EACF64537BBBDD8EA4A42458ADD60F3C563018C4D0D010BABBBB515A5A8AA2A2221576F2F2F250585888FDFBF7E3C89123B872E50A3233336FEA265A5757871D3B76E0CA952BB872E5CA4D01C362B1203B3B1BDFFCE6379197978763C78EA1B5B51567CF9EC5891327505E5E8EF2F2722C5BB60C35353570B95C1F1818DD6E370E1D3A84A2A2221416167EAC4EA9E170182323233878F02076EFDE8D0B172EC0E572E1FEFBEFC78A152BE0703860B55AA1699AFA47BAB84A60B4D96C6AF656F66E9499B81BB7B8D0CF36CA3FFA7D26E311169D4E27727272909E9E8ED6D656D4D7D73324121111112D600C89F71899A17AFCF1C767E578B2F7DFCE9D3BF1852F7C01999999318D4B9C4E272C160BDC6E37A6A7A7919E9E7E53485CBA7429CACACAD0D7D787F6F6F65B060CA3D188871F7E18A5A5A5A8ADADC5D1A34771E6CC19F4F6F6E2F4E9D3484D4D457D7D3D3EF399CFE0A1871E425A5ADA2DF70F94B58F4D4D4D78E4914750525272C7FB0CBADD6EF4F6F6E2D0A14378F1C517313E3E8EF2F272AC59B306959595AA3454C2A0CC0CDED89D544A4965ADA46C6D21C1515E2F5D4FF5B38B369B4DCDCEC66B5DA2D96C46727232CACBCB71E6CC195CBE7C192B56AC886B092C11111111C50F43E202E7F17870ECD8311C3E7C18D5D5D5F07ABD2A2486C3614C4D4D21140A213D3D1D999999B75CAB66B55AD1D0D0008FC783A3478FE2A1871E7ADF4DE24B4B4B515A5A8A279F7C12C3C3C3D8B56B17F6EEDD8BD3A74FE38D37DEC0FEFDFBF1DA6BAF213939F996E7F2F97C181A1A426F6F2FD6AC5983A2A2A23BFADC5EAF1767CF9EC5CB2FBF8C975F7E1956AB158F3DF61856AE5C89B4B434844221582C96981941F96FBBDD1ED36C461F1C2391880A87C16030A69BA994F1EA7F373736AF79BFBD26EF36A7D389BABA3A6CDDBA15FDFDFDF0FBFD703A9D71190B11111111C51743E202979C9C8CCF7FFEF3088542A8ADAD8DD92771606000ADADADB05AAD78EAA9A7909A9AFABEB34BEBD6AD437F7F3FB66EDD8AC1C141E4E6E67E60A9ABC562415E5E1EBEFEF5AFE3A9A79E424B4B0B5E78E105BCF4D24B181F1F473018BC6548ECEAEAC2810307F0D8638F61C9922570B95C77F4B977ECD8815FFFFAD7E8EAEA426565251E7BEC31358B2A65A5E17058AD01351A8DB0582CD0344DFD5BB6BB909028A5A312042540CAB1CC66B3FA5CFAE028B394F1E47038B072E54A6CDFBE1DE7CF9F474F4F0FAAABABE33A26222222228A0F86C405CEE572A1BEBE1EE17018972F5FC62F7FF94B15CE2E5DBA84ECEC6C6CDCB8110F3DF4D007961F262727A3AEAE0E972E5DC2AF7FFD6BFCD99FFDD9FBAE6BD3340D5EAF17E7CE9D43454505323232505A5A8AEAEA6A1C3D7A14696969B70C98535353E8E8E8404F4F0FBEFBDDEF223333F323959ACA67FCDDEF7E879D3B7722180CE281071EC0EAD5AB919393A34A3F654DA1C56251B38552061A080462B6B6B05AAD31DD40A59CD46030C06AB5AAE3C97A457DC31B39AE04C778EC9328642B8CFCFC7C5CBA74091D1D1D0C89444444440B1443E202673299D47AC09494148C8D8DA959ADA4A424646767A3ACACEC431B99984C2694979763F3E6CDD8BA752BBABABA60B7DB63662685C160500D634646460000A3A3A388442278F6D96791979777D32C622412C1E9D3A7313636860D1B36A0B6B656AD19BC1D6EB71B6D6D6DD8BE7D3B76ECD8818484042C5FBE1C353535AA7B29703DB8C906F7C07B5B5548F8D3073C9921D4772895D747A3D19819473986AC4BD437ABD1774535994C317B30CE15591FB964C912747575A1B3B35395DC12111111D1C2C290480080458B16DDF65619EF272323030D0D0D181F1F476F6F2F92929260B3D96E59126AB15890999989CECE4E78BD5E048341646767E3F1C71FBF65B0ECEEEE46777737B2B2B2B079F3E68FB45E6E7474142D2D2DD8B66D1BF6EDDB87A4A4247CEA539F4251511192939355300C87C36A3DA1C56241241281D56A55C10EB8BE1E51BFA650CA4BF54D6C0C060342A1900A83120E2391484CE004A06623F5A5AAF10889A2A2A20267CF9E45777737AE5EBD8AFCFCFCB88D8588888888E283219166556A6A2ABEFCE52FE3B7BFFD2D06070791969686D2D2D29B5EE7743AB172E54AAC5CB9F2B68EBB7FFF7E141414A0A1A1E1B6F7458C4422F0783C3878F0207EF5AB5FA1A3A303E5E5E5F8D297BE84B4B4B4982EA3E170183E9F4FCD000280DFEF0700D86C36754CF933FD1A422925D597E34A680C87C32A0086C361D8EDF69859432955959F592C1675DE78282B2B435A5A1A868787D1D2D2C29048444444B4003124D25DF1F4D34F43D3B40FDDA7F1767DFDEB5F87D96C8E096C1F44D3345CB97205CF3FFF3CB66CD90293C9844D9B3661FDFAF5484F4FBFA97CD46834C266B3DDB234546618A3D1289C4E67CC9E88C07B1D4AF5614FBF0611782F884A7894F3048341B5CFA3AC658CA7848404E4E7E7A3ABAB0B478F1EC5E73FFFF9B88E8788888888E61E4322DD154EA773561BB1242626DE7680F2F97C387EFC385E7AE9251C3870008B162D425D5D1DCACACA54D9A77E8B0B09B31212E53C0E8743359E91C63591480481404035A08946A370381C6A4650829E844F7D69AA94AA4AB8943029C795358DF164301850585888DEDE5E9C3A750A1E8F47FD1E8888888868616048A4BB663667C56EF758232323686C6CC48E1D3B70FAF46914171763C58A156ABB0C59EF27DB5ADC38B3276B02F5FFB7CC2A4A49A9BEB4540264381C56E394D0295B5BDC1818F5C1511F2801A8AD3664FB8D78282C2CC4A2458B70E6CC19B4B5B5A1A6A6E68EB71A21222222A27B0F43227D228442218C8D8D61F7EEDDF8FDEF7F8F8B172F62F1E2C578F8E18791999909ABD51AB387A184BE1B1BCFC83F32A3283384F27A006A5DA11C4B3FFB2821331A8D22140AA92EA61236DF2F38CA0CA4FCB7D7EB8D5B039B458B16212F2F0F6D6D6DD8BF7F3F8A8B8B19128988888816108644BAE785C3615CBD7A157BF6ECC18F7EF423844221DC7FFFFDD8B061036C365BCC8CA0FCB7C3E15041CF62B1C0683422128920180CAA2EA49148047EBF5FED7728338FB256513F2B68B7DB634A53F55B5948F034994C0806832A7046A351D86C36F567329E1BB7FF986B56AB15999999484F4FC7DEBD7BF1F4D34F233B3B3BEEEB2589888888686E3024D23DAFA7A707AFBCF20A7EFCE31FA3A8A8081B376E44656525CC6633DC6E3700A8F57E369B0DE1703866FDA17E4F440942B27650660B65D3FB60300897CBA542A79495EAF744941029E70010731C99510C87C32A389ACD6675BED96AF6F3712C5AB40845454578E38D3770F5EA55949494DC76D32022222222BAB73124D23D4BD3341C3D7A14AFBEFA2AF6EFDF8F8A8A0A6CD8B001454545484C4C54337BFAB252D9EA42829AEC53180E8761B55A5529A8843BD9C310786FBD2100D5C826140A211008C0E170C4844499A194F749A9AA7E4F4409A2329329C79563EBCF37D7D2D3D35156568660308893274FA2B8B81845454571190B11111111CD2D8644BAE74849E7810307F0DA6BAFE1D4A953484949C1830F3E88C58B17C3E974DED4A154660D25C449E9A8AC450C0402AA698CFC3C1A8DAAB58C12F46C365B4CE319FD361AFA70170A8554C893D9CA68341AB325867E0B0D09B4723CABD5AA4A5FE3C1E170203B3B1B79797978F7DD77B16AD52A8644222222A205822191EE29D16814D3D3D3686B6BC3F3CF3F8F8E8E0EA4A5A561CD9A35A8A8A840281442281452A14B429E0431006AB6501FCC24B0496894EEA2122625B84940943D1181F7B6B6D08742FDB1249CDE181C2590CAB9F56156B6EA885748341A8D484A4AC28A152BD0D9D989BEBE3E343434C06EB7C7653C4444444434771812E99E2101B1A5A5053FF8C10FD0DFDF8F55AB56A1A1A1011919198846A3F0F97C6ADD9F6C73110A8554C003A0CA41F5414F4A3FA52BA934AF911255002A4CCA8CA0844E292BBDD59A46FDF616FA002AAF0B85422A78DD78FC78378A71B95CB8EFBEFBF0EEBBEFA2B3B313434343282D2D8DEB9888888888E8EE6348A47BC6CCCC0CB66FDF8E9FFEF4A7E8EDEDC5934F3E899A9A1AA4A6A6AAD9BD84840435FB075C0F66814040CD06462211242424C47419D5340D369B4DCD1CDAED76152A4D26534C639B1B3B9E46A351381C0E152AF525A4C07B0152DE2FC704A0660DA5898DCC20068341381C0EF519E2C5E170A0AAAA0A3939393873E60C5A5A5A18128988888816008644BA270C0F0FE3C5175FC4B66DDBE0F178F0D9CF7E169595954848480000553A2A9D4581EB014D6603250C0250B383B20FA29484864221582C16F53E7D731B9911BCB1198E1C2F180CAA194C4DD360B7DB5570D4BF1740CCBA44098EFAD7DC1822E3D5BC463AB4D6D4D4A0ADAD0D274F9EC4E38F3F0E87C31197F110111111D1DC307EF84B88E227180CA2BFBF1FFFFBBFFF8B37DF7C131E8F07AB57AF46656525121313110E87E1F7FB110E87E1F57A55531B0977D27CC66C36C362B1A8C633F233FD5A425903A86F6623C70E87C308854200A0DE2BC7942634526E2A63088542EA7D814020661F46FD7E8A00D48CA58C4D9AE8C47BCF4400A8ADAD85D56AC5B973E770F6ECD9780F8788888888EEB2F8DF8112BD8F4020808181016CDDBA152FBFFC32AC562B1A1A1A505757A70256281452012F1008A82EA2B287A1ACF9D3771905A0F630BC712B0A096D723C799F949A1A8DC69899C05BED89A86F8C032026B84AD094006BB3D96E9AADD497ACEADF132F252525C8CBCBC3E5CB97D1D8D888FAFAFAB8AF9724229A2F641982AC89A77B47381CC6F8F8B8FA9E8D442270BBDD181D1D85DFEF8FF3E808B87EBF949C9C3C2F7A352C340C89342F4522110C0D0D61D7AE5DF8A77FFA272C5EBC189B366D426565A52A21BD31B0DDD8680600BC5EEF4D1D4AC3E1704C7094758376BB3D662650BAA34A3319F9271C0EABE3592C1684C3E1983D116F753C7D631CFD3A44B3D98C6030A86611E59CFA59C678B3D96C58B2640986868670E0C0017CE73BDF81DD6E8F69CA4344B450F97C3E5CBC78119D9D9D080683F11E0E7D0472AF31313101E0FADF657777370E1C38C06EDEF384DD6EC7860D1B909292326FEE8B160A86449A97868787F1DA6BAFE1673FFB19727373B161C306141616221A8D22180CAA1938FD7A3E695AA30F6C122625D8190C0678BDDE98EEA7369B0D914804369B4DBD4F4A4A6FDC0751DF0115802A21753A9DEA5CFAEEA9723C9971D4774095FD1AF5FB2486C361984C26151CE78BF2F272F4F6F6E2E4C9933874E810EEBFFF7E242525C57B58444471373636865DBB76E1BFFEEBBF30333313EFE1D0472095481E8F070070EDDA356CDBB60D7BF7EEE5ACD53C919191812D5BB6A0B2B2923D11E6D8FCB90B25FAFF868686F07FFFF77FD8BE7D3B525252F0C8238F203D3D1D46A311814040CD1406020115E680EB6B0525F849B073381CAA198CBE7BA9843D09667EBF5F95941A0C06F53E00EA67FAE632122865965242A7CC4E4A9005DE0B89B2B585FC4CBF2587BE218E7E7DA2FC2C5EFB258AF4F474141717A3A3A303BFFBDDEF505E5ECE90484404A8ED97DC6E37AAABAB91939313EF21DDB30C0683FA8EF6F97C484C4C84CFE7538DE02C160B7C3E1F5C2E975A1622DFA1F2BD6B369BE1F178D4C3647DF7704DD3100A85547F02B7DB0DBFDF8FC3870F6368680889898958B66C19162F5E8CE4E464F5605ABEF7E57C2693095EAF579D5BEE139C4E27DC6E37A2D1A8FA1C5EAF57EDD91C8944603299E07038E0F178D498648C0E8703814040DDB7C8BD89DC4300D7EF6BDC6EB77A482E7D146EAC5892D7E91BF145A351B85C2EF8FD7E751F22CB76E4F7254B61A4DC56DE1F0A85E0743AD57D98D96C86DD6E57155BFA7B263987BED15F381C569DDBC3E1B05A12148D4663FE0EED763B42A110A6A6A6D0D9D989CECE4E35469A5B0C89346F84C3614C4C4C60CB962DD8B3670F344DC3FAF5EBB174E952754192600720669D9F5C606FDCDA422ECCFA193C0980F27FEB67FA80F79E2CCA454D2EBE52AA2A25A8724194D24B79BFFCB70447F97730188CE9982A9F47BE24F4338D56AB55CD84CA78E2C96AB5A2A0A0002525253870E0009E79E6192C5AB4082E972BAEE322229A2F4C26138A8B8B51565616EFA1DCB35C2E57CC435CB3D90CBFDFAFFA06485894D022614CBEFB2534C9FEC8F21A0998F270595E170C06313A3A8A53A74E01B8FE5D979D9D8D55AB56C1E572A92A24BBDD8E7038ACC290BC573A99EB1F46FB7C3E1556652C369B0DA150483D04D6570EC967959026F7031268ED76BB0A7E72DF219F03B87EEFA4EFAAAE7F082DBF17B997904A2B799DFC1EE5A1B6DC5F4960937B23097B724CFD7D937E2CFA2A2AB92F93FB1E79BDDCCF48D594FE41B99C3B140A616C6C0CC160109D9D9D77F77F74F4BE1812695E0887C3181E1EC69E3D7BF0D24B2F41D334AC5AB50AB5B5B5EACB0180BAC8994C26F524509EAEC90555BFE64F2E3637064700318BA0F5CD66E4022DC14E2E5CE170583DE193A77A321EB930CAF1E409E28D5B58C8133FB9E0CB4514786F5DA57C09EA7F361F646565A1AAAA0A7BF6ECC1F1E3C751545484254B96C47B584444F3825CAFE53B866E9F348073381CAAA3B8CD6683D7EB557B17CB836097CB058FC713D3615C66202514262424A8EF5A9BCDA6BEA7A59A483A8F272424607C7CFCA6B1C8F65AFA6DB10281006C369B7A6F6262A2BADF90EF7F8FC703A7D30987C3A166BF12121254C892F1EA6743E5FEC16AB5AAD9490991327609980683017EBF5F2DAF91FB1C79782DC1535EE772B96296DE582C16F53B05A03AC0CB2CA93CA80E854270B95C310FE7657C369B4DFD7D040201242424C4CC60EACFA10F7F720E99F1941947B99F8A4422317B453B1C8E7973FFB350B1F304C55D341AC5B56BD7F0CE3BEFE0EFFEEEEFE0F57AB162C50A54545440D33478BD5EB53D85FE2995DD6E87CD6683DD6E87CBE582D56A8DB9A848031ABFDF8F4020804020009FCF8770380C9FCF875028844824A22EB20062B6C7907F6C369B0AA4F23A098C5276A1DFDA42C6281764B9C83B1C0EF585238155664383C12082C12042A190DA7643C6375F24252561F1E2C5282E2EC6FEFDFB71FEFC7976F22322A28F45C2754A4A8AFAFE9350A6699AAA5809040231E59CF25D2D41C5EFF7C75413E967BC64662C313151BD4E66F4E4BB5BC66232991008046202A6C7E351C14F1E3C4BE89159388FC703A3D188848404F57D2E4156DF69DDE7F3A907DFF239AC562B66666654E33AF91D389D4EF87C3E35560972127425584979A83CA0F0FBFDEADC520D65B15862CA4F2538BA5C2E5532AA7F782D815D02AECFE78B79D02E65B83216F9DDC9EF411FF01C0E07BC5E2F80F7F69BD6340D4EA753DDEB48C89573C8437E8A1F46748ABBC9C9496CDBB60D3FF9C94F60B7DBF1E94F7F1A393939EA22EFF178D4854B2E48521B2FA59B12BAF45B51E83B70CA4549BF07A27E2DA1CBE552E529525221A1539E5202D79BE3E8CB40E422EDF3F9623AA13A1C0E75D19331C805535FDA2A6B0FE59C722E7D89E97CEAE695989888871E7A086FBEF9263A3A3A70DF7DF7212D2D2DDEC32222A27B94D56A45727232C6C7C755B89099B48C8C0CCCCCCCA8E02021322525453DAC4D484880DBED569DCBCD6633DC6EB79AC59307B9494949989E9E56E1CF6834C2ED76233131518536110C06919696864824A266C502810042A1907AE03B333383848404844221048341984C2615EA641650D647262626C6ACE5B3D96CF0783C6AC6D3E3F1A8D93969A467B158303D3D1DB3B6D26432212121013333338844226A2C6EB75BDD1BC9395C2E17666666D43A40AFD7AB1E84CBDA4AB3D98CE9E96975AF22F7592E974BAD7BD497F6DEB8B652CE21BF3F098EB22651FE3EE53E4E422B70FD7EC2ED76C774A78F44222AC8CBE7A0F8E16F9FE26A7272125BB66CC16BAFBD0683C180CF7DEE73282D2D55DB47E8C3947E2DA2EC89284FAFA404443A5FE92F3A72E10510B317A2044BF933995594E0A73FAFBE9E5FBFFD85CC36EA1767EBC7A8AFE7978BBFCC32028899C19471C8178BFC997ECFC7782FDC76B95C58BD7A351A1B1B71EAD429BCFBEEBB78E49147E23A262222BA37494590843A9949D3340D292929989999519DC52538A6A6A622180CAA324F99B593194799B14A4949514B462C168B0A1E4EA713C0F58A20293795EF7C79989C9C9CAC2A84F44149DE2BB37632B3A80F40FAD749339D6030A8B6CB927596328B26C14CC628A5A0B21653CE2DEFF5783C884422703A9DAAE4531FACA562494A43F51553127625D449731A99ED9407D7D2055ED65FCADF81CCF6C9BD8F044FE0BD758E0E8743054400EADE45662665698FCFE703107B7FA76F78A3EFF540F1C19048712133717FF8C31FB06DDB364C4D4DA1AEAE0EF9F9F92AC84948944633FA60A59FB5938BBA5C28E5422517707D70942F1A293F01A02E7C379681CA532D098EFA520C29E3D0CF3AEACB3724A4CA39E498523A21EB18F47B22EAC723FFD6AF5794328C78B2582CC8CCCC445555152E5EBC88E6E666AC5BB78E0D6C8888E82391725199E973B95CAAC247BA6EDED854C5E974DEB44C241C0EABB5778140000062D624EA9BD9C877D58D3FBFB1DC54FF5E0946722F21DFC5FA92587920AC0F88123CF5CD5DE4D852DDA46F66238DF1E41C728F203F97993E295DD5DF17C85A3E799DFEDCFA102AA157C6A76F7823F71CF2FB959FCB78A583BC7ED6311289C47496977B30FD037339877E798ACC8CDA6CB698C67D726EF97D72494B7C714D22C585C7E3C1B163C7F0DBDFFE1657AF5EC5B265CB505757A782995C28A474418294043359EC2C6B12E5220BBCD7F5541ACF844221040201F5244F9E52E9BBA7C96CA43C819363EA3B9CDED84D55CE21C14F2E741240E57812286FDC73518E29C7938BBF5C3CE5222BB394F3E5899AD16844434303344D436B6B2BBABABAE23D242222BA8748A3167DF74F7DF31383C1A0B68ED03F209699347D975139967E1DA1D96C86CFE78BF9CE95EF77F97E351A8D6AED9EFE81AC9C5BBFAE4EBEDB65065382A39C5FFF905766E5E4BB5BFF6059EE712460CA39F40D70E41CFA12580997B2E6D26AB5C68C45FE2D8D66E49CFA594E09B11248F50FCC6FDC075AC2AA3C74D7AF6394D74998937B1F798D3CB0978027B3931256F5339E375674C97BE7CBFDCE42C79048732E180CA2BBBB1BFFF22FFF828B172FA2AAAA0AAB57AF465252129C4EA7BAB8C8BE53E170185EAF5785BC502814B3AFA05CF813131361B3D9546731298700A002A7AC710C0683F0FBFDAAFC4482A3FE6227176F39A6D3E954C1547F31F57ABD6A4D823EE409798227A51EB2485DDF0C47DF91351289A885F572DC78CF20DEA8B2B212C5C5C5B87CF932B66FDF1EF3E4908888E8FD188D46381C0E15982C160B92929254531500F0F97C6A8D9F7E266C6A6A2A661B0983C180C4C4444C4E4EAAD92F8BC582C9C949F5FD2A8130313111D3D3D3315B3F0050F71D00D4F7BA744B05A04A3BA5F45502973CC4D66FFF90909080E9E9E9982D23A2D128121313D53D8C3EA4C9ECA494A5FAFD7E3583280D749C4E2782C1A00A50B2C7A2BEDBBB94D1EACF21E79673E84B64E51CFAB25479582DF73D324BAA6F10244D6AF425A7FA194109DDF2FB90D748375AFD7A46BBDD1E13E4E5DE4ED66002B869AD28CD2D86449A735D5D5DF8ED6F7F8B77DE79072B57AEC4F2E5CB553B6797CBA566E0E402A6EFFEE9F57A313D3D8D40208099991952CAFBF00000200049444154B5905CBA98C985592E4C090909AAFBA9D3E9542DB625E4C993398FC783402000AFD7AB3A9FFA7C3EF5852017499971BCB1032A101B44DD6E77CC0CA67EC61178EF89A87EC6D16AB5AA194CFDBE4132AB3A9F98CD66545656C26EB763EFDEBD181D1D9D77632422A2F945429574AEB4DBED703A9D181B1B53E1403A8FA6A6A6627A7A5A050599DD4B4C4C54659A369B0DE3E3E36ADB0BE07AA5926C582F336776BB1DE3E3E36A564B4A49535353D5F7B530180C6ADDA38424593329E5AA126E929292D47B25C4EA03A6AC6F9C9A9A52A1E9C6B59532AB265545D2204F02A234C29107E2F2505BD6244A19ADAC55BCB19BABDC87E8EF55F49F431F10A59BBB7490D597F1EAD756CAFD997E6DA5FCAE659653BFB652EE9FA43C55CE217FB7FA8639D2CD95DD4DE38F6B12694EF5F5F561E7CE9DD8B56B176A6B6B919797A73A96E917364B072E7D79A99425DC6AE64D9EFCE9EBFE01A87216FD06F737AE71947029A51912CCFC7E7F4CF9A8844A591F2135F412ECF4C7D3B7B796A79DB256425F962A1774FDF1F4E794CF2BBF0F099CF1663018B074E9525CBA7409870F1FC62BAFBC822F7FF9CBC8CCCC8CF7D0E24A5F36339F8F494434D7E4BB4D669064ED9E948FCACC9954DB4C4F4FC7944FEAB76B90C023336FB29E5166A3246CC82C9FCFE7530F79253099CD66CCCCCCC434C993194BB7DBADBA9BCBCC9B044299D14B484888D93A42BF2FA27EFB0DFDAC9FDC13242424C0E3F1A8FB13B9EF9073C83D898437E99D20F7211294E5C178201050DD4EE55876BB1D7EBF3FA6619E044AD97642BFAE53661C65AB8BC4C4445552AB2F3195F02765A9FA8EAAD2955EBF4587FC4E65B614802AB595B58D72AF2733C8F219B82631BE38934873667A7A1ABB77EFC6DB6FBF0D93C98475EBD6212B2B4B5D08E56997C7E351177E0967327327FB0DCA1344B9B0E84B2B24344A29A9BE54552EDCFAFA7D297B9027601232E5A2AA691A82C1207C3E5F4C09A8AC07D097BECAF1644D84FC230150BF37A26CC5A15F3BA96F6E73639DBFBE51CE7C90929282D2D252A4A7A7E3E5975FC6D0D0D0827DEA178944303838885DBB76A916EBB3C1E7F361F7EEDDB878F12282C1E0AC1C9388281E64964AC2857CB746A351B57D837CFF4A88914628F2BDAA6FFE26014A1EAA4A40946349F093A023A5ABB2C6FFC6F70BF97E96FB0F7DC31CD9EA42CE21DFD3F23AD9FE4AC6A86F0223AF95F25019AF3CA8D6378A91F7CBE790E0A43F87FE81B13EE4C979A4318EFE5E4682AA7E5F4399DD03623B91DE3816FD4372F98E93DFA3FE61BAFEF72EF730F27729B3A83216F9B91C5F1F48F5C7A2F8E04C22DD75128C9A9A9AB063C70E0C0F0F63D5AA55282B2B531740B9C002501726B960048341F5C451BFB58574F7D2D7E5CBDE477201D3AF2FD05FF8A59DB4BEDBA9BE418C5C3CF54FF8F47F2E174EFD5E8B377628D52F1607A09E9AE92FECFA71C9B1F45F6EFA2F87F9B65F90D168447E7E3E2A2B2BB165CB16B4B6B622272707595959B37E2EE95E3B3D3D7D4733A9168B45951ECFF6974E341AC5E0E0205A5B5B71F1E245343434CC5AB7D7482482BEBE3E783C1E844221949494CCBBFF1D10117D1859A6A10F1BB25585041400AAA24766A3E47B51BE4B7D3E9FAA38D277DD94C025E708040270381CEAE19ABEEBA76C0B210D73F4DF0912A0644CF21D6C3299303333A3AA7A80EBB398FAF573FAF577FAFD04A5819DAC6134180CF0FBFDB7AC1872BBDD316395463CFAEEE9B261BDBE6249CE21154B526E2A3F977B185983280FB4E5335A2C16B5C44682BABCEEC6C641720E09BBF2FB91F1CAACE18D4D796416577E57F27B97F7CA6CA4DC13C9EF9EE287771B74D785C3618C8E8EE2BFFFFBBFD1D5D585AAAA2A343434A8A75772F1D33772910BA9CC2C4AF093357CFA36D3EF171CF50BC7F541341A8DC6CC54462211B85CAE9BBA6D49A9AA6CA7211774B9200250A512B2EF905CF0E589A0FE422C63D40747FDE79531EB3BBCCAC55BBF95C77C92999989BABA3A6CDBB60DBB76EDFA7FEC9D796C9DE775E61F2EF79277BF5C45513B255292A9D55214EF5B1DBB8E1CB4137BD2200B26481B0C3A8399A228D07F06E83F33CD00339801A69849EBB4A99B2E4E6CD76E5DDBAAAD7889146F526CCB962559B2765A12298ACBDD37F292F387F07B79EE15B558A64CCAFE0E1038A4BEE5FDBE7BF9BEEF73CEF33C475D5D5D6A6F6F9F7120363E3EAEB367CFEA830F3E502A9572941F49156642D5E750416E6A6AD2FAF5EBD5D5D535E3202B914868E7CE9DFAF8E38FF5EFFEDDBF537373F38C2D6CC16050DFFAD6B7F4E31FFF58894442A150489D9D9D33726D2FBCF0C28BCF2268000FC327180C2A97CB395395FAFA7A653219C56231A7AB63CDA5D93DAC200C52D0C0B39E5AAAA6D5D95141ACAF3FDF343E140A39D9066B078C1E694AF601B082C5944C26555B5BEBAA915059D903C01E4AA7D36E8CB6E17C329974D544AA91BC074B7DB5ED30A8026268638F63BF01500E85424A241215BFAFA9A9715A45F649C86800CA5054D15CB29642A3A5DA47753193C954B8BEA2D3CCE572151459F6413C07EF599A02EC682E71A5E5F9A006DBBD9617B3131E48F4E29AC7C0C080FEE7FFFC9FDABB77AF962C59A2152B56B8C502A13919C06AEA87AD1432918C8D8D39E0681BC45A206527319B85B3C0B11A98717DE813E80A2C05D59AE35071B45936DB32C3660A590CAD36409A028E36ABC6BF5B3A87ED17C418E642D4D5D5A9B9B959F7DC738FDE7AEB2DDD71C71DBAF1C61B67BC6F22B4996432A9A3478FEAEDB7DFD69B6FBEA9898909DD78E38DDAB2658B162D5AE48E87FEF9F6DB6FEBC89123EAE8E8D0EFFDDEEF69C18205330E12FFF66FFF56C3C3C3BAE5965BD4D1D131A38B1A260D77DF7DB79E7BEE393DF2C823FA933FF9136FE1F4C20B2FAE8BA8ABAB536B6BAB32998C036668D8E2F1B8035C000D689300C4783CEE1CC4317803D0203DC9E7F38AC7E31718B7140A05C5623195CB656532998AC6F2DC239148542419D98B64B359B5B6B66A6262C201231C4A194B6363A332998CD343E2CE8A4610494C329974344F80632412513299748012239C482452F1BCA15048E9745A8140401313130EBCA137A4529848245C121B80188944944EA72B3493682B01625410018824E7A5F3BD26ED71D96C56D294D703DACA4C26E340A824A799C46BC2B60B0906838E2166013A7B2CC682778427B398DDF040A217D7343EFEF8636DDBB64DFFF44FFFA4EEEE6EDD70C30D6A69699124375943AF44A387631759AC6030586134C37FA1884A72D541DB8B874C22D5454BDDB4154CB2574C4AD628C40AE62D35D4EA036D1F44AB4D84FA2A4D516EAD8E111D86A5AA5A7A857D665B659534A726CE4824A23BEFBC53EFBEFBAE7EFDEB5F6BCD9A35BAFDF6DB67F41E3E9F4F9D9D9DBAEBAEBBB479F366058341EDDEBD5BC3C3C35ABB76ADEEBDF75E757575B9E327272795CBE5B475EB563DF7DC73DAB3678F4E9D3A35A3A63FA55249FBF6EDD3871F7EA8D5AB57EB4B5FFAD235016FB5B5B55AB972A5F6EEDDABF7DE7B4FAFBEFAAA6EBBED36671EE085175E783117C3EFF72B1C0E2B9D4E5768CF4AA5929A9A9A1C4000D8D866F7B45B28140A4EAB585F5FEF2A90249869FD601D40A17646A351C726613D2D168B0A8542AE5D03FB08BB97C07515CDA2A48AAA18554E4B7D857609F0617E06FC3126C697C9642A8C68680BC2730030E91569F7228140C0B197785738AAE2FA0A25555245FFC97038AC42A120694A4F58AD0BE4380022C7A1CDE49D50F5634FC57B0C06838EAD65F59F30B62C8BCB1AE150690C854215FA442F662F3C90E8C5358B6432A9B7DE7A4B4F3FFDB4FC7EBF6EB8E1062D59B2C439864133B11532260604CF64A798800149003AABF7B3FD0BA5291D1BB41168A32C00DC936A5E3570A41505931420D6824D408705AC64D3A0C1A02360A1E05CC6C8848B501B8D839D1C2D709C6B93A6DFEFD7A2458BB472E54A1D3972446FBEF9A6BEF4A52FCD2888814EC30662EFDEBDEEFA1D1D1D5ABA74A9962E5D7AC179505E2291884E9F3E3DA3203197CBE9E9A79F56341AD59A356BD4DADA3A63D7AE8E4824A275EBD6E9CC99337AE28927B476EDDA8A26D35E78E185177329A8FA41FBB72D212C00B3552E242496FA89EE0F2F01DBBE01E00313C87A12B0B740AB58DDCF0FB062E9913600361C03C0E41ED5CEA0969A695B4DB0B7B02C298019896CCEE55D415D85E6694D79182F7B1F8E21E1CCFBB4000C50C6B8AD898C95B570BE7D279671C5B5783FEC5F78A7922AC09FDD030174B95FB5118E05E3EC85B88F17B317DE0EC38B6B12E3E3E3DAB3678FB66DDBA60F3FFC5037DD74933A3B3B150C061DD80B0683F2FBFD0A0402AE513DF491EA4A1EBD0B994459082C90E31A8D8D8D0E3056BB9E02F46C4FC3F1F17197F562C2E53CDB868349D6D261AD86703A8752690A880264E975C475AB9F97F35944ED35E7A21D340BCC962D5B542A95F4CE3BEFE8F0E1C3B33D2C49E7C7D6DBDBAB9B6EBAC9519466228AC5A24E9D3AA5975E7A492B57AED49A356B66E4BA978A9E9E1EAD58B142BB77EFD69123479CE983175E78E1C55C0A9CC26B6A6A5C25CC4A483077B1AEDFB6CD13A0064D1E00064909A00B1043558D642DE6295033AD9CC3DE030AA84D383326D65BD66812D5DC039315F6230022C091BD8795A9B057E0DE96A6497F40FE0DCAA9056FF6BDD8FD0AE0CCB6AAE0339054619863F745BC13D64692D024D8EDEF719DE5792CAB0A061695622BABE19D9264AF665D59304E0B8D6A998D17B3131E48F4E29AC4E0E0A09E78E209EDD8B1434B962CD1C68D1B1DBD837612D254060E10160A85D4D0D0E0AA464C96C56251854241F97C5E994C46A552C9B5B6C0098D89CAF6588C44226A686850301874954B2B74078465B359770F4064B158740B0EBAC86030A8C6C646A75344D780668EF1401901845AA1BD54D95098B1B2B05AE31E267B161626D3B918EBD6ADD3A2458B74E2C4093DFBECB3D36667672382C1A0E2F1F88C3A9B0E0F0FEBADB7DE523A9DD6E2C58BAF89A36B7544A3512D58B040F1785CAFBEFAAACE9E3D7BCDEFE985175E78F14902DA236001D31AAA5F3E9F4FA954CAAD7D041A3D496E2D9F9838DF88BE5028A85028C8EFF72B128928954A499AAA5A4972D45280195449984B542069126FDB6690BCB6612B77D294CE8EFD01200D9D9D544991A57A86590C4EAB003FB499545801B478210004193B15B77C3EEF80234EA496964A329C361D16ECF1FFEDF9FC6CDB92002401731C93CD662B00665D5D9DA3C802086D1B12EB50CAE7C1F97C4F72B95C8541502E97AB608DCD853DC417393C90E8C535891FFFF8C77AFDF5D7D5D6D6A6DB6EBBCD4DFA5405D3E9B4F2F9BC128984EB8B88D600BD1D40A9A1A1419148C4550AE1E1E37099CBE5944EA7552814DC7FA91202B498ECEBEBEB150A852A2A98FC7F4B212D954ACA6432EEFAF97CDE4DBCD214C5C3EA121B1B1BD5D8D85851C10428168B45D7C6A0582CBA85A6BA272259390B44E9E1C8A2361729A7D279DDE4FAF5EB150804F4DC73CFE9F4E9D373A66F2209839902890303037AE59557B46EDD3AB5B6B67E669498B6B6367DE94B5FD2CB2FBFAC818181CFE49E5E78E1851757126CFCA529B0D0D4D4A46432E91833B86BC6E3715795F2FBFD1A1D1D75EBBD747E4D8CC7E31A1D1D756DB01A1A1A343C3CECD67312A64D4D4D4A241292A6DA324C4C4CA8B9B9D93999FAFD7EB7C70885428EE21A894494CD662B641F005A4B918D46A34A26936E1FC0F9F178DCE926A98A0148795E3484D02B194B381C76C969F6268CC5B6B4C030870A24153DC0294EABB68288A90E600DADA2D56FDAB10402018D8D8DB9E700EC5A704AA58F0AA2DFEF774EAB922A9C5601BD7C176A6A6A5CAF495B4DC630473A0FB2615C01FEF9372F66273C4DA217331AC964523B77EED40B2FBCA09A9A1AAD5CB952F3E6CD73B407A810803D00219933324E70F2D12FD8F32D5024D3C58264DB4730E9178B4597A522BBC764C624D6D8D85851C1E35A64D86CAF442A7B542CAD33176001BAABA57A58ADA4249769C516DB6A1AA84E5AF7544B5B91E4AAB17325F8BC4F9F3EAD1D3B76E8AFFEEAAFF4FBBFFFFB73A265C3C2850BF56FFFEDBF9DB13622894442070E1CD037BFF94D3535355DF4B872B9AC743AAD37DF7C53D279CAE8F2E5CB259DDF049D3C7952C78E1DD3F0F0B042A190D6AE5DABF6F6F68B2E8CB1584CAB57AFD6934F3EA9E1E16197D1F6C20B2FBC98CD60E3EFF7FBDD9A4BD5D09A970010B3D9ACFB7DA954D2E4E4A4A2D1A8030AB898E2440AE092CEB343A852D2DA429A326891CECF95480CD0018E8F8FBB361954C8006FB662555353A368345AE139400FC14020E0AA9CE170D855C22C70E41EB631BC0575E80E9195F01CFCCC71680A0B8542458BAE52A9A45028A4B1B131B797C15115600BF00438023A01CA762CEC3BD02ADAEA277B293E138E97A6401DEF171099CFE72B12EAB4E2E07849EE33A09ACC718D8D8D1574D5B99268FEA286B7BBF062C62297CBE9C081037AE49147343232A265CB96A9A3A3A382430FE86102C0B9146EBED50630A9DB7E3C2C4400A9EAB6118033EB56C684CE048CAD32C00ECA06137A3570B4E63380447EA6F2C971567BC07FAD4369B5D94EB5FB29554CAEC3F3420B91A69AFBCEC588C7E3EAE9E9D1D1A347F5D4534FE9AEBBEE52341A754E74B339AEF5EBD7BBC5EDD344B158D4C8C888868686B46CD9B24B3EDBE0E0A0DE7CF34D353434E8D0A1433A76EC98D6AD5BA7356BD6E8BDF7DE731A8D8686069D3A754AAFBDF69AB66EDDAA75EBD62912895C70BD5028A4A54B972A9FCF6B707050E974FA9220D50B2FBCF0E25A07EB14D5284BE52C97CBCEA8C68221D65B688F385F5A5313D6694008E0C61ADEB04FA0450463A12A56EDBA0918623D27516BCDE1D863B046B37FB04946A8AEDC8335DBF61F644FC3F8A44A531E6B84576DDEC3B34872F7B05E0CD6EDD49AF248538639BC076B9863DD4401C7DCDBB6ECE279F84C7827D56C2AF4A13C83A5C15A006B4DE3D8EFB03FBAD871D6C0C68BD9098F6EEAC58C44B95CD6B163C7B46DDB36EDD8B143F3E6CDD382050B1C952193C938CD1E938ECD6EF9FD7EA74184024A468B89C7EA05C9DE51D5B3400C9A26F454AA924CB84C7C8C874C22D7E6DFACB8DA523D196FB57E9045CDF6736492B39946A8A3D04AC9BE59A74A5B11E55A3CEF5CD1FA4D173535355AB870A1366EDCA8D3A74FEB97BFFCA53EFEF8E3D91E96A3D9CC841B682A95D2E0E0A0C6C6C6347FFEFC8B56270B85824E9D3AA5BD7BF76AF5EAD5AAA9A9D1ABAFBEAABFFBBBBFD3DB6FBFADA3478FAAA6A6463D3D3DDAB2658B162C58A0C71F7F5CDBB76FD7A953A7A6BD66201050474787FC7EBF060606343232F2A99FC70B2FBCF0E2D3846DF9444293351590C6DA67CD6CAC710A553DAE612B8AB082380E5062FBEDD9F55A3A9FB42691CCBD69D96035FFEC41AA4D560A8582FB1D49699E8BE368A1C13DB98F6D066F0D5A2C38A692C6BE80F756ED2C4A55CD6A01A9F459CD249F83BDAE95DA58231C9C54ED718C91BD07D7B29F1BBFB72094B0C0D532A178BE62B158A135B509F06AA05CEDECEAC5EC855749F46246229148E8D5575FD5DFFEEDDFAAA3A3433D3D3D8AC7E30E803109585E7CA1507056D62C06B48020ACDDB4CD6A65B3D98A0C14FD81A082D86A9B5D405864A4290B672645C4E60058326FB60722EEA92C3C921CC06382E47F38AED9C99A49D60AC225555445019E1CC3FFAC7D3413EA5C048B4D4D4DEAEDEDD5EAD5ABF5FCF3CFEB861B6ED0F2E5CB2B4C0AE65258E05DED5E3B5D8C8C8CA8BFBF5FF5F5F59A376FDE45A9A167CF9ED5F0F0B056AF5EAD8E8E0EB5B6B6EADCB9737AE79D77148BC5F4077FF007EAE8E870DF81CD9B372B1A8D6ACF9E3DDAB4699356AF5E7DC1357D3E9F9A9B9B150E87353838A8919111475FF5C20B2FBCF8ACA3B6B6D699C2A55229C5E371E57239B776421B8D44222EC14BE58D2A234DEDA906024E680705CDB3BEBE5EC964D2F5D1E31EA150488944C2550AA15A3636363AA317CE25B96BFB01F6F5F5395A23E0D6BA95D6D5D5B97B30DFC3F8090683152EAA994CC6ED67D8B7844221A7CB0488C192B2C033180C2A994C56B8954AE79BDAD3F310302DA9A26A1908049C632CEF173DA3FD3CEC71D618271A8D3A8D20E08D0AAFAD98620EC4BEAA502838FAAF059BF4902479CEBD480C583A299F1BEF9D7D19921E2F662F3C90E8C58CC4F3CF3FAFA79F7E5A939393BAF5D65B1D058F3FF6969616A75500F03091B32020EEE65C3BD132494B537D73EC648243A9A40AE008CDC38AA5AD505AAAA48102E818235541EB8E56DD7C979FA90CDA1E87367366812300CF1E6FCF915451FD6442B57A4616C9B90814E3F1B81E7AE821FDE8473FD2EBAFBFAE55AB5669E3C68DB33DAC0B627C7C5CC78E1DD3E1C38795CFE7D5D1D1A1B56BD72A12895C14288E8E8E6A686848C160509148E4A29AC0A3478FEAE4C993FAEA57BFEAE8A4C3C3C3EAEAEAD2F7BEF73DB5B7B75750A9CBE5B2B2D9ACD2E9B4D3EA4E17B5B5B56A6F6F572291D0E8E8E8A77F095E78E185175719F178DCCD5DA150C8B5ABC2F93B93C9281A8D3A7317804A2A9572BABF542AE512AA246B0176D96CD61D97C9645C4F3E9C41FD7EBF12894445B3FBBABA3AE7821A0C06353131E13490B87172FDD1D1D10A4A2395447A2AD3B62A914838B902C0114756D674C05B341A75C0117317402F6008B90DFB2040B6F526401B994EA75DE2187611601C50C77BB3401B008B990D9A44DB57116D25FA4D9EA5542A291289B8EB021CCBE5B242A1504515D79A03598008030A3696757D4543190A85DCF9B0AA8AC5A2739CE59D7A313BE181442F3E75BCF6DA6BDAB66D9BFAFBFB75C30D3728168B5568E6006C8892A9C245A3D10B1A82037CC8D231A102CE3816EA203FF35F2676490EE4E176866691C5C5D2502455540C2DBD83DF556B25A96A06020197A563E1B1D93C4B37B17A45B28C64D9007C644FA950DAAAA8D53E5AFBE8B9168D8D8DEAEEEED6EAD5ABF5FEFBEFEBD5575FD59A356B6644133813013D7AFBF6ED0A87C36A6E6E56B95CD62F7FF94B3DF2C823BAFBEEBB75FFFDF76BC18205179C0BA5D86A56A78B9696164D4E4EAABDBD5D3535353A76EC986A6A6AB476ED5A75757555BC8B7C3EAF53A74E299BCDAAB9B959D168F4A26367B3814BAE175E78E1C5671DB5B5B58AC7E3151B7CD63312BA349FC798CEB66BC078C5B64CC0451C605628141489442A8EC344C63A7B5A3771EE91CD665D9299F51F674FE65E0BACEC1ACB3DE2F1B8BB87D53AB2CE533564AFC2BE0680684D79785ED6FB4020A042A150D1975092035768F4E8876B4D7930CCB1DE08E57259E170B8C294071F06AB49A43AC83E0980497590A4763018744972C648A29CEB58B340EB6ACB7B87CE0BD8A3226C3F2B24480044F66700FE8BADAF5E7C36E181442FAE3AC6C6C6343434A49FFFFCE73A78F0A09A9A9AB478F1E20B2A2B565F67699516384A72808AC5860A99159A33395921BCBD9E058E0035FB3BB25F56982EC989D72D3FDE36C295A6AA79766CF6BA64CC785E16220BF26C735B40A0D543706D6BC7CDE46D81E35CE7EAD7D69EEFF774CB2DB768DBB66DDAB56B97EEB8E30E6DDEBC79B68726493A71E2843EF8E003D5D4D468D9B2659A3F7FBE5B340F1E3CA8C71E7B4CC16050F7DC738FDADBDB2BCE65F1BB9C79D0A2458B5CB5F0DCB9733A73E68C22918856AD5A75818E319D4EEBC30F3F54A150D092254B2EDB77D11A3E78E185175E7C9601C8B1AD152C75509A324F819288A95CF5BA4B95094083890CC09335DBEAFA7004673F4072D89ADC706F0B2E018B8C8FEA97052280240B3CA7DB735813986A031992CAB092ECBBC293C06A1B4918DBDE82FC9EE7059459031A584C922A2A83D67406B0C95838CE024C9EC3EE6BAC8691EB2109B2A63EBC434915EB11C0CF563F6D4B119B74E71E1678B2079AAB267D5F94F040A21757151313131A1E1ED6B3CF3EAB575E79450D0D0D5ABA74E9B48E8C131313AE812D19BB72B9AC6030E8264D2682603058A1B993E4CEB10EA5F0F2AD4369F5446AAF6385E576D223CB48C591C98B8A634343839BB0ABAF41B5D1EAD8B8A67528B5C2712BE86611B28B54B5CB2B0B16CF6E27F6EBA17FD09A356BB47FFF7EF5F5F5E9B9E79ED3DAB56B2F589467233EFCF043BDFEFAEB5ABE7CB96EBCF1464771EEE8E8502010D00F7EF003BDF4D24B5AB264C90520D11A205D2A9A9B9B259DCF101F3A74482323239A376F9E56AC5871C1B18944427BF7EE55B95CD6F2E5CB357FFEFCCB3EC36CBF432FBCF0E28B17E8C4686F618D5BA05722FD0098A14D64FD6E68687055345BD5C378CE82BF5C2E5761620725920A5BF59A4A058AEBD835DF36B507E858B317690A24DAF65776CF507D8F6A0F847C3EEFF6228CAFAEAE4E994CA642635728141CC0E4BAD06DAB7B1E5AC751FBAEAC8F0155476B3203B0E3D990B54071955451ED63DF0275D67A2AF08CB4B7B02C2EF6631C63DFAD05B4F5F5F5EE1E8047C60488E5182BC1F162F662EE9622BC98D391CBE5F4C1071FE84FFFF44F552C16D5D5D575D18DEDF8F8B81289848AC5A2C6C6C694CFE75DA3FA4C26E35C4BE9FBC7C4CE24110A85DCA264AB79D0EDF2F9BCB2D9AC4AA59272B99CA32FD09AC23A94D6D79F6F58DBD0D0A06030E8C4F0D6FA9973B956A150707D8AD054E29ACA64093DC64E9E003BA8366835F8997B31D1B398D5D5D5B9EBB1B85AE04B266F2ED24CAB231C0E3B60F8AFFFFAAFEAEBEBBBA4DEEEB38AE1E161BDF1C61B7AECB1C7DC66433A0FECBEF4A52F291C0E6BFFFEFD3A71E2C405E7B261814674B9181B1BD3DEBD7B954C26357FFEFC698D6692C9A4F6EDDB27BFDFAF254B96A8A5A5E5B2D724B3EE85175E78F15904CC1F9FCFE77472B69D42381C562291A8A8C495CB65C562B10B1ACE43C194A46C36ABFAFA7AC562B10AFA2A144C92C7A552498140C0259D4912974A2585C361150A05D7C78F8A1B6676349CB7CC2492B7961DC4DEC31AB4403FA5871F1536A8B4BC03A8ACD6E51530CD734C4E4E3A200820BD1845169F030BEA8AC5A27358B7CF0108057059B7543B16DEB5ADDC59F31D6BDC47055492038830B424B9CA247B3740DDE4E4A42B02F099DBE32C238B9626D6F5559A4A9E5351F46276C2DB61787155B167CF1E3DF2C8231A1D1DD5DD77DFAD8E8E8E4B56362626261489449CA89AC95D524535AFA6A646F97CDEB5AD601261926B6C6C7446339148A4C23954929B60008A925CC5914916EAA6D5F78542A10A3B694B0905D0954A25E5F37907322D60B315470B162DE594C91660C862013D87E3C9ECF13BC66933874CA870FAE73260ECEDEDD5C0C080FEF55FFF55FFEFFFFD3FFDD11FFD91162D5A34AB63DAB06183BEF7BDEF39813C615D64AD2ED5462412718D9AD1595C8AFA5B2A95F4FEFBEFAB582CAAB38EEF6F410000200049444154B3530B172EBCE0986432A983070FAABBBB5B4D4D4D97CCA04E4C4CB83EA4D355EEBDF0C20B2FAE45D846ED9393936A6E6E76BABCC6C646259349E7F8099D331E8FBB563D808BB1B131B5B4B4289D4E3BC0148BC5343A3AEA2A8280B996961667AAE2F7FB552814542E979D990D062B994CC6ADC518B458A75512CC565F08153612895468C431C641AB6E0122D44C4C79C2E1B0038EEC5130F1C16C87FD0A6DB6A81AE6F37985C361770FDE0FD556EEC19E857343A190D2E9B4AB58D2D6034059ED64CABE8B2A20009CC4792A95AA00F500C74C26E300257B2BC038EF90242BD54FF48CD96CB662AF97CBE5DC3900735C5BAB4D03B907EBB017B317DEDBF7E213C7BE7DFBB46DDB36BDFBEEBB5ABF7EBDDADBDBAFC8A6D8F61A84BE110A859C8E8F4C9735AD413F0870A4AF209A3F3252D594174094A56CDA1E8D641BB937AE6356BF1808042E308D91E426392827D2543B0D32AD00DCEAEB559BEDF00C2C88D621CD52682C70B4345A9B199DAB110804D4DDDDAD13274EE8E9A79FD6EDB7DFAE603078D96AD9B58CE5CB97ABB5B5D5598713232323DAB56B9772B99CD6AF5FAFAEAEAE0BCE6D6E6E56474787D3E4CE9B37EFA2BD12A5F32071DFBE7D8AC5629A3F7FFE05E63D894442A74E9D522A95526F6FAF334B982E70051E1919514B4B8BA3B47AE185175E5CABB0C94FAA4C00334B4F9C9898502C1673095FA8A7484D588B239188D2E9B433B6C101D41AB749E75D42A91A0222009EB6E502E08B841FDAC87C3E5F41752C140A925431965028A4A1A121B786F2FB68345AE1CE29A9E21E249FA996C1FCB134528C572CC0B4B44BC0B4D50E522D25896CEF4DE2921E90EC43AA0122954900B835EFC1F48C3D1B4EAB5478B947753F49F66BBC43AA7C682ED95B0140ADA703B45DABDF0424B37FA3928BA18F350BF462F6C2A39B7AF18922994CEA17BFF88576EEDCA9868606757777BB2ADCE502CA25343D264C325B680F038180CBA2D9F614D2540FA36C36EB68A1802B8023144DC01AD7B2DA47325E5430C7C7C7DDD8A084729C3597E19AB60A697FE61C7B5D4B6F91E49E97099B9FF95DF51801CB88D8A96C5A1DC55C8EDADA5A2D5CB8509B366DD2E4E4A49E79E6191D38706056816D381CD682050BB478F1E28A45F8D8B163FAE77FFE67F5F6F6EACE3BEFD4D2A54B2F38B7A9A9491D1D1D92CEF742BC94C368A150D0C0C080CE9C39A3050B164C4BC91E1C1C74B4D675EBD629168B5DF47AA55249A3A3A32A140AEAE8E89855A0ED85175E7CFE83A4248954FE3F00CAEADF70BE2458BB2C5B033042237A92BED57D8ED133623C033D110A24F796A640A105344852D863305EC64212977BDBF652E8EA4802038E2DB5569233C6A15A563D2692DFFC6C3D144850DB86F598C0B03FB21A489EC39ACEB0AFE05D0110398EE701986198634D79A8D0F2D9DAA435096A3B3E7EA6EA6741BD34B5FFE15AD5C7D97D927D5EDEB335C6E13E5ECC5E7895442FAE38262727B56BD72EBDF4D24B3A7BF6AC7A7B7BD5D4D474C5E767B359276C97E45A5BB0283051D9D611E8F1687921A9A2DF2093328B16B40A263526272B3A87A66905D94CCA9642CA02602B8E502A6C66D5FECF1ACBD8561C9C632762496EB286D2214DB9B45AAD22EFDF3A9FB1B85C0F4031128968E5CA95BAFDF6DBB56BD72EAD5CB9528B172FD692254BAEE8FC72B9AC5C2EA7A1A12165B3591D3B76CCE91B8E1E3DAA03070EB845381E8F2B1A8D7E22D17BB95CD6891327B47BF76E0D0E0EEA1BDFF8866EBEF9E66941583018546B6BAB42A190FAFAFAB461C3868B56FF32998C0E1D3AA46C36ABAEAE2E7576765E704C7F7FBF8E1E3DAA868606AD59B3E692203197CBE9E4C993AAABAB534747C725AB8E5E78E185179F36D0C549AA305CCBE572158E982468D3E9B40304B6771E15AB9A9A1AE57239E71300A8B0EEA7CCDDB95CCE258AAD095C3A9DAE3093E1DE5049A9C8F17B92ABD044A14B6266631DC6F97D2E9773EB08F7E61E921C68E23948085BC31BAE0B23CAD268A1CE9224B67B14AA7556FEC2BB0130B217E05C9E837F03305AE755F60D5436B91FF7AEBE87BD37D5620BEAACD98E059ED57ACFEAF76035936847B907C77855C4B9111E48F4E28A026EFDA38F3EAAC3870F6BC18205D352F12E15D96CD665FBC6C7C75D735B9B2904384A531417DBE747AAA49322781E1B1B73DC76001ED406A8807681A3FD86243739720C13DBC4C44485E68CEBB2F8589D23D7A836A1B16638E572D9654F2D402563C762C45898287102B3ED2F98A46DF673AE83C5783CAEDFFAADDFD2471F7DA4575F7D559D9D9DFACE77BE7345BD13C7C6C6F4F1C71FEB57BFFA958E1E3DAABD7BF74A92DADADAB473E74E954A25F5F4F4A8B9B9599B366D526F6F6F45F6FA52313939A9919111BDF4D24B7AF7DD77F5AD6F7D4B0F3DF4504556DB466D6DADA2D1A8162F5EAC7DFBF6E98E3BEE98B69FA274FE3BDFD7D7A74020A055AB564D0B12CF9C39A313274E281E8F6BC58A15CE6975BA482693DABF7FBF9A9B9BD5D6D676499AAB175E78E1C5A70992BAE80D239188C6C7C795CBE5DCFA07BD9286F3B6CD417D7DBD2291888687872BF48CD254CB06D6BF5028A44422E112BD18B404020147AFB4FA39F606D27966C8E8E868857C43926B448FB90CC7918866EF61FB245A0AA7EDF7170A852A9ADD4B53A63C6826018176CFC2BA4CC37A498E6E6ADF03E00D104A821CCD643E9FAF0056544FD133D6D6D62A140AB9FE8924C9193BC97512EA562F48DF496B1A64CD7AACF4A73A79CE7781F7C1F3F12EAD26D1F66124F990CD66DDEF911AF9FD7E47599E2BBD95BFA8E181442FAE28464646F4C4134FE8EDB7DF567373B3BABABAAE88625A1D8140C0996DE0D00510436F656D920381808AC5A2C2E1B0034B7EBF5FE170F802A3192614266580239312C0918AA3A58B329901082CCD15A0274DF559E49EFC1B1944161A2646AB8984A6C3C2619D5401A06837AA812313BE05A26452018F73BDB17A7D7DBD9A9A9AF41BBFF11BDABE7DBB5E7CF1456DD9B245BDBDBD973DB7AEAE4EB1584CBDBDBDEAEEEED67DF7DDE73E0732B900E9D6D6D62BAE224E4E4E2A97CBE96FFEE66F343E3EAEEF7FFFFBDAB0618382C1A0D2E9B4EAEBEBA7059BEDEDEDBAF5D65BB563C70E67CA305DC46231DD74D34D2A97CBBAF3CE3BD5DADA7AC1310303033A77EE9C7A7B7B2B9217D3C5F0F0B0F6ECD9A35B6FBDF582D61C5E78E185173319388B27934985C361E750EEF3F9140C06954AA5140E873531315101DE00177EBF5FC3C3C315A00C768F2447E1F4FBFD0E60DADE8BD168D4FD7E7272D2B1916826CFFDAA0D6FA4F349C94422E128A61C679D4F6B6B6B158FC7D5DFDFEF983F442C16ABE8B10810A44A6AB595B64D06155300A6741EACA652A90A8316F49B16D4B117E09D020473B95C05E02A140AEEF300BC6152C35848684722910A131828AE18E658E0682BBF7C86D058D9BFD80A324638546ED9A3A01305C4921CA740C05E093757CBDE0228DBEF8C17B3171E48F4E2B291C964F4C1071FE891471E91DFEFD782050B148D46AFEA5A7603CC86D85259C82201A4A8EC5911B82447E9B0EE9FD0346D555092A35C48AAC850DA6CA1D51B708DE9FA23A1990498595756AA822C0C16B05AA399EAEBF1EF5408ADDE10CD007A104B8BB1E7CE65E31A1BB5B5B5DAB469934E9C38A1E3C78FEBA73FFDA9FEDB7FFB6FEE3D5F2CEAEAEAD4D2D252414FAE0EDE3559EDCB45B95CD6F0F0B01E7FFC71CD9F3F5F37DC708356AC58A15028A4898909EDD8B143EDEDEDFAF297BF7CC1B9F3E6CDD33DF7DCA3A79E7A4AFDFDFDCECDAE3A6801B268D122B5B7B75F005ECF9D3BA73367CEA8A6A646EBD6ADBBA401D4F8F8B806070775E8D021FDC99FFCC915F552F4C20B2FBCB89A80F68E699CED0D88210DC62B80BA4020A07C3EEF180E803A0CE958C3FC7EBFAB5E91A8638D842689990DF446D67B401309622A93B45C60FD4EA7D3CE980C3A2689644BFFB4E63B5265AF47CB7C2A97CB8A44222E390990E21EB61266C782D18C95ABA0DF04FC59A777AAB524B6B937FB13F62AD651D59AC500E03807331B4BED0C87C3EEBA56C6C33DB82EFB19AAB8004A0BEA30EFC1A806761800D3B6E928954A150EB7F6B9D90FB13FE319E63A43EAF31E1E48F4E292313939A943870EE9E9A79F565F5F9F6EBAE926B5B5B55DB52D71A954728D76C93259E003D0B355CA40205001B8583070EE2233C7A464357F388A5AE088F681EA20933B9322608E898EF3AC2E910585AC996D97C03899205998AC489BEB49AAA0A5F0ECF69D001EB9165948169C4FA2BD9B0BD1DCDCACCD9B372B9D4E6BE7CE9D7AF9E59775EBADB75E32F1408691CFE3D3062635CF3FFFBC0E1D3AA4F5EBD76B606040A9544A1313134A24123A7CF8F04529ABA150482B57AED4DAB56B75F8F0611D397244EBD7AFBFE0B8FAFA7AC5E3F18B6A07FBFAFAD4DFDFAF5028A4F5EBD75F12DCF6F5F5E9E8D1A35AB06081D6AF5F7FD5891A2FBCF0C28B8B454D4D8DA3BC93A484A9C2DA69FBFBD2F89C35930D3E4007F60E4085E32CF8B3C79124B6C003406129A680375A2E58BD3EF448DB6BCFEE112C60B23F13ACB1D678857B706F92D7006292D83081EC58D84BD8B5BF5AFB87FBA735E561EC96C2CBB1F48166EF80AE93E0F7547EAD7ED3526A190BE702CC007BBC1B9B88B6BA430B24ED3E8631D97BD8361B969E8BB4C61A0259CDA517B317DEDBF7E292313030A09D3B776AFBF6ED5AB26489162E5C386DC5E44AC366B5C82642C1843B6FB9EFD28540CFBA6FA11760B2B56E6676D2B5C011131C2B54B7932880CC8AAC6DB68DC994098C6B33313276B26DD668C65648AB81A334A543B415470B1E2D7D95E796A680E9F5123D3D3D3A77EE9CB66FDFAE9FFCE427EAECECD4EAD5ABAFA895CA4CC4A953A7F4E28B2FEAD1471FD5C2850B9548242A7426434343FAF297BF7C5120565757A7A6A6263DFCF0C37AF9E597F5DE7BEFA9A7A7E7136B048F1C39A2818101C5E371F5F6F65E14248E8D8D69CF9E3D3A7CF8B01E7CF041CD9F3FFF337B575E78E1C5172370DCA692264DB9915A2008E829168BEEF7001A5A4F48530DD15997F97962E27C93FAE95A2070BF52A954D19A8A35DAB69820690BDD118A27E0863EC28CC5EAE96C65D43253EC7EC28EA9BEBE5ED96CB6629DA0C2667B055AD31C8012BF670FC07358600578A44ACAEF49422327E1FA8C8B31DBD61A4861D8C3D8A4381A44EB71C05E867BB07F990E085A8028A9A29AC9BE846AADDDB7F1995B99885469CA53EDA86AF76D5ECC4E7820D18B8BC6F8F8B876EEDCA95FFCE217CAE572BAF5D65B150A853E95EB141387B5928673CE8406E79D8C642010A8C86849534D796DA60F2A29931E13328B87058E54E0ACCB280B91756BABA690E29EC624562D78B71542EBD0C57858806C1616E0C7C4CBA2C9795CCFBAB452C1B496D2563B39D723140A69F5EAD51A1818D0134F3CA17BEFBD57ADADAD17358099E9D8BB77AF5E7EF965E572397DF4D147D31EF3C0030F5CB2C5442010D0D7BEF635EDD8B143870F1FD6C99327B56AD5AA4F348E23478E687878582B57AE545757D745B3A667CF9ED5BE7DFB94C964F4F0C30F7B86355E78E1C58C06C9490C64008CD2F975BAB9B9D9312D4870A2CBA3BD153DEED0D6D7D7D72B9148A8AEAEAEC23C05CA28EB31E028168B299BCD5668FC8BC5A2EB5948521930C23E21954AB9E6F554F4A0C8DAE332998C4B4403040134D604CE8223347AA954CAADC1249E7957D047715E658FC1718140C0B9BE62D0C73EC83A9CD2BCDE823AB49F76CDB73D080173DCC36AFFA0BE5AD75768B7006A3E03A8C1D6A5341C0E3B206FEF6D3F4B28C02406A8345B7A2DC975402863A43D8AED79C99E0D9AB0A7499CDDF040A217178D13274EE8F9E79FD7810307B46AD52AC5E3F119C9EAF87C3ED75B9149C18AB2F9B950283810550D1C83C1E0658D66182B8B061950329BD69D9409D366BE008E1C63B580D5953CF41688BBA16F545730A1CC54534E99D05940D03858E06A010400D40247DED3F512F3E7CFD7CD37DFACDDBB77EBA73FFDA93A3A3AD4D1D1F199D067BFF295AFE8965B6EB9E402140E872F09C6D0C1FEE0073FD0CB2FBFAC6DDBB6A9BBBBFB138DFFF8F1E392A4E5CB975F9256B36DDB368542217DFFFBDFFF44C63C5E78E18517571218C860C40210C0C1737474D4E9E371DD6C6E6E56269371A00E90168FC7353E3EEEC04D6B6BABD2E9B40337F410E6B842A1A05028E4FA1FB3D667B359C56231E5F3F90A5097C964148BC5343E3EAE4C26E3C017F3397369A95472C7B18780FA8A763D994C56247BA9AAE57239B5B4B468626242D96CD699E4D8BD432291704099E36C7299A6F6682B2D700C854215C0112007D0A63A974EA7DD3EC09AFA00BAEC71EC37D8CB0483416532990ABDE7E4E4A433B3E15901828C110A2F40DE823ACE25718F618E95E460BE635B79586A703570C4B5952A298501EB43E1C5EC840712BDB820A0483CFAE8A3FAE0830FD4DADA7AD56EA6170B264BC08ED5E101205950F89FD51A58B065B37ED5DC7B2663805D356513F1B7A40B2A8E64222DD5B31AF8715DAB93A0A209A5948C2000976B49725954AEC7735BED21D41BAB69E0BA16705E6FB48CFAFA7A757474E8E1871FD63FFEE33FEAC5175F544747876EBAE9A66B7EEF40203023D5B89A9A1A757777AB542A69FFFEFDFA877FF8073DF4D043574CC9DEB46993BABBBB75CB2DB74CFBEFF97C5EDBB76F575D5D9DB66CD9A275EBD67900D10B2FBC98D100F891EC8CC7E3CEADD2E7F33983158C660001994CA642D307282B954A8E8A1A0E879D898CAD52C5E371E7A8595F5FEF400173276001890A744A9C3DA90692D8854564299F18CD701CC962B4E6503EAD410AFB1FA42A506DA9FAC162025859300D982B168B6EBDA652689D3D01A1ACDFD6D913E0C73B907481AEB3FA38F61BD081A94C023C2DCB28140A39F0C69ECA5607A5A9161D24EF25B9EA30001F705A28142A28C3B0BFF83D94565C66B99F95E4D88A354682D6F0C68BD90BEFED7B7141A4D369BDF1C61B7AF9E597353939A9A54B97BAB61533116363632EFB180E871DC80194011C6D6B0374890028B265541AC94831F95703A96ABDA035AFE1FE4C6436DB6739FD92DC355970AAC709E0B39A0232682C1296363B5D6B0BDB3E439A725B05384A53345D5B45BCDE40A274BEBABA71E346EDDBB74FFBF6EDD3B66DDBB470E1422D5CB870B68776C581898DCFE7D3A143871CADF84A3E8FBBEEBA4B353535EAE8E898F6DFF94EAE59B346CB972FF7CC6ABCB8E2387BF6ACCE9D3BA7C6C6462D5DBAF4BADD6C1D397244232323AEF7A9575998B9B0EB9775DDB4EE9A2453595BD9F8B3FEC2664173465B059C2FADBE509A021B00303E4FF48CD254BF3D49EE5CC64212D7BA87023631BE63DDC7299CE3AC090C5535E891D349352CE0022C722E80869F6DB5CFEA11015AD6DC85DF5B9775DBBE83F70455D68255DE29EB0B0097776F9DD7A9D6F159DA6765EF612538762F849692B0DF05CBF802E4D97D487511C05629AB4D7DF85E58D772F6499676EBC5ECC4F5B96A7871CDA2582CEAD8B163FAABBFFA2B0D0F0F6BF9F2E517DDC05E6D00129920AD98BB582CBA16042C32D5154204E84CF26CA4A1813009712F26594B25B554552A8E5CD73A88D9D6198C09E13B20D0EFF7BB85926B5A50CBF9567F69B504D30147FECBF5008956E3C81801A0D519C3EB21EAEACEF73FBCF3CE3BF5CC33CFE8F5D75F57575797BEF9CD6FBACFE37A88582CA6952B57AAA5A5A542D77AB958BD7AF525FFDDE7F369DDBA75EAE8E8708E835ECCED181B1B533A9D7659FCE9408D35C4686D6D75F4BD4C26E336D8D5412587DE75978AD1D1511D3C7850FDFDFDEAE9E9B9EC9C303E3EEE344568C9E64AF02C85424137DE78A3331EF3E2D3079479ABC3F7F97C4E7F274D99B5D1FF90B59A5E76188D48BA801E698F63BD0410A19FB3095CBFDFAF5C2EE7C02B063018A6002A6C8F4400A31D8BAD805AE7719E91EF3A00D3B27BB837EB3CEBF0D8D898335E01645171B3CF0B58A5B269CDC8AA5D4D59BBB9070EB2003FDE0F4633D62088DE863C137B09EB5E6AF739FCCDD836148C89F9C7BA8F02D2AAF76796566A93F0F6386B3E688DF76C55D57A2B58B31D802EF7600FE6C5ECC4DC5909BC9813313838A8D75E7B4DFFF22FFFA2CD9B376BFEFCF915B6CA331100B668345A4151181F1F57369BAD9898A06E62986305D7D6C514D06533656363638E2B6FE91C64136D25509AA2DC301EAE6D3363D61C8749D91ACE54534B99ECAAEDA1B91EE26F00A3BD2EE74A534E601638027A5914F9777A2C5E4FB176ED5AF5F7F7EB95575ED14F7EF2136DD9B245CB962DBBAE0C5A82C1A0162F5E3CA3D7F4F97C5AB162C58C5ED38B6B1BE9745AEFBFFFBE8E1F3F5E416DB7C1A6B8B9B959F7DD779F02818006070775E0C001F5F5F55580203658636363EAE9E9D1CA952B2F59791E1B1BD3BBEFBEAB8F3EFA481D1D1DBAF1C61B2F3BE66C36ABE3C78FABBEBE5E4B962C9951E6C8A78D75EBD6697C7C5C3FFFF9CF5DD5DE4B987CFA00D8009A1A1A1A545F5FAFD1D151B73E92C08C44221A1E1E76C9508011CDE4590369386FA99668E3ACAE2F954AB9FF4F52371C0E6B7474B4C21D5C3ADF881E9DA475E044B796CFE7555F5FEF8EB33A3B490E744177AC06B1B4B1B0347EFE660381805BA36DC379D66612D51C47D513AA258CA57C3EEF4C60005698C840C124C92D4D3981D6D5D5B9F1D29392E3D8E7705C2E9773EF04100BE8A6520805D80270CE9DCE088764BEA40A40CAFB81869BC9642EE86789B32CFB1480AEAD0E02F8AD0CC8D2553D4DE2EC870712BD70313131A177DE79473FFDE94FD5DEDEAE152B565CB4BFDBA70D263DE9C28A99D50532B1017E1076974A2597512733150E87DD0261C35676008ED214458489150A0C931A55426B8E535353E334934C68005C3403388AD9C6C3567B692BA22C4C96B7CF42C0025A2E97DDD8AA81232097315ABBEAEB2D6EBAE926E5F379BDF0C20BFA2FFFE5BFE87FFC8FFFA1152B56788B8417D755A4D369EDDDBB573B76EC502E97D3E9D3A775FAF469F7EF3E9F4F0B162C5057579756AE5CA9BBEEBA4B814040434343DAB56B975E7AE9259D3C7952F97C5E3E9F4F4D4D4D6A6B6B532010D0030F3CA079F3E65D14248E8D8D69EFDEBD7AFAE9A7B57EFD7ADD7FFFFD5734E66432A9F7DF7F5FAB57AF9E734C04BFDFAFEEEE6E7DE52B5FD10F7FF843FDE11FFEA16EBEF9664F9BFB29C3EFF72B1289289148281C0EAB5C2EBBEA5E6363A372B99CAB200E0F0F57548CEAEAEA148FC7353232E2C005C94E4CD7382E1A8D2A9148B8643395C24824E28023E0D4268125291E8F2B9148B8759DE42A86390026EE01C02451DAD4D4E4D67B9FCFA76C36EB40086B6D2412D1C0C080BB27ACA1783C5E61AAC23A6F757298FA60F0023BAA5C2E2B128938F007E8A1120A880D87C3151A3FC0146CAA4C26E3C038AEB1EC25C6C7C79DA32B5A49D67EEE0140644C38ADF2D95ACD242EAF7C1E18DE50DDE3F948BA5365CD643217682BB987D55652B5B6C091EF82AD46E394CA3D66BA48E1C5270B0F247AE1E2C081037AEDB5D7D4DFDFAF0D1B362812895C335A0F8B08B40626613298B6893D593F5B3564326431B0BCFA6A4751ABD7E3BF2C6C92A605A208C56DC591315A1A45356FDE525AA17C000CD126586753B4931624570365CEE559A96856F780B455D1EB31C2E1B0D6AD5BA76432A9175F7C514F3DF5941E7AE821757777CFF6D0BCF0E28AA3ADAD4D0F3EF8A06EBAE9268D8F8FEBD5575FD5934F3EA9BD7BF74A3A3FA76DD8B0410F3EF8A0B66CD9E292655D5D5DFA9DDFF91D6DD9B2457FFEE77FAE0F3EF840B7DF7EBB1E7AE821353737ABAEAE4EF3E6CD537B7BFBB4F79D9C9C542A95D25FFEE55F6AE1C285DAB871A3BBF6A5A2582C6A707050FBF7EFD79E3D7BB474E952C5E371F97C3EB5B4B4E8AEBBEE72F3F16C444D4D8D62B198D6AE5DABD6D656BDFBEEBB6A6A6A526F6FEFAC8DE97A8F6030A88686066532195705A302140A8594CFE75D35904A0FBA7FAA8FC964D2AD3BB68F1E552A9C3DA9465910110E8795CBE5DC7A457590E4AAA5A45A3D1BCE9C994CC655ED706465FDA332198D461D28B43A405A7648722633968DC3BDB3D9AC4BF062CA23C9ADE1E83731F5E159CAE5B26BD961D94D542C2539EA6AB5090CDA4FFB79405DADA680721CEF9431F2B76AFB3CDB7D16663D561F088D166A2CA0CEBA925A2049C513C06765335448ED3EA81A204A723452BC28D8A7F179586AAD17B3171E48F442D2F93FF65FFDEA57DABD7BB7229188162D5A744D9B7597CB65D7738985A15C2E3BD1BC358B01A859DD80D5CD50C1C3E10C806581141319D7B3608E49D21E0328B37418401F60D466C000B2D214C79F0593E7B53D1101872CAC8C8367AA068ED60C87B0AEAA2C72D77383F5DADA5ACD9F3F5F9B376FD6A14387B46DDB36B5B5B5291A8D6ADEBC79B33D3C2FBCB8A20806835ABE7CB9962F5F2EE97C35A45028A8AFAFCFCD790303031A1C1CD4C2850BDD1C016BE3F4E9D34A2693BAF5D65BF5F0C30FEBBEFBEEBB2290964C26F5DE7BEFA9AFAF4FF7DF7FFF1525570E1F3EAC5DBB76E9C081036E9E3C7DFAB4FAFBFB150E87E78CC6D9E7F3A9BDBD5DBFF99BBFA9175E7841B1584C2B56ACF0AA0C5711C160D069FC2455D047AD3BA6355EA9EE556CDB4800100192E8E2380E8D5EB5098C4DF8B20FA836350158B1DE02B8EC3A0F00635D666D678CD5AE9BD5EE9A00B66ABA294EAB0015CE074C0248610CB1B6436FB509626B9863593E9CCB58483EDB561EFCCC3BB5AEE6165C59A3192A7FBC1FCEE5DE8C893D07C966CE05A45155E573B30EB5F6389BACE6F776EFC4BBE2DD31A7700F3E73F634542CB9BF17B3179EFADB0B49E71DE45E7BED359D3973465D5D5DD7DC1C606262C2D9623331148B45A73128168B2A168BCE669A2C1E932E2091CA9BCD4EA10DB0D763C160316442E61A2C9C8D8D8DAE479335CB6121C44EBB542AB9FF6F692000436833FC6C012E0B08CF4CD690CCA3AD8E4AAAB81ED94016167B5D26D48B99655C0FD1D8D8A8254B96E8C1071FD4F0F0B0B66FDFAEB7DE7ACB59767BE1C5F5162B57AED4D6AD5B75C71D77B88DE2C18307F5ECB3CFEAF5D75F77559462B1A843870EE9F1C71F572693D1FDF7DFAF9B6FBEF98AAB78FDFDFDDABE7DBB962C597259A9C0F8F8B84E9C38A1679E79464F3CF1840E1F3EAC4D9B36E9BEFBEED3E6CD9B75C30D3768F5EAD5EAEEEE9E3326360D0D0DBAEBAEBB94CD66B57FFF7E9D3A756AB687745D05C950400C15210B10018CB6C1BC752F052870AE051B1628551F576DD002951AD002E0B35E04801EEB0D505353E32A90D6BDD4CA42582FB9876502A169B4C9606B4E234D394AB3765371B3C967AE4955CE269CA18C5A6909E3056C02A02D8B8AF78BE781AD6032468284387B18EBAFC0FE81B15ACF04401EE0CDD2472D90E3BDAF9900A80000200049444154D9AA2EEFABDA21D58EC9562D490258E31F7ECFF15CCBEEB3AABD163C93AAD98DB931FB7B316BC11FE633CF3CA383070F2A1E8FABABABEB33BB6F381CAEC800DA0CE2D8D898B35BB6C27A9B11ACAFAF77C0CE3A8032C15880C982C6C40BE822FBC7189894C822DA899005C266E4E0D5DBC5D466E2A81A02162D8D9485C90AB46D4F442A92568B7031B31D5BC1E4FD5E8F110A8574F3CD37EBE4C9937AE38D37F4E4934F6AC58A15BAE1861BAE5BF0EBC51737EAEBEBD5DBDBAB3FF8833FD0C1830775E2C409954A25EDDBB74F7FF6677FA69E9E1E2D5AB448A74F9FD62F7FF94B6DDBB64DFFF13FFE47DD7EFBED6A6B6BBBA27B94CB65F5F5F5E917BFF885FEF37FFECF973C6F727252E9745A3FFFF9CFF5377FF337EAEAEAD2EFFEEEEFEAB77EEBB766EA91AF49D4D6D6AAA9A9495D5D5D3A75EA94DE7AEB2D57ADF5E2D2C13A168BC55C351BDA24BA3A12AAD002A9EED5D7D72B954A291289B8A42609D56432E992B6757575AEC97D2E9773400B2D20344FDC4E2539B60FF455AA89549342A190128984AB26E2AE4965933D402010502A95728DDA71EA844E0AC84AA5520E505AFD5C5F5F5F05AD118F0392B70D0D0D0A0683CEF5957D050966802B3455D6614057201070CDEE59FF2539BA2AA09044B1754AC5E32097CB499A0288925C158FF788519FD52D629863CDF82C6B0BDAAEAD0CD6D5D5B9E7606F04680784529DA4F518E09667448B49B5D5024DF6437C1718137B25F6507C865ECC5E7810FD0B1E6363633A7DFAB49E7BEE39E5F3792D5CB8F033FDA364F2F6FBFD0A85426A6868502C1653381C56281452381C76E067727252C56251E9745A854241C96452D96CB6823A82514C6363A3C2E1B01A1A1A148944140804DCBF3179B2602180E7BF8053491599B8FAFA7A058341F9FD7ED78CDDEFF7BB85140179269351369B55B158542E9773226C6B38C37373BDC6C646477901EC32B9964A25E572398D8D8DA9582CBA86C72C6AD6D9D4EA19AFF7F8CDDFFC4DAD59B346EFBDF79EFED7FFFA5FAEB7A6175E5C6F110E87B561C3067DFFFBDFD792254B2449A9544ABFFEF5AFF5D39FFE541F7DF491B66DDBA67FF9977FD16DB7DDA66F7FFBDB9FA857E8993367B46FDF3E8D8C8CE8C61B6F547373F3458F2D140A3A7AF4A8FEFAAFFF5AA9544AB7DD769BEEB9E79E4FFD8C9F556CD8B041C562516FBCF1C66C0FE5BA099FCFA76834AA643259616C522814D4DCDCAC7C3EEFAA62D2F944253D59B3D9AC338B43A71F0804944C26353131A1582CE62A77680DA157363434289BCD2A1A8D3A7690CFE793DFEF57A1505028149274DEECC9F61CE41E18DED8F65196CED9D0D0A0C6C646A552A90A87D1FAFA7A3716AE8B490E462E98A28C8E8E5630720046C964D219DA35343428954A55246031E5C1E0453AFFB7650126A02793C9B86AAB747ECD0E87C3CA6432AE3A0710B340926B6532193736C01CF7E07C1C5591E7E0E68A66D2EA192391886342594A6B201070896F0C73603D5169843E4C7570BAB62000444036009AE37957B692C9F3D9EF00956D2F662FBC4AE2173CCE9D3BA7471E79C4E9633A3A3A3ED36A0D1315E086C91B9E3D934828147213A9ED9B64019F6DF86B335296364A060B87D26AA39B898909B718323E0BBAC8DCD945A5BA7506F7407B61AF6BF50192DC18A7D34CF2B3D5319261C3358D8AA37DDEB9420FFBB4118D4675C71D7768626242BB77EFD69FFEE99FEA3FFC87FFA0458B167915C5EB28D2E9B48E1F3FAEBEBEBE0AFA1054B18D1B376AC18205AAABAB532A95D21B6FBC519154999C9C546B6BAB56AD5A75CDDC96AF75D4D69E6FF9F38D6F7C43870F1F563A9DD6C0C08092C9A41E7BEC311D3D7A542323236A6F6FD77FFA4FFF49F3E6CDFB447FC767CE9C715281B6B6B64B26FA868686F4FAEBAF6B6868489B376F566F6FEF356D29313939A913274EA8AFAF4F8D8D8D5ABF7EBDA3D0160A050D0E0EEAF0E1C32A97CBEAECECBC6C0B8E9E9E1E8542217DFCF1C71A1E1E565353934749BB44901C2D140ACE115392D3DC65B359B72E51018AC5622E1949D2124771490EB4343535B9E358EFC6C6C6DCF789358AE42B6B370011190874D742A1E0CC5D6899603581001DDA62E1CE69DD47B9070E9ED6400E9751C01AA0CEEAFD59ABA9A4729CD53A52E1A2DA26A9A2EA07DD94F73C3939E98C66B81FD53D2A698C11FDA6750095A6E89C00472418EC0B6C7590E30191543F017838ADB2F7E17B0120641CF6389E916AAF4DCE5BCD2515474C752C38B5ED48D8DFB1D7B263A102E92585673F3E1FBB492FAE2AD2E9B40E1C38A0A79F7E5AA15048F3E6CDBB2237BC990CB2704C94F97C5E9148C44D40803226716BE00298B25537FE0BB0AA068E54FCAA8123D94326622663B40276124723C02200ADD49AD530E155033D2647EB2C66C5F592DCE6900592F37956FEBF754DE5DAF6D9AFF7A8ADADD5D2A54BB565CB16E572393DFDF4D3EAECECD4D7BEF6352D5BB66CB687E7C515463E9FD7B163C7B46BD72E9D3D7B56C964D26DCE5A5B5BD5DADAAA79F3E6A9A6A646C96452DBB76F7780321A8DAABDBD5DAB57AFD6C2850BAF5B90289DFFBB5EB66C99BEFEF5AF6B6868482FBCF0828AC5A28E1D3BA66432A90D1B36E8BEFBEED3A64D9B3EB101D5E0E0A0868787D5D5D5E5E6C58B45A150507F7FBFC6C7C7357FFE7CB5B4B45CD3A4CBFBEFBFAFFEFE7E8D8E8EEAF4E9D33A7AF4A86EBFFD768D8D8DE9F8F1E3AEF2934AA5B47FFF7E0502017DED6B5F534747C7B48C88CECE4E45A3511D3A7448A74E9D52341AF540E245C26ADE2CC8B31B7C7A00F233C0CA0215AA4CD2F9C429CE9EAC39AC45004F69CABD9273D0D1033A6C4F3D92BE7CEF2DB8B17DFF00A2801EC0A3CFE7AB308181E6697575DCC356ABA0695A7753D67C2A5EB61F219537C00C5A45DB1AC31A02715DE8B2FC9E4A28F7063C02A2ECBE86CAAF7545B79AC06A77778E63ECD6DC89BD814DC6731D6B8447C299E3886A5754C6C83DACC94CF53DAC2743F573D8FD98D5364A9A760EF0E2B30B0F247E81A3AFAF4FAFBCF28AFAFAFA74D75D77A9A9A9E933AFD0E4F37947716052221BC9586CD610CA869DACA54A87520BC86CBF418EB10B1EC0918CDE74C091C5D35E17A0C682077044E728A9426CCFB3D8F6192C46D6A18C6B5B604C0695F36D051320590D0A0191D7BB33586363A356AE5CA9C9C949F5F5F5E9A9A79E52381C563018F41C4FAF93400BD5DEDEAED1D1511D3D7A54FBF7EF576D6DAD7A7B7B954EA7254D6D60FAFAFAF4CE3BEFB8760FADADAD6A6A6ABA621A7CB95CD6E0E0A0868686662459525B5BABF6F676B5B5B5CDC8FC78C71D77E8D4A9533A79F2A4DE7BEF3D4D4E4E6A686848C160502B56ACB8AA76132323231A1D1DD5FAF5EB2FBBA90A0402EAECEC74951B2CE7ABB5469FF65901267BF6EC516363A39A9B9BB57BF76E6DDBB64DB95C4E6D6D6D4AA5526A6B6BD3CA952B353A3AAA5FFDEA57DABB77AF5A5B5BF5D5AF7E75DAA465341A751ABAE3C78FABA7A7C7D32D4D13D68CC64A316CF372AA6A563FE7F3F95CBF44D61DD65DE891D055390ED047850D9D7E75E5CD022BDB9FCF820D2A6C7CA65420EDDA67EFC1FA6D419AAD660110018C54EAAC418B0589ACC5004FEEC7BDAB5D4DEDBD6B6A6A1CE806E45049C348873D0480D6DE832A693548638C96D66AC11F89E97C3E5FA1FDB3AD35F84EF07900C6389FCA24F7237963F711B6BD057B2FEE8D7BBBDD17D9A43B5543EBA960F771D6D0A6582CBAF3BD98DDF040E217348AC5A2F6ECD9A3679E79460B172E546767E7675E4594E4B26CD08BA0695A10C5C4C70443F613631926F470385C613463335364ACC6C6C6DC22596DDBCDE6CCBA81592AA9A57272BE34454F61B1B0BA816A6A29E636FCCCB56D751170CBF8F8774B0F91A6ECB16DC5D13AA95AD39EEB3942A19056AD5AA56F7FFBDB7AF4D147F58FFFF88F0A0402FA37FFE6DFCC6AFF362FAE2C9A9B9B75F7DD77EBEEBBEFD6E0E0A07EFCE31F6B6868488383834AA7D3AEE7199BC2582CA61B6EB8410F3FFCB0BEF39DEF7CE2CFB85028E8D7BFFEB55E7DF555B701FB34D1D8D8A8AF7CE52BBAF7DE7B6764D3120E87F51BBFF11B1A1C1CD4DEBD7BDD06ECE0C1837AFDF5D775DB6DB7393DCE95C4E4E4A4868787353A3AAA79F3E65D768C6D6D6DBAE79E7BF4E8A38FEAC489133A74E89056AE5CE934BFE170584D4D4DAE05C6D546B95CD6C0C080262727D5D9D9A9C58B17EB9D77DED19E3D7B2449DFFDEE77B575EB5697EC59BC78B156AD5AE580E43DF7DC33ED9A44D2C1EFF7EBF8F1E35E1FB5690250C7DA07DD796868E80257D26834AA542A75817ECE36610F87C34A2412156636E974BA82ED239DFF6E8F8E8EBA755C3AFFFD8C4422AEE721E0CB52304BA5926BC04E75AFAEAECEDD03FAE1F8F8B882C1A0EB8B08D02A140AAE2F62B5F10BBA3A8095AD0CD6D7D72B994C56484A00315065D903D0E49EB519E0CAEFB907F318F7C004C6523EEBEAEA9CD90E7B204C6FD056B2DFC090864A213D9D31E501F0A1B9B4953B0C7318139F532010503E9F77CF8A9ED15672D91BE1A2CA3B607F04B06E6C6C747B2AE60B3E5BAECBF7903D15CEB7BC0798258058BE8B56AFE8C5EC840712BFA0F1FEFBEF6BE7CE9D1A1E1ED6DD77DF3D2B0091B09B212A7CD54E9E36DB0428C3BE1B8E7E75BF1E494E7B688123131099ABF1F171E70A56AD0BA0CA09F82423CBCF2C2EDC473A4FAD61D2A3FA09E7DF5A4303EE008E4CD22C563CAF6D9761337B50586C86D502479B41BCDE23180C6AFDFAF57AF0C107F5F2CB2FEBEFFFFEEFD5DCDCACFBEFBF7FB687E6C52788D6D6563DF4D0431A1B1BD37FFFEFFF5D274F9ED45FFCC55FA8AEAE4EBDBDBDFAEBBFFE6BBDFFFEFBFAC33FFC433DF0C00357D507CFE7F369C182055AB76EDD8C81C4F9F3E7CF28A5B1A3A3433D3D3D8AC562CE00E4D8B1637AF1C517B561C306DD7FFFFD6E2EBC5C944A25251209E57239B5B7B75F769C7EBF5F4B972ED51FFFF11FEB7FFFEFFFAD1FFEF087FAD9CF7EA6C58B17CBE7F3696060405FFDEA57F59DEF7CE7920638978B62B1A81D3B76A8A3A343CB962D73DAD4F1F171DD71C71DBAF5D65BD5DADA5A71CEF8F8B832998C73E0BC58442211353636EAE4C993DE26B22A589BD01B52291C1A1A72952536E22D2D2D1A1919A968B78006980ABFCFE7739F07DF49AA4EF1785C994CC681C54422214915FD1363B198128944C5BA3B3E3EAEE6E666653219071CD1EC47A35195CB6577DD969616779CD5F285C3610736AC090CA0AE50285438ADDA560C914844E572D9E91649EA1254F1A0D40218D15F023073B99C42A15085090C663D8C2F97CB55DC9B7379A78C854A23C9625849004CEBFA1A08042A8027D53D401D554940B6058E7C2FD827D90AB224979C0E06830E784A7249059C4CF99EA19964EC805E5B4D96E428CA38E4028001ABB6A21B0C062BB4AE5ECC5E786FFF0B18C56251AFBCF28ADE79E71DCD9F3F5F6D6D6DB3FA87582A95DC22100E87DD04022863A348769D89872CA2BD8E6D95C1A246568CC912E0673387D214CDC20251A82580B9EA8A23748A6AEA2B408D45D1F2F759A0D132DA1E4FB6EA68AB83163812683AACBE04400A58FCBC04EFEBCB5FFEB2D2E9B43EF8E003FDE8473F522010D08D37DE784D8D37BC98B94067FAD5AF7E5567CF9ED53FFCC33F68CF9E3DFAF33FFF73757676EAF8F1E3FAF7FFFEDFEBF6DB6F577373F355511E7D3E9FBABBBBD5D1D13123746BAA303349C5DFBD7BB75E7CF145C5E371C5E3719D3D7B56B95C4E070F1ED45FFCC55F68F9F2E5EAEEEEBEA22A6AA1507049A9603078D971E6F3799D3871426FBFFDB6BEFEF5AFBBF7CC7C170A85B476EDDA4FFD37555B5BAB7038ACE5CB97ABADAD4DA74E9DD2871F7EA879F3E669C3860D5AB4685145D5339FCF6B6868C881DD4B5544D9745F0E4C7E1103568D75F664C31E08042A2A51B4B0B0EB5C3C1EAFA0805B8A286B18C701E4F8FEB086DB352E9BCD5EA0998B442215CE9ED27910128FC75D8F631C4AD91B5893946834EA12A0B86996CB6507623158C1599C6A1B8012FF826A631C498EC544CB0EEB23303636E612EA24AA31DFA1B288F98E3D17108CD19C05BA2481015D0052EE0195D7DEA31A5052F5B38C0C12E8D06E2D2595AA1DE7F36FEC1D38CE9AF9588068759DD294E32CDF25BE0BB69A8C8191BD07AD3C2CF51530CEBEE9F3B48FB91EC303895FC078EFBDF7F4F6DB6F2B93C968CD9A359FD82461A603072D340B64F7004050522C3D936C2100D2EAF99850D132A0BBB0E7B238B1A19ACE51D436F295A6343698DF58DD02995380233413EE69FF3FD702885A80873604AD8305B3B69ACA58AB79FB5654FE799C5C5B5A5A74D34D37A95C2EEBBDF7DED3FFFDBFFF57BFF77BBFA7CD9B377FAAAA87179F5D040201AD5EBD5ADFFEF6B775E6CC19BDF1C61BDABD7BB7162C58A08D1B37EA2B5FF98A733BBD9A80428785FF5C8B0F3FFC502FBEF8A24E9E3CA96F7FFBDBF2FBFD7AFCF1C7F5E1871F2A954A69F7EEDD7AECB1C7F4BDEF7D4FDDDDDD97AD0C52B1B1EC848B45A150D0471F7DA4175E78412B56ACD0ADB7DEAAF9F3E76B6C6CCCD10C79779F765DF0F97C5ABB76AD33A0191A1AD2C99327B566CD1A2D58B0E002F6CA99336734303020BFDFAF55AB565D5267688D52BC980A5A42901895A68C5782C1A06B4700AD0FD063D72E400F494CEB3E6A4D606CFB0574675C4B9A32688191C37A86E90B9A3E2A48D05B01461680B11E52A5E299EC3302102DB8A8BE07C08AF70050B16B65B53F80959000DEAC318E35E5A91E132C26802A7B13EB386A01A27D56EEC1EFD9FFD8F75B7D0FFEF639F7624638DCA37ADFC1FC61E532F6BBC175A529931A9E83313176FBF76B013EDF3F5B31B5DF0DEECDFCEF258166373C90F8058B898909BDF8E28B3A71E2849A9A9AD4D9D939DB43724009CA26931793B9DFEF573E9F771307594216130BA202814085DE90098B89D81ACD58E04896D31ACD0483C10AAAAA54596DE45A08C19970D15348531A007EA6BA284D6D74A4A98910CA0FE3B213B8AD4A72BDEA2AA4AD9872BFCF1B1D8B3E736363637AE595579C1BEE97BFFC65353535CDF2E8BCB8928846A3DAB871A31E7CF0411D3B764CFBF7EF573A9D562412F95C2637A4F37FE3A9544ACF3FFFBCF6EDDBA7152B56E8777FF777555757A7FEFE7E2512099D3E7D5AA9544A3FFBD9CFB462C50AC5E3F12B3268BAD2A4505F5F9F76EDDAA58F3FFE58DFFAD6B7D4D9D979CD5824F5F5F5EAEEEE9674BED5D2A953A7944AA5B466CD9A695D6A8F1E3DAAFEFE7EC5E371AD5FBFFEB26634CCD35E9C0FFAEDD6D4D4B806E75464485A52A502A4598D3C0001FD1B6B9C340504AC56CCEAE4A02B428F04605ADA246624353535AE893A009375167A24F720616CD939F5F5F5CA643215DA3F2AA354D479561849809BBABA3A47FFB40EAB56B20158C9E7F315CEB98CCB6AF9D803700F401E6BB83591810ACA78AD090CF7071442E79DCE9487BD00A090734BA592633B711D7B4D0022EFD63A99DAF7CB71561A63A53456AA03E0E35D5BEF06AB87657C56B66329C03C23C7592695F7373EBBE181C42F50C0F37FE5955794CBE5D4D3D333EB5544C2E7F3399008B50B5068B350F443840BDFD8D8E826279ADBB390592B78AE4136D2D2196C6B0B5B3D9CAEE2C8A466358ED67D4C9AA260584A0B7A49A8B096364B96CED252ED75A429EA08F7E499ED068FEBDA45553A4FE3FABCC592254BB475EB5695CB65BDF0C20B2E337CFBEDB77B6636D74190046A6B6B537373B382C1A0CE9D3BA77FFAA77FD28D37DEA8AD5BB76AC1820557A5039C9898502E97735A994F1B248CB0F6BF9A4037B47BF76E3DFBECB3EAECECD437BFF94D2D5DBA5492F48D6F7C43C3C3C3FAE77FFE67954A259D3C79524F3EF9A45A5A5AB475EBD64B0226EB42C9BC365D94CB65BDF9E69BDAB3678F1E7EF861B5B7B77F663283FEFE7E1D3D7A543E9F4FEBD6AD532C16BBE09823478EE8ECD9B36A6969516F6FEF259F996AC3D568563F8FC1BA592A9594CBE52AE88E98A2A4522985C361A7F5F2F97C0A06834A26934E7B078D111754EB8A9AC9641C3D12904745927538954A55004C28A3A3A3A3EEF796D68CE60DFD9C4DD8D2271163147476A954CAADD300258C75A8B6B176426B95E4C017895C74FEDCC356AE584F2CE80A06834AA5521780BF4824A25C2E5751F5E339D8B340B59CCE711416125216D66BF63250644994DB7B5BE31F80239F199451BE0BEC657086E5DEE837A73B8EF3ADD10CEFD7D2526D6512861774678038CFC4DCCFFBB5AEAF541AAD6ED6D324CE6E786FFF0B14A9544ABFF8C52F74E6CC19B5B7B7ABA3A363B687744130F90088003CB158CC0131264080158D7A399EAC14D4125B6DE35C2A6E1604526D44842E4DE90E98A86C4F4436B0E880AA9D4FE1DBF33313B3D552DA4CE1A5802363E439596CA1F1B0705503C79970639CABD1DCDCACDFF99DDF517D7DBD7EFDEB5F3B87BE7BEFBD77B687E6C5652293C968CF9E3DFAAFFFF5BF6ACB962D5ABC78B1DE78E30D7DFCF1C7FAE10F7FA85028A4AD5BB75E15853893C9E8EFFFFEEFF5F8E38FCF9871CD77BFFB5D7DF7BBDFBDEA0DCBD8D8987BB6C6C6466DDDBA5537DF7CB3FBF79B6FBE59274F9ED4B163C7F4F6DB6F4B9276EEDCA9C58B176BF9F2E55ABB76ED45AF1D0A859C7E707474F4A2F42C80DAF8F8B86EBBEDB6CF14609D397346478E1C91DFEFD7FAF5EB2F5A49CCE5725AB76E9D9A9B9B2F9920C8E7F32A954A6A6B6BFB5CCF71571298BB64B3D98A9609C562514D4D4DCE0CC8821112AAC964D2D150A9A8452211259349C7D80120462211B7D6FAFD7E079A305EA1BA07186B6C6C94CFE7D3E8E86845CFC1BABA3A45A351251209F77B5C3083C16005480B87C34AA7D3155A3E401D4EA2F5F5F54A24121594483493C964B202D84C4C4C281E8F2B97CB3960150C065DDF50A2A6A6C6691249040336798F1313134E3329A9C2F805C31C409D6D2C6F2995D168D48142AAAD1313130A85422E311E0C062B003B95BB482452D1EC9EDFF30E793F56534A721D3D249217E43DD5AEAD507B6DB29BCF967B588A2A00986A2D8090F763A9A8004CFB7B002663B7154F2F66273C90F8058A9191113DF6D86392CE6FB0E752C505873EECB625B909C352240043D053A998F97C3E9749235B88B532208E73AD4536A0AAAEAECED14BAD86509A6A71510D1C6DC59109CE1ACF00F0182F195D802D595E9B95932E048ED254C6CF524BB9BED521228E87FAFA79DE40F11DB8F7DE7B555F5FAF03070EE8CFFEECCF24495BB66C99B39AB42F7A643219EDDAB54B3FFAD18FB476ED5A7DFDEB5F572C16534F4F8FFECFFFF93F3A7BF6AC7EF2939FA8AEAE4EBFFDDBBFFD899D97038180EEB8E30E757474CC08486C6868D0EAD5ABAFFA6F69727252870F1FD6238F3CA2A1A121FDFEEFFFBEEEBCF3CE0A90D6D0D0A03BEFBC534343433A76EC98128984F2F9BC5E79E515B5B6B66AF1E2C58A4422D302A7DADA5A35353529168B697070F0A220F1C891231A1818702C8BAB0934E3994CE613AD2167CE9CD1E9D3A7B578F162B5B6B656540927272795CBE574F2E449F97C3E2D5FBEFCB21564DAA62C5DBAF4733DC75D2E0039B95CAEA29F60B158542C16734621D6B4849EC354E7ACACC3EFF72B9D4EBB75B8A6A6C6B58E0048E2969ACBE52A00666D6DADAB84F1BDC8E572EEDE80320017EB9CAD7E4972944DC086ED19C83A5A28145CC2066A265A4CEE87C6164A2B7A5BDE5543438303C096C1438219E75292B380370B1CAB5B4700747154054059FA297F9FA150C8014412D6004FAA91C859D06CF2BEA84C5AD319F4A5803AF6238040492E714DCB0E12DE5C97E3F82E5970CB67C87E877B40AFAD36CC01385A0F05BE3FDCC3CA72EC3DD85B5990E9C5EC840712BF20914EA7F5D1471FE9CD37DFD4B265CBD4D4D434A71657FA1742F1B4C2FB7C3EAF70385C51216412B334505B1994A66CACADB103131A2277B28F1638DAEBD93E8956100F759589D2024768505430ABABA2DCD75E03B057ED506A2B8E9C6781A8A5C256EB11AD30FDF3AAF392A4CECE4EDD72CB2DAAA9A97166363FF8C10FB475EBD6D91E9A1755512814F4D65B6FE9B9E79ED3F8F8B8BEF18D6F68D3A64D8A4422F2F97C3A7BF6AC7EF6B39F69CF9E3D7AEAA9A7148D46F5C0030F7CA2B9CAE7F3A9A7A7474B962C99910D06B4A8ABD5C69C3871422FBDF49276ECD8A1071E784077DD75D7B45AF0850B17EAEEBBEFD6871F7EA8C71F7F5C994C467D7D7D7AE9A597B47AF56A7DFDEB5FBF28E5B5B9B9594D4D4D3A7BF6EC4535C8E57259D96C56C964527BF6EC516F6FEF27921B4C4C9C6FD3F1E4934FEADCB973FADAD7BEA64D9B364D5B15B4512814D4DFDFAF542AA55B6EB9C5E9C689F1F1711D3F7E5CE7CE9D534B4B8B56AC5871C9EB954A25474D5CB66CD917968E860E8FA4238944009775E8B6066BD0FF48AED2FC9D0DFAD8D89803472446A12456D33C2555DC834AA624076E009856A70620B1920CBBAE730FD66500055539D655C0149448D63F1C43AB13A6C8556C0F49AB8D9354B1BEB32E730FAEC5EFED3BE53D59D02D553A80DAB1588D20E7DB761C56760278AB36E5A94E765B30CD3D6C15D71AE658631E2A8DD2943F42F53EC48EA9DACCC6823DBE57D680C6EEB1EC3DF80CEC3DAC3692EFB917B317DEDBFF82C4E9D3A7F5E69B6F2A954A69DEBC79AE79FD5C090092ED25C8648DC3198B83343D70B43D8424397D9E5D70A0815AE1378B15D94FABF9AB068E76C3689D4AA1F158072F9B0D93E4F8F98C9763B82E1324CF2CA96272B693B1546986C3C205A825C878B229F8BC061585C9C9496DDFBE5DD16854AB56AD524747C7A7D29279F1E9239BCDEAE38F3FD6B973E774EEDC393DFBECB3DABD7BB7B66CD9A28D1B372A1E8FABAEAE4E4B962CD1BDF7DEAB6DDBB6E9D4A953FAD5AF7EE5FEDE1A1B1BD5DDDDADD6D6D62BDA345015998D181D1DD5C183079D1EE99D77DED1F3CF3FEF68FE7D7D7D0A85425ABC7871C5DFEAC8C88832998C7A7A7A5C03EDB1B1317DF4D147FAC94F7EA2582CF6FFD93BD320B9CAEBFC3F333D5BEF3D8B243492D002929084D0060809218C592430B265C0C189717028975D76AA525425A97C49553E25E54AA5E2A452E57FD9892BB153B6830D18B3186C840CB2C4AA7DDF5784D036333DBDCD744F77FF3F4CFDDE39F76A0402B4CC8CEEA95231F4DC7BDFF7DEDBF39EF739E739CF714DEE478F1EAD71E3C6B9735B5B5B954AA574E4C891F3D2B3C68C19A36834AAF7DE7B4F3FF9C94FB462C50A4D9A3449A3478F7659A38FB26AB5AA03070EE8073FF8814E9E3CA96AB5AA969616CD9B37EF23CF3B73E68C4E9C38A19A9A1ACD9E3DFB9C5AC352A9A4EDDBB72B9D4EEBA69B6EFA5890D8D1D1E1A88A572B48248383F809193A4013D93AFC0B464B0A69A0AF1D008DD6130438298F0098D5D5D5B9760A64E2A8E9C34FA2644A86CDEF3FEDB9F8635B2A61FD15C759F54F0495857516000020004944415465C81A721FFE2C17D9480BA010DB015CDBE3AC6FB4F5947CEEAFBF63BFC23B20A84DE6D5D646DA9217009024B70FB1EF14611DAB73008593DE8464E4FCFB0668BEEC2B30447C00695630870038EFC08E618120EF8A77C3E7EC4B08BEF3AC2479B29C566382E36C86D7EED1AC08A06574057665ECEA5B5DAF42AB542ADAB76F9FFEF0873F68CC98316A6D6D1D9205FF5049AC180C9FB398B28013D584FA416F9D6834EAA9F9430CC73A4A166A1C2A594CBB30021CFD194769A0A6109A099F5B4067456C98238B3BC200DC93CD5642FFB0ED3E7048B6FD06914D3F20B5FFB5A23D442D47B24D983041CB972F57B55AD5AA55AB3471E244AD5CB9523367CEBCE0C6E4815D7CFBF0C30FF5AB5FFD4AAFBFFEBA8E1E3DAAEEEE6E854221EDDFBF5F67CE9C514B4B8BDB807DF8E1874AA5522A140A2A954A7AEBADB774F8F061C56231FDCDDFFC8D962E5D3AE47B62EEDFBF5FDFFBDEF794C964944EA7D5D1D1A14C26A39A9A1AFDE8473FD2E8D1A3F5C4134FE8B1C71EF3ACC39B376FD6D34F3FADBD7BF73AD0C6DFECAE5DBBF44FFFF44F8A4422BAFEFAEB75DF7DF7E991471E71E78E1A354AA9544A6FBDF59613B8F06FAE264F9EAC1B6FBC516FBCF186FEFBBFFF5B6FBDF596962D5BA6BBEEBA4B3366CC5024127175648301463693D16854CDCDCDDAB2658BF6EEDDFBB120F1830F3E502693D135D75CA3B973E70E0A12B76EDDAA6C36ABF6F6764D9E3CF923AF77F0E041757474A8B9B959E3C78F1F528C98CB613062AC400BF577F84E001EF4C352A9A4582CA6EEEE6E4903E50B854241CDCDCDCA64320E64210263C15FB95C76FD13FD99226AF77A7B7B1D40841E190A8594CBE55CED1DA0ACBEBEDEFD4D702F3D3D3D8E0E0A20B1F577B63D1663239893C9643C54CBBABAFE46ED7CCE9E81B212A89AD07301733C5FAB59808FCF66B32E0BC7DF17759996426969B7DC6F535393E77CDBE603A00DBD16DFCD5E221C0E2B93C978B26DBC5BDBB01E8067E9A008C3D8BD0AE538BC434476D8030176A1CE02F8EDDE03213E32A60866F12E5180F5ABDC729C3FA8401B120B2851EA0DDADC5C590B40E2556067CF9ED5CE9D3BB567CF1ECD9B376F48D5225A03005A07C142250DA8771255242A46248DE8A3A58DA030664113541AAB50CAA249E410878483B4C091C270166716474B2BB53506CCDDAA7CB118B3785A396B496E81C421F98128194B9B15A5C691089E8D825E2D964AA5F4E52F7F59914844FFF11FFFA11D3B76E889279ED0F2E5CBAFAAE730942C954AE9F6DB6FD7942953DC7797BFF13163C6B8F7128FC7357FFE7C3DF9E493E7D4F8F6F5F5E9BAEBAEFBD8B60843C1C68E1DABAF7CE52B9E9A669BA9E8EBEBD3ECD9B3CF013793264DD2FDF7DFAF254B96B8B5CF1A9BB4783CAE2953A6787E3779F264CD9C3953BFF8C52FB467CF1E2593C9736A722391881E79E4118D1A354A3FFEF18FF5DE7BEF69F7EEDDFAC94F7EA2A953A7EA9E7BEED17DF7DDA769D3A60D0AC4EBEAEA74CB2DB7E83FFFF33FF5FEFBEF6BDFBE7D1F4B3595A4D1A347EB8E3BEED0BC79F3B470E1C2730294A55249DBB66D536363A3C68E1DFBB12C971D3B764892E6CC99F39968C0C3D1ACEF23C3D6DADAAA8E8E0EE7E3A070B6B5B52993C948EAF749B95CCE89A5B0C14F2693EAEEEE764C9A8686067577777B829000C4AEAE2EE727A57E9A696B6BABB2D9ACFB7B86F1934C26D5D7D7E734017A7A7A1CFD138058A954944C269D72266AA756053C9FCF3B11184B4B2C140A4E30C7B6DC600C8023F7C0BE8086F3762EE974DA9DC333064CB5B5B5A952A978DA665831BBEEEE6E4F6D254114EE8F31B2D9AC0730711C9FA37E4CC0DB0247C0B4CDBCA1DA6AB379D56AD589D9480342387E5026F5EF81180F911A496E2F52A954140E873DD964EE31168B9D031C391E319B9A9A1A45A351070A6D6D25C7F19E3986770B70E43D0599C42B6BC1AEE92AB04D9B3669F3E6CD6A6A6AD2C48913874CDB0BBF95CB65A7CE1789441C0581226B40A105656C3858447160A8B0E150A09D5A896D0B1CC960DA9A3E499EA8BA05A238683F55D516A7032C592443A190A71E87E8AB244F0611E0C8B86C26FDFD8C8844725FB61EC2D65330F7ABC188EE2E59B2445D5D5DDABB77AFFEDFFFFB7F3A76EC98FEF44FFFD4D3F72AB0CB6389444273E7CED5CC99333D7F4B923CB5D1D168543366CC707D30FD3542A9546A5880C451A346E9EEBBEF3EEFF70C5ABD1F248E1F3F5EA954CA53FBE337FEF6FD99F1582CA62953A6E8C61B6FD4962D5B74FDF5D79F03126B6A6ADCDC264D9AA4BD7BF76AFDFAF55ABF7EBD76EFDEAD23478EE8A5975ED2A2458BB472E54A2D5AB4E89C79241209CD9F3F5F3366CC50369BBDA0BFA53163C668F9F2E56E2DB7D72C97CBEAEEEED6BE7DFBD4DEDEAEF6F6F68FBC66B55AD58E1D3B148944069DDF48367C5C341AF5D03CD3E9B4247944516CD6CFD6DEA55229CFA61CF04606A8582C3AF0062DB0BEBEDE014CBE77804D00A21568E15C7C2C3E89602FC023954A39E040CB03D43C25B97350F024EB474B085BCF0820627EF4ED0338DA00AC1DA3B7B7D7038CA48160350166800AF45AF64F166441FFACABAB3BE759F5F6F67A6A2539AE50289C03302D4094E46993C13C6A6B6BDD33B49945809FDD0BD87D0EEB0ACFD42F2E03A096E4C0307B2DCA7F6CA6D8D621129CB6CFCAB619630DE738E648709B676A29ADEC89AE36A6C050B300248E70EBEBEBD3C68D1BB56FDF3E5D73CD3517547B72A5AC52A92897CB3935522B3C5328149C432897CB8E426255416DADA08D0A4AFD0B3F0B3ED40C2B3483ACB5058E50722C6DD39EC375A190920DE433E836760E7E2A972D9827BA86129A7F8165B1B60ECF0F6201A9CCD9024D16FAABC1468D1AA57BEEB947C96452DBB76FD7D34F3FAD6C36AB2F7FF9CB1A3F7EFC90CDA68F44ABAFAFBFA056167575754A2412C35E95968CD827B54824F289955CB1BABA3A4D9C3851CB962DD3DAB56BB570E1428D1F3FFE9CEC797D7DBD468F1EADB6B636CD9C3953B367CFD6A2458BB47BF76EEDDAB54B9B366DD20B2FBCA051A34669C68C196A6E6E3E679C4824A2CECE4E2512890BAA6D0F87C31A3F7EFCA0BFCBE5723A78F0A03A3B3BB568D1A241057DB052A9A4FDFBF7ABB3B353D3A74FFFC8B62023D178F6162C10B4B4EC168094ADB7839163952F11BC016491F1A667A2051BC562519148C4F90F80271455FC941F58D9CC9034D0C713FFCD5C247980A4F5AF64EE980B7325080C5DD40AC5E06B0998DAD61356C8857BE4676B803AC660BF61CFA546937D03F7CE1856B9D56642AD288F7F0C3F78636FE2DF2750D7C973B6545BAB85E0AFF1B3EF96EF06D7B29F03DE782E3C7FFB1C78CE7E30CEBBB5C7D95A4E7B2F5619D68AF5F8E9B5815D190B40E208B753A74E69E7CE9DEAECECD49C3973862C4094062278D4C6D805D3D6E6E11090E66621418E9B027B1C0BD93B4BFF6411E37A3856EB8C9883E5E9D326C382309BE1E31EA81FB46A605C93F35804FDD7B33435492EC2EB2F32B7CA683800499E4CB115CA6181BF5A6CC284098AC7E38AC5625AB76E9D7EF2939FA8542AE9BEFBEED3F4E9D3879C785360817D161B33668C3EFFF9CFEBC5175FD4DEBD7B75DD75D79D17ACD6D6D62A994C6ADEBC799A3B77AED2E9B4B66DDBA6E79F7F5ECF3CF38C8E1C39A26C367B0E4894FA37FAEBD7AF577373F367EEB59B4EA7B57DFB76158B455D7FFDF5E70589D56A55B95C4E2FBCF0829A9B9B3567CE1C8D1933E6338D3D9CACAEAECEB161F07B646E08665A95CE5C2EE709844151A57ECE520F2D1020CB6569908005B275F842445CFC4A94994CC6532E42C6930C1B5452FA2ADAC02E0DDCF18364046D0D248DDAFDA23C9CCBCFF8761848D280BF869209D8B5C15C69C0E722A40760B419323FB3C7FA7D54637926F6F9022499A3D54C007493D1B3144CEBC3FD9A0D5630471AA0B8FB857118C396D6C04AA2AD087B2DC606C49229B682375C977A48EE837D18CF878CA0EDAB683FB7653856F046BA7A585043D502DED508B70D1B36E8F8F1E30A87C39FD9A15F2E63516F686850341A557D7DBD128984038FD629529797CBE5D4DBDBAB6C367B0EE502B5368AF21B1B1B158D469DB322CB562C16552C16D5D3D3E37A2921A061EB1AAC221B85F00D0D0D0A87C3AE0601478C9A6AA150700DA07B7A7A9CDA180B26E7A0CECAFF035A595489DE964A254715229A8C53645165D1E6FA57236D23954AE9CE3BEFD4430F3DA4783CAEEF7FFFFBFAE94F7FAA2D5BB638CA4E60818D040B87C39A3C79B2EEBDF75EEDDEBD5B5BB66CF9D8A0503E9F7780E2E69B6FD6E38F3FAE9933673A1555BF95CB65A5D369EDDCB953EDEDEDE7CD105EA8A5D3696DDDBA55D56A5553A64C392FF02B954A3A71E2847EFBDBDF6ACE9C395AB060C1671A77381914FAC6C646757777BBE025C1CD6834EA1431ABD581FE871C0768E9ECEC743ECBD6FEDB8063434383D2E9B4BB161B767F0D1C414BDB3710808822B1249799ECEEEE7620CB1E675939B158CCD550DA0C523C1E57B15874F702C0A344A4AFAF4FE17058B95CCE239ED2D3D3E3A88FD2002D92E32CF883F5831150066803DEA0D15AD01C0E875D6B0DC03C944CFCAEBFCECE9FD964FF011004E0017CA1C4F23E10EA63EF4246D866EB78EF004CEEC3EE79FC8239BC33C600FC49F294D8B0AE0010257932B936300D104418C702769E15FFCFDE85EFAEA5B50676652CC8248E705BBB76ADBABABA3E51E3E32B6D380416781B216521ACADAD552A9572B454166D225C2CDA96C2C2C245148FC81AD150327A766162610488C5623127134ED48D851930872299A573E094C8585A40677B434903423336BA190E87DD82EECF1CB2605B9AAB3F83381C6AB92E9535343468C68C19FAF6B7BFADE79E7B4E2FBEF8A20E1D3AA4C71F7F5C0F3FFCF090CEAE0716D827B1582CA6279E7842FFFEEFFFAE03070E68CE9C391F497D7DF9E59775EAD429B5B7B76BD4A8517AE9A5973467CE1C7DEE739F5332993CE7F8E3C78F6BF5EAD55ABC78B1C68D1BF799C5A0D2E9B476EDDAA5B163C76AF4E8D1E755213E76EC985E7CF145AD58B142B7DF7EBB468D1AF599C61D4E964AA5D4D7D7A74C26E30005A0A3A1A1419D9D9DAED60B10904824D4D5D5E528A2003C143151A504C0C5623195CB65D7E41E7042D0B3A3A3C3F910326FF1785C5D5D5D2E200A58482693CAE5722E38D9DDDDEDEA70ABD5AA0A85826A6B6B158BC53C19412B8C834F43B51570017048A552CAE7F3CEAFA2E81B8BC59CD00CD97204E868FF61299C08B17CF0C1072E7B87BFB6B59500E9BEBE3E3706FB009452F1EFD44AF24C6D5B100B1C7B7B7B5D7DA9CD9E21F653A9545CDDA25508A5EED10AE100EA28CB01F4160A05076239AEA1A1C1BD5BEE83A0374015555A2B8C032B8B7706C096E4092A505B5928143CE094721DDB42C302478202E170D87D472C700CECCA58001247A895CB65E5F3796DDAB449A55249ADADADC366339CC964DC82C242697B2222168373628143518BC505A0687BFB100DB4C0D1D61B58011C22B82C6096164A9D068BA4057A70FC593091FCB6D452A2752CF22CC4443B6DB4511AA0CF58719DC16A26F9AFEDD90895E36A5D6CD9205C73CD35FAE217BFA8B6B636EDDCB9D309DA3CF6D863AE0D4360810D67ABADAD556B6BAB1E7DF4516DD8B041BFFBDDEFB472E5CAF30A36DD76DB6D3A7DFAB4BABABA74F6EC59DD72CB2D9A346992264E9C38E8F1ADADAD5ABA74A952A9D445A16B279349578B3879F2E4417DD4912347B46DDB36353535E9DE7BEFD5840913AE8ABFD5DADA5A251209E767F04B8542C1012E543725B9BE82A8695A4A2A593F0022EC9A5C2EE740043E12404350998D3CED1AC83E920DB4B57BB158CC0144689280169830F8559BBD026052320270C866B392BCA23CF1785CF97CDE238C532E979548243C193DEE5792DB0F0024F1895601D43E7780270164EE31168B39DF8A1FB7CDEBAD0228C759E1209E2959550B30118BA15ED3D62A168B454F56D3D60D024E11F821C30AE51360CD7156AC87BD07E0CD823A5BC30890B78237643C6D3D264097CC26D4552BF2C7FEC5024C5BD6C377C15F7613D895B100248E502B140ADABC79B38E1F3FAE783C7E41C21143C5A070F86BFD58B86A6A6A94CFE7158FC75D568DC270CBD58772636B0224B905DBD2277A7B7B1D70B4D14C5B37C8CF8033162F3B47AECD820F858705CF2E86D24076D32E882CFE2CC43824BB084B03623436E368C7E2FA2CCA36537A355A5D5D9DAEBDF65A1751DFBA75AB7EF9CB5F2A9FCF6BC58A159A3A756AD04F31B0616FA150483366CC505F5F9F8E1F3FAED3A74F2B168B0D0AFAC68F1FAF9696167576762A9D4E2B994CAAB5B5F5BCAC934824A24993260D7AAD4F63EDEDED7AE49147D4D6D6765EAA693E9F57434383162F5EAC2953A60C5975EE8B695036094602100178641329A7A09E1E4002BBC6AAA0524E814FB46228A552C91D4780127F06ED12D0812FB20AA080088EB7CDEA6D86CD1E8759754DAB4340ED1E192FFC17814F5B4B6933A9005AE668299C565D13FFCAB5EC779AE78B889E650C3147E62279DB4CF1DEAC288F15CCB1A23C96D56441AF5F04C66671A1A2DA40B27D1F049CA58180B11581B1CFD76668ED5CAD208DCD26DAE76985926C90DD8247AE6BEB56ED313C53BF280F99498E0BECCA59001247A8757777EBD5575F55B158BC6851DFCB65383E22622C442C1880289C058B5B4F4F8FCB3802FE905CF7F3E0ADCA17CEC5F62B94E41C2A9FB1700DA6286A33832C6A2C908C639D37E7D8FA451B95B3C5E12C96960EC3756C8139D41B69C0695970C818C86A5FAD366EDC38452211A55229AD5AB54A3FFBD9CFD4D3D3A3071E7840B366CD1AF6EA9A8105565F5FAF1B6FBC51D75E7BADBABABA3EF2585455C78D1BF7B1D7653DBE58D6D2D2A2C58B177FE431C96452D3A64DD3F5D75F7FD1C61DCA46E0B0BEBEDE65DBF039B411806A894FE21C3282366B03C02033C6EFAC108B0D56168B45974D94E4F14F003C0BD2AC7FB53446EB37F91920616990D2800E01EDAAF0EFF84A7CA915CCB1C22D641D01881C07A0668E8C817FB4F44FEBD3012AF874CEB7FD122D05D402308EF30BDB90C5B30093CF2D3043DCC52A8372AE34101CE679F23E6CA6D01E67D95280390B100180004F1B78E67CBF5AA90588F67B6BD54FEDF320B309C0647E649B39DEEE6708820476652D008923D0AAD5AAD2E9B45E7DF5553536362A1E8F0F3B7A8ECDB60116713096626A4114EA5E38471C06993D9C0C8B90ADEF6361B47582D06C7050380F2282F61AFE48A4A5834A728235F6F736CA66177D494EB5D52A8D598A0B0B2A0238D64911FDB3C0D13AAAAB1D244AFDFDF96813F0D39FFE543FFDE94F75FCF8717DE31BDFD0CD37DFECBE738105365CADA1A1416D6D6D6A6B6BBBD253F94CF6516D31469AC18A012C20FC028D321289380A26FE259FCFABB9B959994CC6F927687B503073B99CEAEAEA944C265D8DA0CD08251209F5F5F539F0865F0987C38E5A4AA376B25F8D8D8DCA64328E5A09780368E217114689C7E39EE3F0DD56CCC6522D1171EBEEEEF6346A27CB8A1A675D5D7F537BB400CAE5B2E777B6DD15345CFCBABD96157982766BC194A5DD02CCFC73A196CF0249A97F0F033DD7067FA9CB94E4F1CD0065DE277B070BE4A3D1A8AB41ACABAB53535393ABBFB49947FA27B28F60FFC0B306F0FB83D85694876765D567D9471154B0F59B8060B2AA0041EE9BFBE8E9E9F17C176CCD6490411C1A1680C411687D7D7DEAECECD4D6AD5B75D34D37291A8D5EE9297D62C3B1B1905ADA8A2447AB204A656B09015D14C9535FC12265A9331C0BADC45ECF2EB600C45C2E276940C18B6BE1C4583C719036DA8963F68353DB570A506B691816385A6AABA5ACDA0CAB6DBFC1FD021C838577C01A1A1A3461C2047DF7BBDFD5F3CF3FAF75EBD6E9D0A143FACE77BEA3071F7CF053F7AC0B2CB0C002FB3486FF02208C1A354A994CC6F98E42A1A0BEBE3EA55229A79C9D4824D4DDDDEDEAD10034A954CAA97ED7D7D73BA11980199BF496961665B359E763010EC964D2F93C8023F4CFFAFA7A071C7B7B7B5D96083004B51391954422A19E9E1EE7776989118FC7DD18561D93DA4ABF9A6B2814522C16739F5397891E81CDAA01A8C3E1B0A77E93F614646BD3E9B427934856359BCD2A9148B82C98D42F0C85E239758FB40B91E46AF6C8C4B227C966B31E469424A7180B0805B003C6014D802FC46C10A7B300917A41EBEF01F9002EF604A552C909E630067B07F631361B6DC7E05AB6C6B4A1A1E11C80E8078EB6569131686F22C993B90D00E2D0B200248E403B7BF6AC76EFDEAD42A1A0969696610912F3F9BCA380F6F6F62A9FCF7B68A2D168F41CAA25193EC01459357E4F34D646B058B4AD2228E712A9B55455491E1A09D7B5351E44E5FC3D11513CB5F4547EB680114A0A20D10247AE0740B4D45740AFE42DFAE6BACC37B07E2308D0DADAAA65CB96A9A5A5455BB66CD1BFFEEBBFEAE8D1A37AE8A1872E6AFD5560810516D8F98C2C0A2022954A398068A97CCDCDCD9E4D39E08D520B4000608692064005A23708AC588008CD2F994C3A4A2A3EC52A85A3ECC931643FE985C89E03B0C01C0992F6F6F63A01192BCAD3D3D3E3401D204B92E75C6A54F16BD240E68DFB0550FBC57B006F7E506745E20049968A595353A3582CE632A9DC2FD4559E2781636A4179068066E6515B5BEB7A3ADAE02D593F6920F86BB37E96F1643513008500658E83B2C9FDDA1A56CB38EAEBEB53241271E7DAEF1BE792E5B473B10C2B8E03F031360011E069857F18DB0AE6047B94A16501481C8176EAD429EDDCB953914844C964725816FA03BC907266C1A636AFAFAFCF351566A16181B419427B0D0093A511DAC8A3A5A5B098DA451DE068411AD93FBBD0E3A8AD9437594A7E6769A6D056B91E113FAE65C50BFCC5E2F6DDFA81A3BFC6D13E132B1C70B55B2814D28409135CF4F99D77DED133CF3CA34C26A3071E784073E7CE750188C0020B2CB08B6DB5B5B52E5384BF21A8495D9DD40F22AC2AA524070AA5815AB16AB5EA696D800FE1385B6BC6189C6701177E0BB68C240F90C067325FC00673C11863308116E608F8F2D7EFFB6B1301C77E10425099E330DBB70F400AB0C1CFF333869FE47D303F2B10C439569DD3D617F20C6C76CF0AB4583A267B0A7FED9F1577B1E7236C83CFB7EFCD1F74668F60411DFB245B6B6AC760AF0578E3BACCD71EC73EC406B639C78E6101A5CD9EDA6CA27D6F810D0D0B40E208B493274F6AC78E1D6A6B6BF3D4C50D3763D30E95C4D6DDF96BF37042440F598068746FB38036DBC6F9D2C022C5026E1D0FD783FA02F892E4A1AA4A03192A164769C061DA08204E8B9A0CE6E86F6D619D01D78136628123CE8A85DD9EE70F140420F15C1B3B76ACA2D1A89A9B9BF5F2CB2FEBC5175F547777B78AC5A2E6CE9DAB582C7645EB147B7A7A94C9641C754992A34AA30C79EAD42957E322F5FF0DB10E0416586043CFA86BB3ED066A6A6A94CBE55C50521A60A47477777B846CC81442BB0C85429E1A36496E230F2DD18AC090A163835E5757E7FA25922523184AB905A0093F86722AAD356C968CF207C600FC150A055727CFBDE0C3993BFED32F98C3752CD8B0208DEC940588F84C3269F6F9D8EC950DE85ABF4EDD21D7650C1BB8ADA9A971C0195F4DD01ACD04ABE069DFAD244783B5415E2BB6C373B2739706C47B98A32407C000F9803AF60DB666122AA8DDD7704FD052C95A729C057FD453B2E7B0C10EABAB6003E4F6FB0FAD35B0A16701481C6156A954F4E1871F6ACF9E3D1A3366CCB06FA2CE02631754A29E36BBC88264338D64DFAC0A1B8EC70247229C369A87D3A016A1A6664032DA02471B5DB3C00EE0685546A921B1D94C9AC64A03F412AB50CA712CDE969E6AA38518CEC02EDEB61E816B0536B8251209DD7CF3CDBAE69A6BF4AB5FFD4ACF3FFFBC0E1D3AA4BFFEEBBFD64D37DDA4582C76C59E5F6767A7B66FDFAE1D3B76787AA74D9F3E5D2B57AE9424BDF3CE3BDAB3678F0B90A45229DD75D75D17A45C195860815D5EA39C20168BA9B3B3D36513D9EC87C361E5723907E4BABABADCCF6493E2F1B8CE9E3DEBC440F07F9665130A85148FC7D5D1D1E1FC27A517F178DCF526A68610D60C59C36834EA9ADA5B5A2182390044EEC3B279AAD5AA128984AB5504544A72144CA8AC8050E65E28149448245C5F44800A40977D41B158F4F44FB4022D681A588A2C8034140A2993C97884E7D807148B4525120995CB65E7A7A1AB3206A01BAA26204F9203C3D488DA2C1CEF967AC66AB5EA519965EFE25754B599468019BFB33D33D98F3006FE9F0C349458F65128A29251645F43C091FBE0B95B80C971163842AFB53D0F6D5F444B650D28A643DB029038C2ACB3B353C78F1F573A9DD69C39738635482C168B4AA7D32A954AAE2D81ADDBC041F0594D4D8D92C9A4038B2C6CA552C92972A1D60525C6461FB95E5D5D9D3BD7824F5BA38063C351133D6491668E1638DA0C26D7B20B2E8A72381C9BF5B4115D2BD4432416E04854D3D2672816E7FCE19A59BE5C160A85347EFC783DF6D863FAC31FFEA0B56BD7EABBDFFDAEFEEEEFFE4EF7DE7BEF79FBB95D6AE39D170A053DF5D453FAE0830F3479F2647DF5AB5F75C71C3F7E5CAFBCF28A72B99CEEBFFF7E3537375FD1EC67608105767E8BC5626A6868506767A763A9B0F14F24120E3822BC525B3BD0B09EDABB8E8E0E0F9DD2966AA024CA7180058063229170C013B055AD56D5DCDCECC02222356CFC012A894442E974DAD5DF373434382049A946B55A552A955257579787FA5A2E97954AA55C2B0F4451CAE5B213B3811E9BCFE71DA0000C49F228A1525B4900988C57329974E7E3674BA5921B839215E62A0D50412391886B29E25741056002108BC5A287215428141CE0B759409BD1CD66B32E68CDFB0028031C0172F472F62B994245B6FD30AD285F369B75FB180062241271DF25BE0B929C988DCD465BAD073285803FF62E56ED148089608E0D6CF3390102021D8156C2D0B600248E303B76EC98DE7FFF7DD5D7D76BF4E8D1C31A24D286828590C5A552A938496D800F7C7C0B1CAD308CA532B0F003F05880C9FE59EAA61FCCB190FBC567A4815A44165D7FC61167CD18D2405614E35C16741C32E0D68AD3B0285B5AA9CD8ADA7B01405ABA6AB0309FDF42A190DADADA74E79D77AAB9B9596BD6ACD1BFFDDBBFE9C08103FAD297BEA43973E65C76F0D5DCDCAC9B6EBA4963C78E555B5B9B7EF0831FE8D0A143DABC79B38E1F3FAE4824A2BD7BF7EADA6BAFD5D2A54BB568D122C56231B5B4B45CD679061658601F6F043E6D16C65236C9700184C81AD2834F92A366B2C1B7CA9E08B4402BC5D7158B45978DCC64329EDAB29A9A1A2512090710A127562AFD6D322C4D13A5557C182C195A76E0335129B74DED69FD6055B7019EA552C923BCD2D7D7E7EA210131F178DC1D47368F721049CE670210AD280FAD38F0EF1C8FBD13B0A500002000494441543FB48C227E26905C2E97DD18505FAD0228F45AB2B0B6569177CB7D589066953DAD100E593F402881013296006EFB6E095403EA0063EC5F10EBB1E53B36EBC7F3B0F5821C67FB6A5A80C9FECB9F99B45A0D96E6CBFEC33EF7C086A605207184D9F1E3C775EAD42945A351076686AB59C52E226BD2C0024354D05237517883C683808CADC9B2ED30301674163A4029CEC946CA2CF0C6F9D83A488E97E4A284D659E028A581BA0B7E47E40DEA902D42C721D8C271AB4AC77C24B94D87241759E5FFB93E4E36B0C1ADAEAE4E63C78E556363A31A1B1BB576ED5AAD5AB54AE9745A5FF8C217B464C9120F6DF9521BF3686E6E562A95D2871F7EA8679F7D561B366CD00F7FF8439745FFFCE73F3F68C6B3ABAB4B7BF6EC718218E9745A4D4D4D9A376F9E468D1A15D090030BEC3218D91C491EEA23F57280194001D443D66C0C711798270044C45EF0098C01B5137F012D950CA61568616C7C955FD1121D00BFBA269946D644E6857A3820C2F6E793744E96127F85600E005A1AC8205A911E802459297C2763F0FFDC93157EB18237F61DD9A02CBE169067456EFC63701D2BCA63B502788E04A26D9691F36D7F46820456948767E91F83B139862003CF93E7EB673AF9D54AFDF59EBC37BE0FBC732BAC83F15DB035A59C4B50C0CE31B0A16D01481C6176E2C4099D3D7B56894462580344ACB6B6D615EF5BC0168BC5DC22C43F16405BA44D86D0D634FA7B224A720AA82C5CD05DAC729924E7B458A4019B383B9CB9CD34FAC5712C68644340849039D96BE0A870C82CAC38479B25C4C1F8812373E1B9D866BD819DDF6A6A6AD4DADAAADB6FBF5DA9544AAB57AFD69A356B74E6CC19552A152D58B0408944C281F3CB61A1504863C78ED5C30F3FAC4C26A3679F7D563FFEF18FD5D6D6A66F7FFBDBBAE38E3BCE0188DDDDDD3A78F0A0B66DDBE63202070F1E545757973EF8E0033DF2C823AE27D85036BB090C2CB0E16604E8109A910644C5F027305D58A36DD0909E85804580030DDC095A5162609BDA03882C2DD506B9D8BCE7F3790FA8A3FECDD6CFE1770021923C2D2A2C8DD2967DF0770B0DD68A9C9075B4022DD037C93A22F2C671D240CB054456ACEFE773000DD7B28C1CFF5E409207D00044F1C18C617DADCD3402EC016F9CCFB9923CFEC202412B84C3FCFCC23F004B0BEC01B5040818C38EEDCF0EF27D0480DBFD94FD3ED8E7C37156F086EF95CD80FAF522A401C57A3FAB29B0A16D81A71D61F6C1071FE8ECD9B38AC7E3577A2A17C55874A0B258619886860645A351C5623135353529914838BE3FD1B19E9E1E158B45973D818261659843A190CB5692816D6C6C748D892539F099CFE7D5DBDBAB42A1E09A03534B6115D724397A6943438303AA5C0BC74A44165A0DFFCFEFA401874283E1868606076AD93CF0ACECF54AA592AB63209ACC3141D6E89359434383E6CD9BA7471F7D54D3A64DD3DAB56BF5F77FFFF77AF3CD3775F6ECD92BA2163B73E64C3DF0C003BAF5D65B75F6EC596532195D73CD356A6B6B3BE7D843870E3980F8E0830FEAB1C71ED3A38F3EAA6432A9EF7DEF7B3A76EC98274B31D4AC52A92897CBA9BBBBDB51EC020B6C3819808B9AB06AB5EA1AD3F7F4F4B83E7C960E4AFD7CB55A552E9773A5170026EA00A5FEFA46A95F85B3A9A9C96523390E80897F8061435D5EB55A75E00D6005484BA7D32ED06AB3546CF8F14B994CC693ADABABAB737585F81CEAE76CDF40EA1EADD89AD4EFE733998C4705BCBBBBDB534A82FF46F4860C1B195B4B4B85766BFB06523F874FB63ED2AA9F425F95E4095241AF051C516747D611C0CF1E86603001677CBFCDF0722E4231DC87ED5BC977409207BC71AF8052AB068B7E0380CDD633DAEC20FB22E605B38AB1ED18F4B3B4CF8DCCB83FAB6A29B2810D0F0B328923C8CAE5B24E9D3AA5EEEE6E8D1F3FFE4A4FE7A258B95C566767A7EB8388F3A2112F514A498E526A33662C6408C300C00A858287760AD585C551F22A94723D163A69209387F4B8AD21806263EB1971A656C8866C229F158B4557300EE084CE6123CECCD146826D7DA62D1647E995EBE15C02AAC727B7B163C76AC58A151A376E9C7EF39BDFE8C9279FD45FFEE55FEA4B5FFA92A64C997259E752AD56D5D5D5A54C26A351A346E9830F3ED0FFFCCFFF281C0EEBFEFBEFF71CDBD9D9A94D9B36A9A3A343F7DC738F229188264D9AA49933672A9D4E6BCF9E3D1A3B76AC5A5B5B2FEB3D5C88552A15757676EAF9E79F57B158D4BC79F374EBADB75EE9690516D827328014B583CDCDCDEAEBEB53A150503C1E774DEDC3E1B0CB9621EEC2A6BEBEBE5ED96CD6A96E767777ABB6B656ADADADCAE5726E532FF5FB926432A972B9ECDA69D81A3F801920C7D6337677772B168BB97361BA20DCD2D0D0E080A7FF38D83100E0AEAE2E9799648C582CA6EEEE6E0F384594874C1F80909213C47B42A19013E5615E08E69095A36E3193C9385F09584C26932ED044E6D3EF0B6B6B6B5DDF6580AB15F2B1B595D475DA4C5A229150A15070600A1089980DCFC73E4FEA05A3D1A803F256A4C6EE1F10F541ECCEDE2363588068B3ADB409E3738023FB0EE642369AB9DBDA4AFA3EDA761883D5564A72E7F2CE820CE2F0B200248E203B71E284533A4B2693577A3A17C510A9B100118796CD663D34511A0D4325B1D14E165140A05D54512FA3D09F735908FDB4547B3DC9DB175192C719E26488DE014C0185446B39D7525BB816208FE3B99E15EAB1E235F67ADCABFD3D668164601766A150482D2D2D5AB0608162B1985E7DF555FDDFFFFD9F8E1D3BA6871E7A484B962CB96C7359BD7AB5366EDCA859B366E9B1C71ED3F7BFFF7D6DDBB64D4F3FFDB4E2F1B8672EB366CD729B231A6AE7F379D773ADB5B5F59C5E9A57DA7A7B7B75E8D021AD5EBD5AAFBFFEBAF2F9BC1E7CF0415D7FFDF5577A6A8105F6890CD023C9014402776CBC4BA592CB06168B45452211150A05170C65838F680B1B7414312DF5118068B34FB6FC4292EBDB67A9A7D031C9F2E1BF68994066920C92AD87C42FF5F6F6BA802DBD10A14302EA0094F8B7DADA5A97D1E339018028EFB0C73177EE4392CB5EE1F3007556A0251E8F3B80486097BA4EAB3ECEB3A6372E4C1C327A56D9937D86CD7EF2B915CE23B0CDE78034B2816410ED3B0360DA2031E7F0FD21D80CF8B7759D5C9773D99790CD63AFC4B3E6BDF15DB27D9D19C3024F2B8CC3FBB0E53E36F0CE18810D2F0B40E208B223478E289D4EABA1A1C129A70D7763810D87C3AECF108B8EADD1C3A11125631126AA067584481CE07230A119EA03A06B101D631165E1F32B8AF2FFD059ACB21773848BCF226DD5D2009F835DCF66012DADD43A40EA2759AC2D98B5C0916BE3D003EAC727B35028A4D6D656CD9F3F5F7575757AF3CD37F5EEBBEF2A9D4EABB3B35377DE79A762B1D825AB9B2B168BDAB2658B56AF5EADA6A626DD77DF7D9A3D7BB672B99C7EF4A31FE9ADB7DE522C16D3E8D1A33565CA14D5D5D5A9ADAD4D2D2D2D2E0051AD56B563C70EEDDFBF5FCB962DD3A449933CE24E57CAAAD5AA7A7A7AB473E74E6DDCB8511B366CD0860D1BB46BD72E3DFCF0C39A397366A0D61AD8B032D81D921CD0C0C7D89A30823796F608E0629DB7AC1869A0E71CCA991C872FC047401DA4AE1F4AA4A524720C0618B240D2FA4D2B0E63456FF03FF83B2B2007D0C04FF9C7C06CF68BCCA43D0E5F06C8B37E197082288FADF1634EB64E9163ACAFE61FBE57921B83B1A1D45A568EBFBE102373C75C98E3F98470982FFB06C6B0C093316CDDA105D3EC812CB596F5DFD25B99977F2E7E613C9E07CFDD8AD9D8E7CE5CECE73CABC0869F05207104D9D1A3475DDDC150D8F05D4CB3CA9F6407A3D1A80724D9EC1C19477A1B353434781448B986AD1190E4AE678566F88C05D3AAA1517B608568243945369B71B4AD2800B576414550C6CE85EBB151B0C0D12A91B140B329B0A2035669CCCE09871B80C44F6E08292D5CB850B1584C6BD7AED5C68D1B75F2E449158B452D5CB85063C68CB9A82D683A3A3AF4FEFBEFEBE8D1A35AB56A95B66CD9A2952B576ADEBC796A6A6AD2F2E5CBB56AD52AFDEE77BFD3AA55AB347AF468CD9F3F5FB367CFD6E8D1A33D99C2C3870F6BC78E1DAAA9A9D1E38F3FAEB163C75ED17639E57259994C46C78E1DD3FEFDFBF5873FFC41AFBFFEBA76EFDEAD4AA5A2F6F6760786030B6CB8985DD3AD080DC15CFC11A233D4BCE167086CB24EFB056F6A6B6B5D560D6048668B26EA64E6085E52BB879809345680A0AD27B3D93A28A6F82E828C0460AD0228D445CB74019CD86C143E4A9203C47E35705BCF46568F394AF20049DB32C4AE778015EA2F791E36C38ACF27506C055AC8B8F1ACAD82A75F94C7AABE5A9F0B8D96CFB93FDB2E827BF2D7FE854221A7A7C033B075999C63EB0BED7387896401BE05B436032D0DEC8308C873BFBC0FFBECF8DC3F77AEC318810D4F0B40E208B213274EB826B0234DFDCF36ABC551D99E88384C1BD1B2C5D8D0370052506E6C06CED6F7D97E832C742CC62C86B6401EE048348FACA70576D438E284A401474F348FCFB957C604E4F9A9A416F459E068A3AD4426AD63F2AB9C05F6E96DD6AC596A6D6DD55B6FBDA5175F7C51FFF00FFFA0279F7C52F7DE7BAFC68E1D7BD1689CFBF7EFD7AF7FFD6BAD5EBDDAD57664321957DB03FD7ADCB871AA56AB7AFAE9A7F5C20B2FE86FFFF66FF5F9CF7FDED5B6E67239AD5AB54ABDBDBD7AE08107B468D1224FE4FC721AF5485D5D5DDABA75AB9E79E6193DFFFCF3EAE8E870DFE1582CA6071F7C50F3E6CD537373F3659D5F60817D5AC3B7D0E89D8D785757970366ACF7F178DC35BBB759AE6432A9EEEE6E07B82C2D10605453D3DFDBD0D6C641B5B4A02B1A8DBA63AC0A6A7373B332998C033DF8217A16026E18033F4490130A26356C502DF1A18542418944C2F52CB4756BB1584C7D7D7D0E84E21BAD1600544D8EB35939329BB95CCECD03DFD9D4D4A46C36EB289800283F4308E11FFBDEF0FD0494EBEAFAD55DF1EB00A87038ECFA594A03D957846A2CF595B179E7E170D8D3ECDE02311BFCE638FB3CF89C9E871644F2BD223B689BDD733E7D1179568D8D8DCAE7F36E0F250D88F540E765FF64F7378071DB3F13106B6B60031BBE16EC1247909D3A75CA53D73092ACBBBBDB456551198352CBA24CE495858E26BFF178DC0135D4482D858566B5D168D43908167322A92CA4163842DDB040947F442D7130929C1364BE44922DD00330B280E3A8708036EB0988B4423D8301479B6964F341F179508F78716CD4A851BAEBAEBB347EFC78FDFCE73FD73FFFF33F6BDBB66DFAFAD7BFAE9B6FBEF9A28C3177EE5C4D9F3E5D4F3EF9A4A7FE251A8D2A140A69CA9429FA977FF9174FC362A9BF693774A56C36ABFFFDDFFFD5B5D75EAB993367AAADAD4D274E9C50A954D29831635CF0E472188A8D2FBFFCB29E7DF659AD5BB74E1D1D1D1E7183BABA3A5D73CD35FA8BBFF80B4D9A34E9B2CD2DB0C03EAB3536362A954AA9A3A3C365AF10394B26930E20343434A8B3B3D3F937C0577373B3FB1CF0667D0019B64422A1AEAE2EE78BA87B6B696951369B75A0309BCD3AD137B23BF1785CE974DA23585228149C600E608A31AC404B5F5F9F9A9B9B95CBE51C88051420AC430D643E9F77F44FC46262B1987A7B7B5D268B5A45491E2117446000348010EEC32FC442CD2441337C725D5D9DC2E1B013F1410807C0E50FB6F6F4F4A8ADADCDE92200DE6C401835576940C1331A8D2A9BCDBACF69990130F30BE11014B0FA05642343A190B2D9AC873E0A8B0AE049B01A211D802360D8823ACA5B7A7A7A3C995080A415E501F04B03D941F622B456619F6469BB1638063588C3DF02903882ECD4A953E7D02C468A01E2881C02D2ACA04B3E9F77AD3F586CAD300CCE32168B799AE7DA1A0622B314EAB369B6C0D166F3F81927638123D93BA29B36E368E9AA36E3C8C20B4589C82AC7D9561B38409C09F361BE836545B95FC034FF82C5FCB3592814522291D00D37DCA03FFFF33FD79A356BF4E69B6FEAC08103BAF3CE3BB562C50A4D9C38D1D5047D1AE37B733E51AABABABAF3D6EB55AB551D3E7C582FBDF4927A7B7BD5DBDBABF7DF7F5F7BF7EED5C1830775F7DD775FB62C62A954D2FBEFBFAF37DE7843AFBDF69A76EFDEAD23478EA8A3A3E31CEAF3F8F1E3F5E8A38F6AF2E4C9238E421FD8C835DA28A5D3E9736AC512898403880413ABD5AAE2F1B8A78690AC1D1B7C7E07D820EB98C964240D500901A180104044A552513299F46CF051D7A4CD062AE2F97CDEF92AC01B73C117C56231E572398FBA260091ECA5A598E24BA99F2C168B8E1184500C9949E64226CB8AA7148B459759B4F577563087E70368610C02B77CEE07E6925707C1D68E027C00FC96DA69C74081D5FA76F613F86180BCCDF4864221779C55A895064A43C84C02EAFC1947B27E3628CC7DF01D4108C7BE33E6626B0D6DCB0E98265630C78AF2702E4170B2A22335087D25583757CA02903882ECF4E9D39E1E3B23C98874A22E4A5F434B930394597A835573042442D5B19143DB0E83F1006438139C04F58636F266D54D711CB61505C74B72608FC830F7C6B138667FB6D2AAB6F28FDA0D4B61B50ED516B45BA0C8783C339C51609FDE6A6BFB25DC67CF9EADFAFA7A6DDDBA55070F1ED473CF3DA77DFBF6E9E69B6FD62DB7DCA2A953A75EF66CFF871F7EA8B7DE7A4BAFBCF28A5A5A5A74E0C001A764582A95F4E0830F5ED29A44FE2EF7ECD9A34D9B3669FDFAF5DAB06183B66DDBE6321C7EE3593EFCF0C34A2693238E421FD8C8B44824E2697B00ED8EDA3DD67C2BF441BB05FC44B95CF6B43380F582EAA8CD20D16FCFD69A91D1031001BE008B36800978B31B7C7AE24131640CFC230153EA00391FB060C11BE74A03A23C36606AC56CEC5CAC6FB2FED166556DDD22FB1E2B9EC2FCC8C23136EF803D00FE18B37B095BBF678FC7575B71172BD663DB67D8B1791F36BB67A9A8F8653FB5D396D2501E63F518B807FC3DF3633C7CBF7D3716FC5940C7BCAC6A2BDF0D2B1064DF87DDE7D8F29C91667C2F366CD8A05028A4C993270FDA9B78A4580012478001103A3B3BDD1FFC48340B6A008B381F0BDA58F86CE6CD165BE3547082D2E04233FE0C9CA5FBE0902539E0C83C58A42D70B4A08F6BE2E0EDBDF98BC5FDD7B3C0D1AFF0CA3F40328B3A0EC42AB25AAAAA2D580FECB319EFEBC61B6F547B7BBB76EFDEADB7DF7E5B6BD7AED5EEDDBBB567CF1E2D5AB44837DC7083C68D1BA7783C7E596A43A1705ACA26D1F2F1E3C7ABB9B9F992CC831AC8E3C78FEBE0C1835AB3668D56AF5EADEDDBB73B2AD3F9ECBAEBAED3E73EF739CD9933E7AA89DA0636FC8DCDBEED27678557F2F9BC27F33258CD1BA0878C0E192FFE1F7A25222E768DAFA9A9F1502A99137D11990720800C1B3E08BA22BED41E47364CEA5F530060D65731860D52D6D7D7BBEC1720964C286DA8A08972BF640DC9D00144982FBECB3E775B3FC773C7DF533E62154EA9E5E3B9490374533B2749EE3950FB67C7F68BC058C02EC9015D9BD1A35E93FBB0C099EF865584A5D6902030C67B831A6CE70465D7DE03EFC07E37ACE88D34D09A8BB16DB98E5F94872C2EF76085FF46AA55AB55EDD9B347478F1E557B7BBBE6CC99A38913272A954A5D5101B84B6101481C018680051496910A1229A297E422AF70EA018E38056960C3CEFF031C69588F03B0940C165622AF384B6B802A9C340B3D8B291412DE839D935555B50232D60902F4AC1A9E3F72C8F5A8BBE47ACCDD523EB867BFB29A5F1C27B08B6B2D2D2D5AB46891E6CF9FAF4D9B36E9F5D75FD72F7FF94BBDF8E28BBAE38E3BB472E54ACD9A354B6D6D6DAEF1F4A5B22953A668CA94297AECB1C72ED918D6AAD57EF9FEEEEE6EEDDEBD5BCF3DF79C9E79E6197DF8E187171490686C6CD492254BB462C58A00200636AC2C9BCD7AA89AD96CD62302C39A4DC9405D5D9DD2E9B4CB1A0234A2D1A83A3A3A24F567D5EBEAFA9BCB47A35197A5ACAFAF57241271E797CB65E5F379D5D7D7ABA1A1C1013904736C562D140A29168BA9B3B3D3F925326C362B170A85148D46D5D5D5E53E0758A10F80EFA179BD555A8D46A38E766B039A34BB078C318605B1925CFD9DADB393E4A16A22EE62C178B158543C1E573E9FF7306AFC0162FCBF156CB1D93EFC3C5450CBFCA157248242F8723EA72E93B51DE087980DFB057B1C19415B23CABD5A255C6A31095E033601729C6BC19B6526D9529542A1E0E608C045F4C6024C4BBBB5345F5BB6E22F19186906AB6CD6AC595ABD7AB57EF0831F68FEFCF9FADAD7BEA65B6EB94563C78E757FD723C146C65D5CE5562C1675FCF871954A25C5E3F1110B12B3D9AC93A0A6A09BC59D1A095BF06D9D9D553365B1242A4764B0A7A7C7FD71FB812391B47038EC401FD94B1C9334404500CCB2B022D96DE7C13C6DB692C8A115C291E4B22E80440023CEDD6641B906F3210A8D83C6B10685E597DE78F60B162CD08C1933B477EF5EBDF7DE7B5ABD7AB55E7CF145CD9E3D5BCB972FD7F2E5CB356BD6AC2B3DDD8B6250C456AF5EAD679F7D566FBCF1864E9E3CA97C3E7FC1DFB7050B16E8F6DB6F0FC46A021B9646D0279BCD2A994CAA502838164A535393BABBBB9DB80BEA9864CE9A9A9AD4D0D0A08E8E0E552A15B5B4B4A8AFAFCF651AC958711C0011664A5D5D9D13A4017822728268092D333A3B3B3D19230287F5F5F52E905A5F5FEF00A62407B21883CFC900C66231270E575F5FEF44E76C862C9148289D4E3B3A2E63587A26B595DDDDDD0E84D8DA4A7C22594A2B9E829AAB15D5B1B57C56A5341A8DEAF8F1E30EDC0062138984A77E93E783600EEF8A803160BC50289CA3B40A7084168C922842333088005DBC37B280EC556CFDA66D6A4F7280CF25B9EC707D7DBDF3F5BC5BB2D1954AC565106137D96765813465391638DABACEAB4DC9F4A69B6ED2D2A54B5DCFE277DE794773E7CED517BFF8453DF0C003BAFEFAEBAFF4142F8A05207104585F5F9FCE9C39E36A1046A2708D24B790223C83880DB515D691021C719E2CAE44D26876CE35ADF80BCE16AA06113D5B686E8123D4572B8423C9D525487273649EB60E12676595CE88D849F2504CC9FAB1B8037A6DC6119A90AD3BB04D7799BBBFCE03EA6B6017D7D820D5D7D76BE6CC991A33668C6EB9E516EDD9B347870F1FD6534F3DA555AB5669F6ECD95ABA74A9E6CF9FAFD1A3470FBB4864A552D1891327B46EDD3ABDFAEAABDAB163870E1F3EAC3367CE5CF0778BBF8B152B56E8B6DB6E1B76CF20B0C050D34648A5A7A7C7D5C651071C8FC79D3FB01B7CCA16B2D9AC2429954A3981174B1F24D8C8869D6C92CD5EDA2C18F58CF833498E568A18896D1D61FB090216A089E24B612E490334C6783CEE0022D9BC6AB55F75135138943D5122852A49F908F325102CC9E3FB18C332622A958A7BA6F8388011B45B3290EC0924B9CCA40D5EE14BA105DB7D010C265BC6615943BC030022CF0D4069EB356993614B4C10EB01FCD9BA4E3B8615B503849289B45A05F875AB646AFB49DABD03EF9631083CDBFD8EA51BDB8035F77B35594343836EBFFD761D3A74483B76ECD0D9B367B57EFD7A1D3F7E5CAB57AFD6C2850BB56CD9324D9B366D58771C083CF008B072B9ECA272965E39D28CC51F5A297450CBFFB79416227FD463D9E27832815063D89C022E25AF42A8AD37E8EDEDF5002C167F16525B336981A3552CE57E6C460F100BB585E89ECD04321F22AE005D28323858BB80133CB0E74A03CAAC5800122FAD11658FC5621A376E9CC68D1BA7C3870FEBE0C1833A7EFCB8FEF8C73F6AF7EEDD9A3A75AAA64D9BA61B6EB84153A74ED59831633CB5B243CDCAE5B20E1C38A02D5BB668FDFAF55ABF7EBDB66CD9A2743AFD8923CBD04C172F5EAC71E3C65DA2190716D8A531B23156A884AC8DA5795A711836E88037001B42311C47360BD0634552A0B7B2A9874162C7009CE07760CBC0580985421E2116491EFAA95FA0059067055AECD8640DA15DF23C00AE305E980B7ED40AB770BFF833EECF5F2AC1B95694877325B975884C1E73B1E0DA0A63B15FB0022DB65ED4CE11A0EB17C6F16B0858BD00FBFFEC3F008B7EC11CDEB1E415E5B1EFC38EED17DB21706CF705DC23CF94E7CEE78C61EB5C2D5DD506A1C9DC5E8D652B13274ED4D2A54BB57AF56A6DD8B041E9745AE9745A478F1ED5DEBD7BB573E74E2D58B0C0318986A3C0CDC8441357994127B1822623D5004316F8E0DC6A6BFB7B1459C1162B76438690889C8DA25985529C2AD1570BC4380F87E4078E2CEA7EE0289D2B8EC3C26BB38D561CC702382284163802962DF8F347F970C82CEC4472AD72995FB027B04B6F7575750E28DE78E38D3A7CF8B0B66EDDAA7DFBF6E9E0C1837AFBEDB7356DDA34CD9933473367CED4D8B163D5D6D6A6542AF599DA685C2CAB56AB2A140A3A71E2840E1D3AA475EBD669F5EAD5DAB4699393E4FFA4565757A751A346E9AB5FFDAAA64E9D3A621911818D4C631D863E487D18F581B0481A1B1B3D54405B9F681BCE937123F06BD5242967B0226A00417C1C60C1DFE0DCDFF81C4A23FED4B69EB0C7E17F0095B6EF2FF3B375729C1B0A8594CFE73DAD272C70B57450DBA2C28237EE91F9FA839E8C01B8B5C234B418B1BD176DC6CDF61EE65C40A81568B163E067B9772BB6C3FDE167D95B58EA2AD941F66B169841FFB473221BC9CF36306EE76B8569A401A1198E632E3653C8F70FE0C918F6F9DA31302B9873B55A381CD68C1933F4E8A38FEAD0A1433A7DFAB4AB0BDEB56B9776EDDAA537DF7C53B7DF7EBBEEBCF3CE6129701380C41160954AC5D1322C681889562A9594C964542E97CFE98968C115C0110A0C0B9D8D84E2A8719CD168D4393D9CAF159AC161F18FE819D93F1C314EC202471B89B460CE46E5ACC08EAD4BE41CDB48D916E2DB8C20C091EF018E0B90CC71149E5B85B2C0AE8C259349CD993347B367CF562693D1B66DDBB471E346AD5BB74EBFF9CD6F3466CC182D5EBC588B172FD69C397374EDB5D72A128978C4162EA7F5F6F62A9BCDEAC08103FAED6F7FAB5FFCE2173A7AF4A8DB547E5A8BC7E39A33678E1E78E0018D1933E622CD36B0C02E8FE10B6C4D7CA552517373B36B586FE97FD023FD0DE7A18C527367EB0DA3D1A80BC2B0D6170A05A552296532198FCFC247F6F5F59D237EC2DA914EA75D6D5C5F5F9FA3C84283A4242297CB399A27C08AFE899C4B3D1CA0E37CAAADD200B8AD542A8E6193CBE53C544BEA37D11EA0C4C2D6D5597D029B2D2360CC730F87C39EB94803E52B0D0D0D1ECAA90DC2DA402F423356640EC11CCB2242ACC736A2E79D5B1119DEAD3D0E7D045B6F485001113DF619F4CBB4C163ABA500D8B4823B640D2D038AEF1C59639E233D212D85973942650E54D1A5F6F6763DF4D043FACD6F7EA35C2E774E90F4E0C1833A78F0A07EFBDBDF6AE1C285C34EE06668CF2EB00BB272B9EC0AD3477A46086A269152A258E170588542C10147167F0BA26C9D9F8DDE55AB55174D053C011CA1B4FA338E760C0019D7B4C5DE445D89EA1205C2B2BC1C000020004944415405E03536369E437521E3C8DCB81691483600B6DED28AD6D82278E6654128CEC45264F8FC6AA48C0C15ABADAD553C1ED72DB7DCA2B973E7AAABAB4BFBF7EFD7962D5BB476ED5ABDF4D24B6A6A6AD2A44993F495AF7C455FFCE2173561C284CB3AC772B9ACB7DF7E5BCF3EFBAC5E7BED351D3B76CC653F3EAB5D77DD75FACE77BEA3643239A2035D818D6C83E258A954944AA5D4D1D1E136F80414DBDADA1CA803F09039235B57A954D4DADAAA6C36EB8294883FD1B01E054F02A700AE9E9E1EA55229E572390FA5B1582C7A04736A6B6BD5D2D2E26A04C946F5F5F5B9E3A895A4A9BD1F3832F7FAFA7A3536362A97CB291A8DBA7D896DB1200DB45CC05F3306FE9A6C2BB59516CC8442214522110F70A466925A4A32AFE974DA09D354AB559705B4F57B7575754E91D566CEC8D62693494903357AD168D493054675D5F60AB46AACB676D066FEA47EC55AF66D96CE89980DCF0ABF6F4579781FFECC6424127135ACB6BED4EE83FAFAFADC71EC152CFDD86671F91EFA81A3A5545FED160A85D4D2D2A26F7FFBDBEAECECD4E6CD9B073DAEB3B373580ADC042071041899449BA11AA90688492412E764D58822B2A0E37CE2F1B8CBCE4165214A29C9651B2D8545928BE4713D0AFCFD0AA5443D0193CC05AA2A6313A1B4423BD6C1B0E812A58392C3026D857A6CADA4ADEB90E4A95590E411C3E1BCC16A1CA96D0980E29533040D1A1B1BD5D4D4A4582CA6F6F676D5D6D6EABDF7DE53B158D494295374DB6DB7A9A5A5E5B2CCA95AADEACC99337AF7DD77F5BBDFFD4E5BB76ED581030774FAF4E98B46359A3061826EBFFD76DD76DB6D23569D39B0916DACEF647D1A1A1A94CD66DDE69BCC62229170A0CED6FEB1DEB38EA75229773E1BF9BEBE3E2593490F75B1B7B7D789AA00B26C66123FD9DBDBEBB297D42A729CAD3D4325DD8AAFE057F17D800500097E0A054F1B18B5993A4030CC1DFC20008A9EC33670CB3D01F00094B63ED0AAB64A729933DB56C48AC5F81559AD2FB49458FE1F8088700BCF896C22BE1C1553327296C16329C080646980CE29F56716018800C74AA5E211DB01101238608EF67DD8AC1FCF9DA033C7B12790067AE65A311BF624B61ED25268837DC280353535E9AEBBEED2EBAFBFAE93274FEAC48913E71C53A9F4ABD5F6F4F40C2B819B00248E0003245E0D99446960232DC993C9B32A9E1C270D2CFA584F4F8F62B198E7588466B82ED7C349F18F081A0B3FC2029148C4431BB5C0D146F1006796DAC2F5FC8B3BB52C004D3B5FB2831628F38FBA041C0C63D81A0BEECB82572287418470681851F2DDBB77EBECD9B39A3E7DBA6EBEF9662D5FBE5C37DC7083DBB05D2AAB56AB3A72E488B66EDDAAF5EBD76BC3860DDAB871A3CE9E3D7B51458E42A190E6CF9FAFFBEFBFFFB201DFC002BBD806083C73E68C8E1D3BE611ADC10F905DA22F1D6B335940CC02095B8F585B5BEBFEFE0037FEBA33D67740167B027C880531F6387C0B6007EAA3A5705A9040CD257395E4F9DCD6C6D9D654CC853124794468FC6358954F498E1E69EBE72821B1ED22F08F83D5DFD9EC596D6DAD4E9C38E1405BA954D299336774F4E8518FC2B8AD23C4D732363E974C9DFDDCFA7F1BE065BEF6DD92ADB3FB389E2FF7EBF7E7EC2578063C13E6E21F9BFBB0C098E7C3BEC63E27ABC9609FDBE5B0B367CFEAF4E9D32A954ADAB76F9F240DE920627B7BBBC68C19332848B4369C046E029038020CE11AFEB847BA9189B3AA5DD031AC3390061C1E0E0810C5A28E63271A6833707EA119CEF7471D8986724D49AECEC4CEC18AE358EE3F608E632D3D8505F97C42337E05350AE6ED864192C7C158CAAABDDFAB21C0305C2C93C9E8D8B163DABA75ABDE79E71D8D193346CB972FD78A152B347DFAF44B3A764F4F8F4E9D3AA5C3870FEBEDB7DFD6EAD5ABB57EFD7A9D3D7BF6928C3761C204DD71C71DBAEDB6DB06FDBD8D580FF6F367FDFDE518E3628E7539E63012C7B09FD5D4D428128968DAB469175540A25C2E6BDFBE7D3A73E68C0308D48E59A0210D9406D82C170001B0607D8724D72A836B59FF4556DF8213326E6493AC9236B572762E9C4336149F40A6890C9DCD40516F883F468C06700210B4BD0901929217D0D81A38EE1150C818764EF82F82AAD697DABA50E63258FB87DADA5A757676AAB3B3539294CFE775E0C001B79FE27D00ACF82EC102A244459247B0C78EC1FDDAB95B2692CD4EDA77CBB5F82ED832140B942D90E35A762E7EF0C7398C01F893060498D8A3F05DB29F5FAE2C623E9FD7912347D4D3D3A3975E7A49ADADAD43BA86AFA3A3E313D5690E07819BA1FBB403BB60238D7DB5089094CB65576F403B0B6A0FFC193380234E829F0151F4B0A28EA3B1B1D181CAC1144AA3D1A8249DF3876B236CA552493D3D3DEE3336005692DB465FA9A7E0671679C644DCC0023C1C1DCED382611BB9261A68C1298ED43A63CE0BECCA5AB5DAAF1ABA6BD72EBDF1C61BDAB2658BE6CD9BA7279F7C528B172F7635B797C28AC5A20A85820E1F3EAC575F7D553FFBD9CFB46FDF3EE572B94B36A624CD9F3F5F93274F562E971B742C5B3B6CFF9DEFF38FFAC706E942CFFDA4C77FD4BC3ECDB53EE9B997638CCBFDFCD9905ECC77D6D0D0A0499326E91FFFF11FD5DCDC7CD1BECBE572599B366DBA6C9BE8C02EBEE57239EDDCB9533B77EEBCD25309CCD8534F3D75A5A770490D819B575E79454B972ED5B7BEF52DDD72CB2D17757DFA341680C4C0869D51104FBB0B6A2C502F43B9AD52A938E5354BCBF4D37AA0EB706D54BB6A6A0624BD2D70243209B822E3C83156E8062086FA1B19BC9A9A7EF53454CA2CDDC7661C99A39DABD4BFA1873604D0B3C0D10262C99B71AC5607D4D0F88C02751BAD0CECF25AB55A552E97D34B2FBDA4B56BD72A140AE95BDFFA961E7FFC71B5B7B7BB40C2A51A7BEBD6AD7AEEB9E7F4CA2BAFE8C081034EF4E252DBCB2FBFAC3FFEF18FAEFF1BFF069BE347D9A5FEFD67BDC6A5BEFEC5F8FDD53287A6A62675757505BD61030B2CB02165ECE5FC828657CA02903842CCD210AE06238B881A177F5456DC05D9F05C2EE754DFCAE5B227E3C8BFDADA5A4522118F42A9ADF1E45A289472BD4AA5E236B736E348368FFFF7D7FDF1AEA845C400A96440017AD4325AC0280D6430ABD5AA93BD865262C7B354552B68C3F786B94349BA1CE020B0012B140A3A76EC985E7EF9651D3E7C5837DE78A3BEF0852FE88E3BEED0B5D75E7BC928279D9D9DDAB2658B5E79E5156DDCB851FBF6EDD3C993275D7DCEE5B042A1E0699F71B5AC61815D59833A79312D140A69E1C2854A26931E91124A19AC60895592F4D7D52134632994ACCFB6CF1F34425A18701DDA1FD87206688FB6AC82E3ACCFA0E582AD3324400AB57230DA2C195A9EAB55DD84B66933B95604860C70381C7674BDF3D1666DF0D55255AD085CB55A75344DDE8B24E75B11FE2148DAD5D5A52D5BB6E8CC99338AC5629A32658AA64C99E211A243C19539F16EF91C3A2CF3C0CF5BDAACEDCF6829AAF6FD5B9AAC1DC306B2799EF6DDF2BC0856FB8FE359F3BD94BCB459DE139FF36EB98F2B61B95C4E870F1FD69E3D7BF4E52F7F59A3468D1AD274D33367CE68FDFAF5DABE7DFB273E77DAB469BAE38E3BB474E952DD78E38D9A3871E225D71DB8101BBA4F3BB00B36BF3AD7D5623808EAF06A6A6A9CA2A85D606DD60F9118DB90D73A719E25E7D08BCA022C9E33D7A200DF36FE1D8CAA6A15452D68B432D9385E5B7C3FD8426F45702C10B51B03AEC3E6C1D252ADE2991F380600F1F2DA993367B473E74EBDF7DE7B3A71E284962C59A2E5CB976BD1A2451A3D7AF425193397CB69F3E6CD7AE38D379C28CDC99327AF5863E400180676B9ED527CE742A190A64E9DAA8913274A92AB33841942B0311C0E4B92031C6CD2AD980D408BF59BFA35C92B52022305DF60038D5665947A3FFC9C15CCB18096B209DBAE8163A4818034E51356B4A55AADBAFBE57CFF7196BD62F5022CD0F2D73C029A18C73E2B5830B07C98A3240F30E3FD30B6158A397BF6AC8E1D3BA63367CE281289E8FAEBAFD792254B9448243C757C3C379E955F219477C6FFDB676A3F672EF6732B3A64DF87AD21E45C7FCDA3F5EFCC97EF95DD4758011A0B2E2D28E559B14FE0BEAE849D3973466FBDF5968E1E3DAA071E784053A74EBDA48C9ACF6ACF3DF7DC795B600C66B1584C93274F76A2350B162CD00D37DC70C529A6D602903842EC6A141D29168B0E88F9A996D03D6B6B6B1D2DD53A29C92B6283D00C913F16575BCBC8F5246FA1B875B83845A29896E6496B0B166628A7769106C4F9456B2439C788A3C3F959A0C8F5FCAA65D28094B78D5E337FABC81AD8E5B14AA5A213274E68F3E6CDDABC79B3BABABA74F7DD77EB6B5FFB9A66CD9A75496B444BA5928E1C39A237DF7C53EFBEFBAECE9E3D7BD914EB020B6C28D8C5DEF8E25BE2F1B8DADBDBDD5A5D2C161D90233B48EB09491EB003B02B954ACE5FD863E859681B9FD7D7D7BBB20840A1552E95E47AF3A2B6CA71F84B2BEE92CFE73D800BFF9ACBE55C6011DF68855B60D9E0D7F0851C87CFA9A9A971415A1B80650CBF1A276D2B78BE64DBB826F70B0BC68AC058FD019E238AB1B6E63F128938F0515757A7542AA52953A628954A39DF6ED55CFD4238A552C953FF4F96D4024302063C539E3B7B0DC6C04FDB96243683C93DD97E8DFEB93086CD2EB297604E36134BB90E06F0BC14D9F64F62D168547BF7EE555D5D9DA64C99A259B3660D89EC9ADFCAE5B2CE9C39A3F7DF7FFF63954DA5FEF636EDEDEDBAE1861BB478F1622D5BB64C93274F769A1743C902903842EC6AAC23CB6432CE892042E3EF8968238E7CC6028883EAEDED750D796DDF25DB13D10247DB4FD166F36C04B85AAD7AEA5DA0C3D886C97EE0D8D0D0E03616B69E50EA07143818ABA4EA8F94728E5578B51957499E79121D66BE57E3F7E8721BCFBDB3B353BFFFFDEFB561C3062593497DF39BDFD4D7BFFE75C5E3F14BCE0A48A552BAFBEEBB158944148FC7B56EDD3A757676AAA7A767D866922FE4997DDC3197FAF743610EC13DF4AFDB17FBEF8C751F9F448D7C3299542E9773A0251C0E2B9BCD4A922B8FA0713B4DEDF153F436A4A61D7F81DA685D5D9DBABBBB158D463D00311289A8ABAB4B925C19452E97532C16737D15EBEBEBD5D8D8A84C26E36AF7A1B2E20B0197994CC665F408CC46A351757575B960162C04B2861C170E8795C9641C7044C1155A2BA0279BCDBA9FF16FD16854E974DAA304CE3D5133DDD0D0A04824A2EEEE6EE79BF1B7E170D8690140F525E06BD5670B8582A7F553B55A750DE7016696760B90F70344AB18CBBE04D5569E0FFB117A45A22D6081233D0B016F3633585B5BEBEE8367CD3E076AA8FDFE1014608E365860DF87059496161DD8C75B4F4F8F5E7BED35BDFDF6DB3A79F2E4A0C790CD8F4422BAF5D65BB572E54A2D5BB6CCB10E86AA05207104983F3B76B558B158542C16F3504CAD1268381C563E9F778A9038260B1C25B9F359F071F6447D11B1A15E82688FBFC60347C4021D8BC5DCBC2C0D1407C3661CAA2A8093ACA21FE83126EF186A8FCD1046A3510FDD479227E34856948CA3058E967A6A1D726017D77A7B7B75E4C811FDFCE73FD7D1A34775E79D77EAF1C71FD7A2458B1489442E1B6DBCADAD4DCB962DD3A2458BB46BD72E3DFDF4D3FAFDEF7FAFFDFBF70F9B75C452B76D96DF7E7E21FF2EF4DCCB31863DFE935CFB62CFFBD3CCD71E7FA9EEF562CC8F6CD1A5500B86A298CFE7158D4695CFE71D40A4A6B05C2E2B954AA9AFAF4FBDBDBD8AC562CA66B38E26CA263D954A79CE07EC25120927E066B3764D4D4DAAAFAF575757972A958ACB84150A0517F8E438C01F3EC30F62A9DD27BB4766B2B1B1D18D415012700213C53F86054C004C8063B55AF564202D504DA7D31ECAA624C5E371CFB302285B1A6D6D6DBFC600C0D3D27363B1981BAFAEAE4EF97CDE7D47ECF7239BCD3AF574EE291E8F7B409D05C3D677DBE3C840A2A360DF554F4F8FCB26427D059C5AE0D9DBDBEB6A58993BEF8DE300F01CC73E004612EFB0B7B7D731AF983BFB1C32C5B6463CB08F36B2883FFCE10F75F0E0C1F31ED7DADAAA254B96E86B5FFB9AE6CD9BA7D1A3470F69EA2C1680C4116238C0ABC9889821F242B6CFB696E067805EB55A553E9F572C16933410DDB1D790FA379FB158CC4526D934538748D68D08A1ED89C8C26C1544712200522B16C3F5897E9229F4671C2DB065C300D893061C35B4124B55B5620538475BE3289D2BB673A5EAD346B29D3C79529B366DD29A356BD4D3D3A3279E7842CB962DD3CC9933DD77F2721951FEA6A6264522118D193346F7DC738FDE7DF75DBDF6DA6BDAB265CB65F90E2C5EBC58F7DC738F66CD9AE5D9D44B1A74B3CFE7F6BF1FF7D927FDF9B3FEFE629C7735CFF7521FCB1A783129DD5C97AC2120C2D614B226A752294F060AF0460092BA450022F4D1DEDE5E2512091764C4B7F4F4F4B87209DAC8249349D74FD84FAD94FA7D225926C6808E49DF605BCFD8DBDBEB36B564B22C0082560AA091E404706A6A6A3CF791CFE7CF117B8944222E302BC9057B6DCD252019FA664D4D8DA3765A4A2B20DB1FF02473C7BBB2F58CFE3214F617048DC3E1B00375F69E780E1C1789443CC7E193239188BBAE05987C07F1F9F67B515B5BEBBE0BEC3D08685B800838E6387FAD644343837BFFF67B68B39FF67D0C9720E150B0E3C78FEBE9A79FD69E3D7B1C85DCDA608234894462D894F604207104987F91BADA8C45184087F390FA6929FC319229F383321C38514E16763F7094E45135C55858AD6A98759400475BF7210DD40C000659E82DEDD346FB6CD6CFD625FAAF676B27F93EA082666B1F2D709406A8AAB6C631B08B63954A45FBF7EFD7FAF5EBB577EF5EC56231FDC99FFC89EEBFFF7E5D77DD755734A2585353A3783CAE193366E8DA6BAFD5F4E9D3356BD62C6DDCB8511B366CD0EEDDBB75EAD4A94BB6B66432198D1E3D5AF7DC738F03CAE70384838181C0021B0A660389925C664892C707F937FC9217BC019A608AC030B1B565B6368EFA45CB2CB1CAA9802BDBA7D72A6F423D640C1B74B46C19FC0FC00A806995C2A17FDA3150D8C62F5975503B86A57B728C2DC7C03F3206E7DBE3AC1F051CD95A7F3B36EF8B4CAC65E8704D3EB32C20BFB8903DCE823F5BFB67D55959BB2C40646FC273F32B8F33B60DF05ACD044B89B542425667C08AEFD831FC730A1844176EF97C5E3B76ECD0AF7EF52B757676BA67371C04692ED4029038028C0CD5D508128BC5A28B9CC662B173C45D007A96BA6941B534502346313D0B3DD1540BA4A0035AC0E6078E386780210B76B158F40047E660819E349025B472DE1630DA6C250ECACEC90F1CFD0AAF36DB8893C071E26803BB38063DE8F0E1C35AB3668D8E1E3DAAB163C76AE5CA957AE8A1871C356DA858341AD58C1933346DDA34DD75D75D7AFDF5D7B566CD1A6DDEBC59478F1ED5E9D3A72F7ACDE2EEDDBBF5EEBBEF6AE1C285BAF9E69B2FEAB5030BEC721AEB39FE80351A900120CA64326E9DE69C868606477D24BB48760F40525F5FAF7C3EEFB276189F132CADABAB733451EBABC8145AD084AFB10C16983796C2D9D4D4E49805FECC941FAC4057B47E161009C8B3CFA3A6A6C65159FD022DB615089942E8911C871F83460998C3FC823916D4019AF88CC0B01576C37FFB45E500BE805D8EB3EFD68AFAF8C19FAD61B4A23CD657A39E6EE76BDB9D58204B4B135B9EE21FC3AF884AF03AC8207E723B74E890D6AC59A3F5EBD73B86C07011A4B9500B40E208B0DADA7E453540C495307FA64A1A88C87D52F07ABECC81FDC767D96CD6D530D4D7D7BB1A0DA26AD455D8EC1AC0D12A97E220A1DEB008E3B870760047BB1087C361773D0C51011C192014000A85A7542AB9E82E0ED3B6E2B00E80082E9FE1B0AD508F1F3832279CBA24CFC6C1BE275B281FD86737EA790E1D3AA4A79E7A4AA74F9FD6DD77DFAD6F7CE31B5AB264C9959EDE475A2814527B7BBBFEECCFFE4CCB972FD7C68D1BF5CB5FFE52AFBDF69ACE9C39A342A170D11A91974A25AD5BB74ED75E7BAD66CF9EED11860A2CB0E1668010C00DB451C023F573003332F91D1D1D0E84E04313898432998C2479C097152CA1F60EDAA4ADB34364A55CEEEF0FDCDDDDEDFC8CD49FB54AA552EE7C5BC386980D3453B294D44C66321957FB87DF6C6A6A52A150701936C0512291503E9FF7F86234056C8096FD0381D75C2EE77CAE15788392C971D47FA2784EFDA7556AEDEDED75CFD706937926FE20324241921CBB87FBE33E9A9A9A3CAAAFA8AB02622DF5D5EA1248FDACA47C3EEF11ACE1DD428905E0D96032C15D28C0003E80BD0D2E3386D51F80FA8A722973BA527BC7E16AC56251EBD6ADD38B2FBEE8C493869320CD855AB01B1C01160A855C21FB95F843EFEBEB53269351575797D2E9B4F2F9BC7A7A7AD4DBDBAB62B1A8DEDE5EF5F6F60E4AE9180C44363535A9A9A9490D0D0DEE5F6363A3E75F535393FB39954A29994C3A5A0BD41A9C02C091C8196A71802516E04422E111C0B18B776F6FAF7314380F046106EB8948ED21C700466D84B15C2E3B6780030C87C3E7F48B62DE7E70E7AF09C1D94A72D1427F6B90F3651CFDC236443087ABD2E550B0B367CFEAEDB7DFD60B2FBCA05028A4BFFAABBFD2030F3CA04993265DE9A97D224BA5525AB26489E6CC99A36F7EF39BFAF5AF7FAD975E7A493B77EEBC68EBCD912347B466CD1ABDFBEEBBBAF5D65B2F69FB8FC002BB14666B12013DC964529D9D9D8EE9439D5C2C1673C0B1AEAE4E9D9D9D1E8688D4FF77D7D5D5E5A163562A15B5B4B4289BCD3ABF5528141C60229355AD56D5DCDCAC5C2EA79A9AFEF612994CC6E3AFCAE5B2E2F1B8BABBBB3D20A4582C2A954A2997CB798063A95472FB8C6C36ABDADA5A3786CD78715D0B62018830755022474D19DFD9D3D3A36834AA4AA5A242A1E0F185D2409FC352A9A4582CE6981AD42DA2240A50E65E1903D0644560F0ABF842445F6CFB0AC030F59080F15C2EE77CBCF5E1CC5DF2D656DA4C9FCD1AC338E25959BAA8AD3B0448521FE9D72340F486EBB21FB0C011A02B0D94985CAC80DFD5649B376FD61FFFF84775747468F9F2E5C34E90E6422D008923C00089B6E0FA5245E28BC5A232998CD2E9B4BABBBBDD3F1C557D7DBD52A99462B198AEB9E61A45A35145A35147D3B4C230836507A5FEA2F842A1A07C3EAF5C2EE7FE9D3E7D5A8542C13941681C88D734353529168B39D5BA582CA651A34679C4678878E6723917852C97CB4EC58CC515A71589445C460F67627B24413321E3C8824F04D702474B7DE51948721165AC542AB9A82D1151A2B4B6A6D12F344374D182BB72B93C68C6D1D68ED81A47EB2C250520F15358B55AD5F6EDDBB56EDD3A1D387040D3A74FD7E38F3FAEDB6EBB4DEDEDEDC30E00D5D6D6BAA04C341A557373B3962E5DAAF5EBD7EBB5D75ED37BEFBDE7B2079FD6FAFAFAB467CF1EFDD77FFD97A64E9DAAD1A3470775B1810D2BB354FE7038EC80191B74B286004436E8A860C662319789425DD3D69A49FD99453EB77572FED6118944C29561E0ABAAD5AAE2F1B8030464CB28AD60FF8022AB5FA005C11C0014A089E3A47E7FC371042AF193945AD89610B69E1140695B3C21D6038885514306D25F43C9E61CCAA77D3EB6F5832DDDC01FDA5A3C7C22F3231B886F074C5B71194B8FB5823500448E97064019759D16D4F1CE39DF0609081ADBBE918C81FABA1F60A22C2BE99CCC24EF2CB00B3732C6BB77EFD6CC993375EFBDF70E4B419A0BB500248E0003245ADAE4C5A00C56ABFD52C8994C46DDDDDDCA66B3CA66B32E2AD8D8D8A86432A9F6F6768D1A354A6D6D6D6A696951229150241251341A55381C768D6A6DA66A301A29D6D3D3A342A1E0FE9BCFE71D70E4737E678FE3E78E8E0E7DF0C107CEF9011EF9B9B9B9598D8D8D6A6D6D3DC761F81D870565FCCCBDB038035671B2380CA4A6F99D3FE3682939383A5B8BC0F3F1D723F26EA0B858A06845702CE594F9DA39DA08269F0F76CDC02ECC2A958AF2F9BC366FDEACB7DF7E5BD96C560B162CD017BEF005DD75D75D2E533D5C8D48F7D4A9533561C2044D9B364D3366CCD0C68D1BB571E3466DDFBE5D27FE3F7B6F1E5CD57D9E8F3F92EEBE6A05ED0B1212BB3188CD18BC40F0028E6D6CC7B153E23AD3E924D3A66E9A719BB49DE91F6D26FDB69DFED1CCB493364D9A4CED2C0D843806821730600C887D93002140486847D2DD37DD7B7F7FF8F77CF4DE8B10600B2189CF33C358BE3AF77CCE39F7EABCE779DFE77DDECECECF6C7CD0DFDF8F8F3FFE187BF6ECC1E38F3F8E828282313E030D8DBB0FB61A3016B3AD80BD7454A4305E53FE27FBDA98CC64C58B2442F6F431E9C9E4A0241174359515241AE6F0FE4E0245F2060C1BAF7006206303152924B18C8FB2F72FBD4AC973942D15F2DEC0910B8C4D2456D2B5956453C65149FEB89D74F094E6349495CA780DA49AF2D0DC473E93C8FE7C7E1EBCEE7C4EE0B148DF02BE2E093B7FE6BEB98D34D5E1EBF2B395FE03D2899CAD3D52A5C458CEF3E633847467E567C9F7F25A69A39A3B4766662666CD9A8579F3E6A1AAAA6A521AD2DC2E34499C022049E4CD8837AD3B05651C9284793C1E783C1ED54F67301814212C2D2D45757535AAAAAA50555585E2E2E27131E2A04CC4E7F329E2EAF57A31303080CECE4E5CBB760D1D1D1DE8EDED55DBC85E0C83C10097CB85828202389D4E2559A5BB1C03837428E57BA54329833E2B2D9288F13879136630659F8A248EE915470661AE219BCDE53EA5E31D0341FA4C449E8FEC85E01A3C46F9C0209BF52733A1196FC4E3710C0C0CA0B1B1113B77EE4446460656AD5A85E79F7F1E2B56AC98723D76168B45FDED3FF6D863D8B76F1F3EFAE8231C3D7A14ADADADE8EAEA4A3183B81DC46231747676E217BFF805CACACA94845C436332810491E488F76ACA391957584D924633247BACB6A593956030A81424D23D9490DB7106218F49CA230128B2C084266306DB34A4191BDFCBF300A024B58C654C48D230472A708C46A36AAD90953729A335994CAA778F318D71535653292595BE0000D41A5C539266E9762A9D6149CED2153424549234F3B8A4898C2469D2D534DD138084589E43BA298F34C291A335E4B18CE46ACA38CDEAA9FC2EB0F753F6234AC31C4D10EF1CFC5C962E5D7AAF0F655CA049E21440666626DC6E774AA6F176C19B0E6F841E8F075D5D5DE8EBEBC3E0E020868686E072B950535383152B5660C18205983B772E4A4A4A14A91A6F5006CAD96E238155D06BD7AEE1F2E5CBB874E9122E5FBE8C9696165CB87001172F5E54B295E9D3A7A3A4A404656565703A9DB0DBEDEAFDBCA624821C76CBE3E00D5E066A064EFE93720E667E01A860C500C240C85E4B19B4688EC34C20FFCB5E4F123DCA71A4232B83960C840C2032C8727B1EAF0C441A3747229180C7E3C1891327B079F366180C06BCF1C61BD8B061034A4B4BEFF5E1DD55646666222F2F0FCF3DF71CD6AC5983D3A74FE3D7BFFE35B66FDF8E9E9E1E35D2141F4F000020004944415433EE76BF43E17018DBB76FC7238F3C828A8A0A949494DCE533D0D0181BC89E443913301008280926FBD979FFB6582C301A8DF0783C6A8E1E8991DD6E57FD8CECD1937D75243D168B053E9F4F99B4B11F8EE48F3F7BBD5E155748A01C0E07060707555292E48492539229F61DF2D829A9647F1B0994CFE74B217FC0A78EE034EB91666C0E8743496225F962E2946BD86C36E5C84AD9A7AC9EF23AB2FF92647C6868084EA713C16030856449433BC65EE9EC293F1B3E4FF1BAB375439AEFD00486048CAFB372CBEF82ACE2F13C2805951E029CB5C7F615E9FACA354888592994F32149C033333315E197CF0724E33AAE7F764CB5A4EF68D024710A405612EF8424D270A6B3B3139D9D9DE8E9E981DFEF87D16844757535D6AC5983E5CB9763DEBC79282A2A52662D7260FD440565A1959595282D2DC58A152B52DC4BAF5CB98253A74EE1C489133875EA143EFCF043C4E37114141460E6CC99983B772E66CC98A1B2B99294F13ACB5E035A1C9338CA6C9FC16050C1D96EB7ABFD49D9A924EA94BB724D002996E166B35911516666653FAA7C28677F0C1F3CA4690DF7477248122965C1B443D701E5E6F07ABDD8B56B1776EFDE0DA7D389EF7DEF7BA8AFAF476E6EEEBD3EB47185C3E150F3A05E7FFD75BCF3CE3B78E79D7770E2C409F500782BF0FBFBEB5FFF1A25252578E9A597EEF2516B688C0DE43D92B1920431140AA9E49DD16884DFEF87CBE5523158CE1624719404910FFE4EA7131E8F47F5D11B8D464510D9FB4782E9F57A1519A2498EC96452E4C2603060707050C5292643B986AC8251F52215270E87431DBB34E5B1DBED8A384A175439CAC3E974C2E7F3A54825E3F138DC6EB7F21DE079D02447564F794D195F497A78BDD85B294D7548DE6898435510B7E7E7C798C858CCF390D2607E26B2B792F155568A65E58E2EB17C8E90924FB68990D0720D923C3E1F700D7E865255643299548B0BFBE6A4A4563AADEA78AE71BBD024710A202B2BEBB62A89241DDDDDDDE8EEEE466F6F2FBC5E2F62B118CACBCBF1F8E38F63D6AC59A8ADAD45717131F2F2F290979707B7DB3DE9CC36806159C048D25B97CB85F2F2723CFCF0C3E8EFEF477F7F3FCE9C398353A74EA1A5A505EFBCF30E727373515B5B8BDADA5A141616AA0C25252B9494907C92383243C98AA3EC2B90B252FE4CE75569C6333434A49CE2A40C886EAFDC3EBD67922452125B2055FACA0C6FBAC32B2B8E9224CA81C91AA9482412B87EFD3AB66FDF8EC6C646CC9A350B7FF4477F8465CB96A9BFC7FB09FCBE984C26D8ED76BCFAEAAB58BE7C398E1F3F8E5DBB7661FFFEFDCA6A7F34D0F867EFDEBD983B772EE6CC99334E67A0A1F1F94002949595A5AA4974F024310B85426A5C030917AB3B369B4D112E39A6C2643229424802246382AC407266A2AC8431CE707B00CA1D938940561C49CAA882499741CA0A296346BAB327EF7D24984C543226930CB1C246E31E8ED6E1F9B2AA26FBE71D0E8772EDE4F5617590CF3EACA25299230D85481065BF2163303F43EE97D53C008A984B62C6782A493EFB35A5E90D0925DF4BF2C9730586475AB102293D0FE476247C3C27594194D255F9ACC2CFE94E541D1A1A8026895302CCEA99CD6695859388C562F0FBFDB87EFD3AFAFBFB71FDFA7598CD6614151561F1E2C5282F2F476565252A2B2B51515181E2E2E29466F6A908CA558B8B8BD5CD76FEFCF9A8AFAFC7B973E770EEDC399C3F7F1E67CF9E45474707CACACA50595989F2F272155881E18A256FC2048307033480117B1C65C51148ED1F943D1D246D3C56667459A164D00190B23F923E4906F93BEE47BAB049631DEE4BE34644221174757561F7EEDD387FFE3C66CD9A858D1B37E2F1C71F574EBEF72B4816ABAAAA50525282DADA5ACC9A350BCB962DC3B163C770EAD429B4B7B78FAA78F0783CD8BF7F3FAAABAB5153539332AE454363A2429AC711D16834C5F95A3EB0B3C24612C13E3CF61A921CB00A460750697A232B4823B537700D198BF85ED9132F0D5AA4018D7CBF3468E1B9481318B9B634CC19C9A085553569CA43B2CA44A93C16B91DE326134EDC97346E617C24E4EB721495ECE997C70EA4C63FAA79A4298F2488F2FDF25AC9589E6E6623C76C48A399F4ED641F29CF25BD37511EBB7CAFF41FD0C95E8D3B857E029C02E04399D3E95424915205BFDF0F8FC7A37A0CB3B2B25054548479F3E661F1E2C578E08107505757A702CCFD08DE5069C0B37AF56AB4B7B763FFFEFDD8B3670F2E5CB88093274FA2BDBD1DF3E7CF475E5E1EF2F3F3553697FD82B272C46A9E24760C6E0C007C50A0F31BB3AC23F50FF233E66BAC564AE247398F7428E53149A73A39CA433AA1313801A9C1482315A150086D6D6D3874E8100E1F3E8CFAFA7ABCFAEAAB58B366CD949A8F341630994C282B2B436969291E79E4117CF2C927D8BD7B378E1C39824B972EA1B3B35359DCA7E3DCB97378FFFDF7F1F8E38F63F6ECD953CE5A5C636A81F766D99F46D2C37B33890BAB6DD21994330F65858D3181A327586193DB31B147B229AB59D230876B3389CC9840A2295D4D81E1FEF9F424A674E12401E236B27F8EC74789A32459D2D594FB96E678D26886D756265BD35FE71AE9A63CACB091D4A59BF23046F299899F8594A8CA8A1E8F9171936B73F484341AE279705F947F329ECBEF886C3F91DB11728D74C31C696623C9A5BC0EE9233E34346E179A244E21E4E6E6A2AFAF0FC160107EBF1F5D5D5D686D6D455F5F1FB2B2B23063C60C6CD8B001EBD7AF475555D594AF167E56582C16D4D4D4A0A6A6062FBCF00276EFDE8D2D5BB6E0A38F3EC2E9D3A7515B5B8BC58B17A3B2B212369B4DCD6CA2EC83D95312370037045966344732C7217194153D0029D94F0619067FAE410739D9A720EDB2650FA234DB914637005288A3AC62DEEF88C562B87AF52AF6EEDD8B3D7BF660F5EAD578E38D37B068D1225D751D05191919703A9D78E28927B07AF56A9C3F7F1E5BB66CC13BEFBC836BD7AEC1E7F3DDD0FB1A0A8570F6EC59BCF5D65B78F3CD37919797A7AB891A1316925C300EB07F8E83ECE5DC3F4A30E5C0799AC3909070DE21C99BCD6653BD7C245A914804D9D9D9F0FBFDAAEAC4849FD3E9547186A33828BBCCCACA42201080DD6E4FE9AB339BCDF0F97C00A05CBB43A19092834A02C67E7C1ACD30A650E6C93558E92381B25AADF0F97C294638E9ED0D06834119B9C85E3EE932CA6B9DEEDA4AE92BE754324E32A9CBFE49BE17188ED1247BE96345A4410F632F0D73645C654F219D5619DF01DC4094E53C64125A6E275D5F294595FDA334CCE11AFCBED10C87F253EE47C7EFC90D7E7EE31D03F553CD14424141019A9A9AD0DCDC8C4B972EA1ADAD0D3366CCC08B2FBE8875EBD661D1A245703A9D4A1EA9716BD8ED76AC5DBB16F5F5F5387FFE3C7EF5AB5FE1F7BFFF3D9A9B9B51555585A54B9762E1C285CAA98C9540F61548A2C721BCBCF60C46B242128FC755AF08831BB3AA7C3FF741D991DC1F89A094A486C3E114C90F0395CCC64A431B0906CB48247247AEB95315CDCDCDD8BE7D3B5A5A5AF0C52F7E116FBEF926CACBCBF5DFD31DC062B160EEDCB9A8ACACC4A64D9BB06DDB366CDDBA150D0D0D08854229DB76747460F3E6CDD8B061031E7CF041381C8E7B74D41A1AB707399B2E3B3B1B838383292A91783C8EDCDC5CF8FD7E556D63DFA2CBE5522A111AAFC89E4412491AD2D0C1D3EBF52AB92209667676B67241E57D9DDBD3059595456998E3F3F9904824E076BB118FC7559B44381C5671887D850E8743C50612A8603008BBDD8E4422A10C736425932EA8E9F24D129A783CAEB6234194A3BDAC566B0AF164A2D56834AACA2D0D73187F49F66C361BFC7EBF8A772465369B4DBD26FB26DD6E3700A82A1E8DEA481C83C1A0DA9E953A127E692AC79E49923D3982829545268F6D369BAAF6B28A2C8D83F819C8711FBCBE56AB35A532290DED34262FA4DBEF78ABFEF493CD14C2B3CF3E0BAFD78B868606389D4E7CFBDBDFC68A152B50555585C2C242646767EB4CFC1D829947B3D90C87C38169D3A661EDDAB5D8B56B171A1A1AB063C70EB4B6B662C18205282E2E06001530E940C69B356FF2E9C4118092A6029F36AE33A8B30F85818E7250066A664DA5D18CCC6A92E449E90A33B2B2E228A5AA3C6FD997C8607ABF62686808972E5DC2B66DDBE0F3F9F0DC73CFE1B5D75E434545859EE57787E003A1DBED86DD6EC70B2FBC80C58B17E3D4A953D8B56B17F6EEDDABC6EFC46231747777E3473FFA11BEFDED6F63C18205F7FAF035344604EFC14CF26565652922C8EA0E2B8B3470920FF2D9D9D92995254A475965E2FDDFE572A590089237ABD5AAF645A2227BE362B1189C4E2762B1584AAF1AAB520094510C4776F01849D2A83E629F2509260DE22291086C365B8A610EE703736E231F76A55BA9945AB28F90D250263B6998239D3D4930792C326EF23E23553E92BC31696AB7DBD1D9D9A9622B553E52B2994E1079DD18D779AEACECCA5E4700CA3448F64CCA2AA5ECADE467CBF82C1DCA815482291312B252CCEB79A7B36A352626BABABAF0C9279F60E9D2A5282C2C1CD7B6164D12A710EAEBEB118D46B168D122381C0EAC5EBD1A151515BA4F6A0C406BF03973E6A0F2FF1FAB515D5D8DFDFBF7A3B1B1111E8F07B5B5B598316306F2F3F353881A032CE539B21F4312479244E94E2A9D47F933C18768664E999596C411189EDBC88718D96792DE33C975B98DCC42DFAF0887C3686F6FC78E1D3BE0F178B06AD52ABCFCF2CB98376FDEBD3EB4490D3EC4959595A1A8A8083367CE446D6D2D962E5D8AA3478FE2E4C993686D6D452814C2871F7E88952B5762DAB469282C2CBCD787AEA17153C8CA10A5A4E9062D34AA0190223D25E90186898E34564977D7645FBB6C1D21B920E1E2FFCBBE48921356A500A88A155527DC4E56A980E17E75BE47F6364A7318F62A92E001C3062DB24F8E048E1544B91DAF17CD6C64558C248B714AC65B5655A53BB8EC734C377719894CC9BE4592556EC36B40F22FCDE0D27D01786DA4518DDC2FB7938640D26995C7CBCF96F15A2627E51AF2FBA7FB10A70682C1202E5FBE8C9C9C1C653C69B3D95050500087C371578B3F9A244E21E4E6E662DDBA7558BB76ED4D473F687C7ED86C362C5DBA14D5D5D598376F1E7EF9CB5FAA998B8383839833670E4A4B4B95E5B9BCC1CB51140C7ED2D18D1941E92AC7DFC9EA9EAC2C4A7929B387D29466A47E441251796C3298F235491CEF47442211B4B5B5E1E38F3FC6B973E7F0F4D34FE3C5175F447D7DFDBD3EB4290583C180C2C2424C9F3E1DAB56AD4243430376EFDE8D43870EE1E2C58BB876ED1ADE7FFF7D545454203F3F5FDFDB34261C788F94D52F2A4964652A180CA6DC7F65D5319D0CC9042FC994ECBF63128F553C121FCEE193552A39B6424A2B296325F1906B305E504ACAD113F29C48D24844E57C3E698CC34A1AE391AC4012E96B48776E39E683645A4A2D69D6C3FD480750C64A99F0249962E5573E68CBDE7F392F52123656EB58F12479E3DA9264730C8594954A67526E27ABA100D477231C0EABE3909557F65902C30AA674D591C6E4055DD4CF9E3D8BCECE4E7CF2C927AA9F3827270773E6CCC1A2458BEEAA9A4947DA29062D7D1B3FE4E5E561EDDAB558BD7A357EFEF39FE3E73FFF393EF9E41334373763CD9A35A8AEAE86DBED56B30D49D264000290D2EBC7E0C70C6DFACC4349F4D8EBC140CC6DD89320B3BB52B604E00617553E5CC8FD03C3EEA652A273BF201E8FA3ABAB0B070F1EC4AE5DBBF0852F7C015FFBDAD7B4E4F12E82B2AED5AB5763C58A156A66E9E6CD9B71E2C40934343460F1E2C5C8CFCFBFD787AAA13122A44CD4E1706060604055E768B662B55A110C061549F2F97C30180C290EA5346EA16BA7C16080D7EB4D19759199990987C381C1C141150FE8E6E9703810080414D1E1F07939AF8F4638E96636B20581154CAFD7AB4821303C13520EACA7DC919253564CD93FC7630F0683C8CACA4A19B561B158941C94E7128D46E1743A552FA694E7D23087E48DC7CAF68A603078C3507B3AC34A231C6902040CC73A124F568425A92381A66B2B636F565616CC663382C1A07A9D9F07893289243F5B6934C34480247C9C9929CDEAA443AE7C9EA07F802688931BFCDE5CB97205DBB66DC39E3D7BD4BD23373757FD7DF6F7F763EEDCB99A246A684C54F0E6FFD24B2F61C99225D8B16307DE7AEB2DFCF0873F447D7D3D1E7AE821CC9C3953C984A49D3803A1CD664BE953602658F639B0C783D549065CE978CACCB16C98E7C3007B0A29F161106750028633E09228325071BF6CBCBF1FD0D7D7870F3FFC10478E1CC1C30F3F8CBFF99BBF416565A5EEEB1D27180C06D4D4D4E0EB5FFF3A5E7EF9657CF0C107E8E9E9C1BE7DFBF0FCF3CFDFEBC3D3D048814CFA99CD66188D460C0C0C28424212E072B9303838A8A49574DA74381C0806838AF4381C0E78BD5ED5CB278955381C562A93C1C141950064CC703A9DF0783C2ADE9028D1CC86442C1008A8B607008A3491989158F9FDFE14D3B3442201A7D3A95C50A5298FDBED56233A481CE3F1381C0E071289843A5F97CBA5B663B54C9ABEB15792554E12B3482402A7D3A97A3119BF86868694614E7ADF22E32609A294DD52FACA4A30CF8304538E18912670ACEEB13AC8F84BB31ED97768B15894332C4D7948FEA52288849A04535665258924E197895BBAB6DE4F89DCA98A582C863367CEE07BDFFB1EDADBDBB166CD1AFCE99FFEA94A2201504584BB6DE6A649A286C6E7049BDF6B6A6AF0D24B2FA1AEAE0EEFBFFF3EF6EEDD8B6DDBB661DEBC79A8AFAF87C3E180DD6E4F91D030ABC8070C4A55AC566B0A4164B33F0015B8D29D4D65FF22F7274D72D2DDCEB80F4A601914A5CC48DA7D8FA7A3D6BD041FC8DE7FFF7D5CBC78114B962CC11B6FBC81CACACA94E1CC1A7717FC7EBB5C2ED8ED763CFDF4D3F07ABD7A748FC684067B84640588CA10BA879254512E4882C8F1472693098140409132121ABA8C52924837603E3CB2324952C78A634646065C2E9732A6E131490926B7E3A80BC61B2A53EC76BB222DD269958486E74EA22213951CC5C1D9BE369B4D1144D92EC1EA2089238F914499718A04514A3BF95ED9932F7B3F29E5948EAA72CEA01C3120E5A224E0ECF164EFA8246FB26A284D7948EA584194FD9FBCBE3C0FAEC1982B4DE5F8D9F2BDFCCC791C24CF9A204E7EC462315CBB760DFFEFFFFD3F1C3D7A14EBD6ADC3CB2FBF8CC2C242F5F70CA49A1DDE4D6892A8A13146309BCDA8A8A8404141014A4A4A505151810F3FFC108D8D8DF07ABD98376F1E6A6A6A5224A7D168543DF44AB39874A2C7AC31899E9499F2418319510645491C65C591C4317D9E17FF51BACA404AE9D3FDD0974882B877EF5E9C3E7D1A353535F8F297BFACE720DE63646565A1A8A808D3A74FBFD787A2A1312A284F242990E662243174A2E4BD3D168B211A8D2AD76A12253A7E52E649E2020CBB6BCA714BBC5F73A48574D024B9914429DDF8856B90A03016705F04E30EC91BE311CF9DF237D9632F09268F911537B99D3482E11ADC17639834B3616254923F3E4CCBD98900527A02A5C18B4C8C12249EB26F909FAF742595FD883C167E1EB23F50CE90E476D23F20FD182589E5DADC869F61FA7380C6E4C7C0C0000E1E3C887DFBF6A1A4A4042B56ACC0ECD9B35392FDE309FDD4A3A131C6B0D96C58B4681166CE9C89E2E2626CDDBA158D8D8D4A9A53545404A7D3A924483223084065938161E2C8CA62BA54950187A48E0F1432B050A62A49A7DC075F934601527AC3E0CBE399CA6431180CE2FCF9F378EFBDF750545484679E79066BD6ACD1047182E07EA9666B4C5EC8FE3B6966237BF4787FE67D85124593C9A47A1269C44262C5EA2467E10150E44656B9E4FD9E4483EF6502916443BA70322E4422911B8E9D124729A3A4C90D4734D10446262449A6D8E7C8F3A5A41218AEDC710DD97F272B6C00D4B9F27549B8382F513E44D3D00718762B951548EE53BA8B339E725FACEAB16A28AF29AF03AB7B726DE99C4A92CFF390319ADB710D4910590DE53302DFCBB5A54992C6D4407F7F3F0E1E3C089FCF87F9F3E7A3AEAEEE9E7A8DE888ABA17197E0743AF1F2CB2FE3CD37DFC4238F3C82E3C78F63E7CE9DB87CF9B20A08340B9019D250288468348A5028A46435325BC80C220399C5625183902579E40343381C462C1643241251F21DDA9D33C84AE24803058BC5A232DD7C0898CA6469686808ADADAD78F7DD77E1F57AF1CA2BAFE0C9279F5433C4343434346E062957640F5C241251324D3EEC936CB00A170804909595A5FAECA4490A474F24934945F218036888C6C1F2B23A27FB16F95EC607BE9FFF4FE22AB763658BDBD0ED54F6CDB3074ECA52D97F2749702010008094BE471AB7A46F47E92409260D7E785D4994D853CFD8250D6800A82AAEEC8D24E122E926AC56EB88662F722C09E5A7AC7802509F27E5B8721EA5FC3CB2B2B294690D90EABC2AE5ABF23980E7C1EF0289AB24CDB222AC3175108D46D1DFDF8F442281DCDC5C389DCE7B7A3C9A246A68DC4564666662C1820578F3CD37F14FFFF44F884422D8BA752BDE7BEF3DF87C3E58AD56188D4658AD56D86C36582C16381C0EF53041C2178D46110C06E1F7FB95B9018725331BC9A06A329960B55AD5BEE9F6060CCF6C0C85428A38D22487839C491C655F22B3DC53D93DB7B5B515FBF6EDC3F9F3E7F1677FF66778F4D147919B9B7BAF0F4B43436312C1E572A9AA9ACD664320105044CC643221180CC2E57221128928F31387C3019FCF9752A10B87C3C8CECE56F768928B6834AAFA1E83C1600A2161C290B185F77583C1A04C60B81D0926492C8907090DDB20E8C24A62633299D41A729C05892E492F00458C2889A5C4D66EB72B420A408DA1A0AC95C9499FCFA7E21B6392D3E9543D97523EEA703814916365518E11218925C104A08C66244822E9DACA7349241270381C296636AC009238B2DD83A493D5482665193FD967190E8753C66670E6A55C83C902494E65DFE25456F6DC8F70BBDD98376F9E32BEF2FBFDF7F478A66E5940436382C06432A1B8B818EBD7AF87DBEDC6FFFDDFFFE1F4E9D3E8EBEBC39A356B505C5C9CD2FBC001C8ACDEC9DE101930F960206532E9038481E19988D2E21B4895C650AACAFDB0C7910F057CCF5495FBF5F4F4E0E0C183B874E9129E79E619AC5FBF1E45454553F67C353434C616BC479288B10F90BD6D0054DF212B862443D16814F1785CA916F833F745439A48240287C3A1B697F3F548EA584194B31A59A9A3390CDF23E5ADAC1A462211D54BC935481C495448EA4880787C2494D2204D562099FC4C97AED2D9936498D70A8092DD9270D19D55F6F1D9ED76355F91C4511AE1F05A5B2C16557594DBC9442A632B80942A1E0D73E45C43567A79AE3C266928433297BE9DAC0803503FCB911D24E624CFD2448EEFD7985A98366D1A9E78E209ECDAB50BE7CE9DC3AF7EF52B5CBC785155C10D0603E6CF9F8FF9F3E78FCBF38926891A1AE300A3D188A2A222AC5BB70E369B0DDBB76F47434303DE7DF75D2C5CB81073E7CE456E6E6E8A498034B8A16445F64F30E3CC40CBF73068F37752D6C30719EE8BFF4F29A974CFE24306FB27A6A2C369329944381CC6C18307D1DCDC8CAAAA2ABCF6DA6BA8AAAAD24EA61A1A1A770CE93E188BC552881F118D4653E4FB723BD94E40131829FF946EA7AC66C94A162B69AC0C4AB26AB55A53AA6F922C4A2754EE8B5535F6BFF175122B69BC42124352275DBC4942D3D7960EA2726D39F3908489EFE5F9CA714D946C4A83351AE1A49F87ECBBE71AFC1918EE49947D99D28046CE4B942341483C99B89549D8F4ED788ED2E047B69CF09A32F6B335449AF26882383561369B515454849A9A1AB4B7B763606000A74E9D0230ECA45F5A5A3A6E15644D123534C6116EB71BEBD6AD436161215C2E17B66DDB8603070E201A8D62CE9C39C8C9C951D95CE9DE467990B43CB6582C2AB0C8070BD9C3C800CBC023C764C88C287063C51118AE1C3270A66770273392C924229108CE9C398343870E21373717CF3EFB2C1E7EF8E171B196D6D0D0983AE0439BBC6FCB01EE00147923C1E07D9A553CCEBF639F1D2B74B2E2C5F985D26C45AE4122291D51490439EB0F183656916BB0F2289D48012862260D7308EE8784569221C6199E13D790666D245DD27C87D78AF25A39F3501AAE317E315ECA6362D5511AFF703B7E5652CE993E0243F646F2F82479E3761C4F25153F9248CA1115B2EF504A5125C19426723C475691B8B6EE439C9A482693E8EFEFC7A953A7505E5E8EF9F3E7ABBF157EBFED763BA64D9B366ECF289A246A688C338C4623162F5E8CCACA4AD4D6D6E2073FF801F6EDDB8740208055AB56C16EB7DF34A30B0C67A4653695194906344912D9D3C82C25A52FE9194B064F063C19ECA4135C329954FD8B9319434343E8EEEEC6E6CD9B118FC7B17EFD7ABCF0C20B9A206A68687C66F03ECD3EB981810145C4A40494C93B560706070753E6FE0150FD7700944C1340CA40789BCD9632EC9E84C4E572A97E4893C9049BCD06AFD79B124B128984DA4E8E6FA0BC920493324D56DEE8444A99A7742295C48CC722E7274A73359BCD86783CAEC85BBAFC933D97248854D4F075C63629DB25C90A0402C8C8C850EFE7EF787D797C3E9F2F857093D086C361651A44F246A24CC22665B752CD4343201E0B9D57492433323260369B95F10FAF078F979258F95DE0F5D14EA65317C16010274E9CC0CF7EF633FCC11FFC01962C5972CF7D113449D4D0B847C8C9C9C197BEF4254C9F3E1DFFF11FFF81FDFBF7C3EFF7E395575E51AEA7E91947F68FC8EC240D65E44C4482D96ACA8C9801E5F80DFEBF94AA52A2040CF764C820CA195F931DD7AE5DC3D6AD5B71F5EA55FCD55FFD159E79E6193DA85D4343E33341F62492B0793C1E45084886689EC2B11706830183838337C82EB3B3B3E1F17852884D2291404E4E8E2240269349397832B9188BC5528C70CC66330C0683229B244DC964124EA7538D6662DC181A1A427676B6EA616435321E8FC3E170209148A8BE451AB448524782C91863B3D9100A85524C79481CE9DE4D8249B39F4422A1FA16498C781E2311473A9932711A0E87919191A14C6A24C124F9E376721C068094D15472A83D9D56A54498B1551AD5F058783D655556B682B06A2C9539748C65B29795498E3DD115C4A98D03070EE0A38F3E427D7D3D962C5982ECECEC7B7D489A244E16F8FD7E1C3B760C7BF6EC4919DE3A73E64C3CF2C823282C2CC4EEDDBBD1D4D484C1C14165F7FCD5AF7E15A5A5A5537A74C16445666626EC763B56AC58816432892D5BB660DFBE7DF8E94F7F8AA79E7A0A252525EA2142060DD93FC8E0C66679066C39232B9DE401500F2EB24208404959B83F3AE7C9F95353E1BBD4DEDE8E03070EE0ECD9B3D8B46913D6AC5983A2A2225D45D4D0D0F85CE0FD9795371ACD9020A43B7B4A0750590923A9933DE12E972B6524040990D3E954493F3A7BCA21F19C5D631600002000494441543443B1DBED8ADCB032C971116C29A023ABECBF23F12451E531C961F73C0FA7D399329E82894D26E0185748ACE45887F4B11372A404D76045564A655989943303295165D5906B90B0CB35A4DC94D796E48DB25D560D01A4540349DEB88634DF21E1A7210D632893AC72162693BEC0B06287DF27AEA19D4CA72EBC5E2F1A1B1B71FDFA75BCFEFAEB70B95C13C20362F23FEDDD27A0FB97D168C4C58B1771F2E4492493493CFDF4D378F4D147017C7A033D78F020060606B068D122646767DF400E34261E727272B072E54AD533F2DE7BEFC16432A1BEBE1ED5D5D570381C29995060B897421AD03003CA20CA07016661491CE5680BE974CA4CB6248C00542655BAAB4DE660E5F57A71E2C40934353561FEFCF978E9A59750535333A5C77B6868688C0FA4390BE5942408240504EFA9AC7849D74C12B0748316921EE9BAC9FD905C48A9A3AC52F167192F48C00028624489AA74DC96AE9D3C46BE97248B6B703BFE8E0491EBF318E54C4626BFD3CD6C649B0589A7EC4D94D53539DA82C728D7486FE120894D377163BC930EA33C46EE27BDC7525604797DF9B9C963E4CFECDF4C6F0F21C194445513C4A98FF3E7CFA3ADAD0D369B0D95959529C647F7129A244E1298CD66CC9A350B76BB1D870F1FC6C99327D1D5D585B6B6367475752137375749536A6A6AB06EDD3A949696A2A0A060C46C046DA119C834EE2DB2B3B3B172E54AE4E4E420140AE1E8D1A38846A3181A1AC2AC59B3909999A986DBCB6CA6247AC030F1E30384248E949632F8D2BD4D561C2549E45A0CC632484977B8C984783C8EA6A6269C3E7D1A66B319AFBDF61A1E78E0012D33D5D0D01813C81EB2ACAC2CD5F3C6445D2814520A0DB607B08A241D39D3470FF1BDDC0F0055E5F2FBFD2AC925D7E7FD598EA890A48BE3312889CCC8C8502334A4410BA5A4E9A63CAC46F23CE4768C19B2DA47E243124BD2252BA07C9DE07BF973BA110E2B8A9244921C4BB24962C94AAAEC05BC59325DCE4294E48D0FF034B3E17A3C1692455939A47496AF93C4CA99878CBF3C76AEA131F5D1D2D2829E9E1E4C9B362D256174AFA149E22441565616DC6E37DC6E37E6CE9D8B6BD7AEE117BFF8050E1C3880BCBC3CFCF11FFF31B66EDD8A050B16E0D9679FC59C397346DDDFF5EBD7D1D7D70783C180BABABA713A0B8DD160B3D9B070E142FCEBBFFE2BFEFAAFFF1A7BF7EE45381C86DD6E477E7EBE32A891D25266723332329434550631996995D94C066C391391F6E50C5023F53802C355ED482432A99AE8138904FAFBFBB16BD72E78BD5E3CFFFCF378FEF9E72784A4434343636A40CE03F4783CC8CCCC5443D865DF5C3C1E57BDE73E9F4F551D29EFE7C07A69EE623018545F1D4999D7EB55A48C725029AF2411F4F97C6A5406AB6476BB1D1E8F47DDE349DED833C93820CD686495D4E7F329F76D9AC59034516A69B55AE1F3F9546C222974381CAA7F93324D002972508BC5A2B621418D46A34AB24B7229CF89B18FF25ACE36E431F17865EFA19C39C8E42A9D56A5290F7B316984C3E46D24124949DA52C2CBCF53CE5BA4FA271C0EA7B8C1D27C87AFB3DAAA717F202B2B0B030303F0783CB87CF932CACACA60B55AEFF9F3897E3A9A84C8C8C8C0D7BFFE753CF3CC338846A3F8C94F7E822F7FF9CBA8ADADC5934F3E899933678EFAFE643289DFFEF6B7F8D18F7E84B367CF8ED3516BDC0E0C0603727272F0B77FFBB758BF7E3D3A3B3BB165CB16D50FC1B97E814000914804D16814A15008E17058113649F2D8706F329960B55A61B55A61341A538607B38F23140A211A8D221C0E23140A21168B29175306762955BDD737AF3B452814C2E6CD9B71F5EA553CF6D863D8B469D3A43B070D0D8D890956ED9C4E2700C0E7F321333313D9D9D90887C3AA6F8E953187C301000804028A1450C24902C68A23D5200E87436D0F40B963CA5E3EA3D1A806BF338948C315B61F984C2698CD66783C1E456C58BDA0A32AAB5DACBC91E8029F5629FD7EBF22430094298FEC63E77632E9C86B444756CA3193C9245C2E97EA9FE475A2DC151896AEB297528EC9E0710150125E6E27E72CF23CD2AB7804492B8F437E66F2F32091970491EFB35AAD3798CC49792E2B9024A41C8142F2CF983CD9943A1A9F1D55555570BBDDD8BF7F3FBEFDED6FE3BDF7DE435F5FDF3DFF0EE84AE224456E6E2EBEF4A52FC1E7F3E1BFFEEBBF70FEFC79BCFAEAAB70BBDD37547ED2D1D0D080E6E666F8FD7E9DA99A80C8CCCC44515111366DDA048BC5822D5BB6E0EDB7DFC68B2FBE88B2B23295356610664F034753488752662E652F09306CAE409224E54B04EDC5657F45FACC9EC9828181011C3D7A14870F1FC6BA75EBB07EFD7A141616DEEBC3D2D0D09822E03D9484908489093C696C22890A2591914844C9DE43A150CAF07A9208124492082601B9067D0B286965254B8E5620E1A203A8C1605031C36030201008A8B8C06A202B77B21F91D536B99DCD6653925160582AC9AA1C0993AC2092A0710D60B837321E8FC36EB7DF6084C3B565B58D7D9D00D475A63A86648C9F0789238FDD62B1A4240C49D85D2E57CA67204D75A4DC95A49D3FF31859D92441E4F672BC85ACE232114C89ABC6FD83DADA5A3CF1C413E8EEEEC6A14387D0D5D585EAEA6A2C58B0004B962CC1A2458B90979737EE896D4D1227297883B1DBEDA8A8A8C0D5AB57B177EF5ECC9C3913F9F9F9EAE626118BC5D0D7D787BEBE3E15343426260C0603E6CC9983E79E7B0ED16814BFFAD5AFB07BF76EAC5CB912D5D5D52AA8A5CF3064C58F818681397D26A29495F2E1469AE0F09F7C0F301C3CE56B131DA150082D2D2DD8B3670F2A2A2AF0E4934FAA21B51A1A1A1A63099216923C4A3EA55B26C90D0922091EEFAF94F9CB841F09107BFAE45885582CA6D42172C6AEDC8ED53D494248DE648F1C1DB2E5B07B1E13138652DA294D604848A5790FE5B5D2A0856BC8FE425909650CE371703B1EBB24A700947C14C00DDBC9A1F4B26F90D788953B09C6480029BFE37A9244733B190FE51AF233E7674372CCEF88ECCBD42635F7275C2E1756AD5A05A3D188EAEA6A9C3D7B16478F1E455353131A1A1A50575787BABA3A2C59B2043366CC508A85BB0D4D122729DADADA70F0E04144A3516CDCB811070E1CC0279F7C82DCDC5CB8DD6E3CF4D043296E8DC964127EBF1FA74F9F466E6E2EA64D9B869E9E9E7B78061AB782D168C482050B60B55AD1D7D78783070FC26834C26432A1BABA5A059D7497523E9030B002C3995ED9204F0993248E94943208724C86AC384A72CA8792898A442281AB57AFE2D8B163E8EDEDC59FFFF99F63D9B265F77C40AD8686C6D4021FEC65728DB2C2F441F1C1605019B4F01E4D131860D8744692341249923226B92851A4732AE5A4922092B4719C02D720A1924E9DD2D08CC7170E87537A29D92328490FC77E90D8F19C38FF908A16E94C2A0D5A38F3979083E849A6A4310DA5A824D1723B294595EEA5E9318FEBC89E447E869298CB7E46690E271D52657590AD1E24BBD24555AA75F83A7F66C55393C4FB13151515983E7D3AEAEBEBF1C9279FA0A1A101E7CF9F474B4B0B0E1F3E8CBCBC3C3CF5D45378E18517B074E9D271A92A6A923849C09B071BA67FF39BDFA0A9A909F5F5F578E18517D0D0D080BFFCCBBFC4B66DDB60341A51565686F2F272F5801F0E87D1DBDB8B969616BCF8E28B686E6ED6247112C06432A1AEAE0EFFF88FFF886F7DEB5B3876EC981AA8CCE1C9CC2093E849573C36FBCB2CAE743D95D96106AC74573C396791D95D19EC263249F4F97C3872E408CE9C3983871E7A082FBFFC32F2F3F3EFF5616968684C5148874AF6D971603D1D3C01A8D1151C381F080400A4CE59743A9D080683378C7CE0CC42F624B2C78F2486C9406E47F24619248D6682C1A0327721B1321A8D0806834ABE198D4653E62DF23C182FA4B10E6307659E5C434A2DD9CB17080414F1249936994CCAA087EFE5F59446383C57791EB21F91525F1AE90050554E9AAE49D756C6476098209274CA2AA07432E5BEF819308E0250B25600296493554BF621A6F7526A27530D8BC582EAEA6A545757E395575EC1850B17B067CF1EBCFFFEFB3870E000FEF33FFF134EA7130F3EF8A0AAA8DF4D68D7864982582C86EBD7AFE3F8F1E3F8EFFFFE6FFCEFFFFE2FAAAAAAB06EDD3AB85C2EAC5EBD1A1B366C406E6E2EDE7BEF3D7CFFFBDF47737333FAFAFA108D4671F9F2651C3B760C2FBEF822727272EEF5E968DC010C0603F2F3F3F19DEF7C078B162DC2993367B063C70E844221959DA6731E1F02D2E766D1B4C06432C162B1C0603028431BFE8E7D2E34AC098542181A1A42381C56E3386445524A5D272A3EFAE8231C3F7E1CD5D5D5F8EE77BF8BECECEC09612BADA1A13135C1C41AF0E968A3C1C14195682341C8CECE56F7541A96C4E371358E8AC3EB038180AAEE9160BA5C2E442211D5B7E8743AE1F3F91489219973BBDD88442229B37363B118EC763B0028631B0EB56782910491325683C100B3D9AC88A43C16BBDD8E68348A6834AA2A7CD16854B5B2844221451CB986D96CBEA1B7928EAADC9EC74727ED74231C6998C31E48123012DD40209042DE32333355DF234921492F139FC0704B05ABA5C0F05C4556495965E5BE647590C63A005212B334174AEFAD64F554FB4368A4C3603060E6CC99D8B46913FEEDDFFE0D7FF7777F87F2F2720483C1714B28E84AE22481C7E3C1912347B07BF76E783C1EE4E4E420232343359933A3565D5D8D482402AFD78B9FFDEC6758B97225F2F2F2100C06E176BB91919101AFD78B4020A05C323D1E0F1C0EC78419DEA9712332333351535383975F7E19894402C78E1D43616121EAEBEB6F9089323BCD204799929488CAEAA05C43FE97BF931218560DA5ADF744C5E1C387D1D0D080B2B232BCFAEAABA8AAAA4A99BFA5A1A1A13156E0FD92A311B2B2B2E0F7FB010C579092C9A4AA0E52BD41A244674F26F5A2D1A81A93010C3B7B86C3E114A319260B2D168BBA479370C981F0249ED27C8584886BC8911024B05C239148C06AB5AADE454A5765852D1A8DA68CF2E0758846A3AAEA41531F60B8778F6B90CC9288592C1655C9E4B595232CB81D8F85F777C63F4A75A57455AA6A58992461038665C3525E4B824832CCCF038092D1CA511E8CAFDC17CF8390C49115D6891C4B35C61FF1781C870F1F86DBED465D5D9D1AA53377EE5C5457578FDB6C67FDC4344960B158505C5C8C254B9628294B494909DC6EB7DAE691471EC1FCF9F3D5CD269148A0B4B4548D4888C562686C6C04005CB972055D5D5D686F6FC7B973E7306FDE3C9561BC9F9048243038388863C78E61E9D2A5231AFE7C967D86C361343636A2A4A4044545456370A49F662857AC5881818101F4F4F460D7AE5DC8CFCF475D5D1DEC76BB7A1860F00386B3A2B27F44124760585E23FB2D00A4F455C82C2BFF2B7B70265A80F3F97C4A7ABD7AF56A3CF2C82353C6A8291E8FA3B7B717D9D9D99FFB9C86868694DCCA6AB56A12ADA1F139C17B258916C99BEC738BC562298627240BBC77A79337F9BA24A1726C865C9F124EB61EC819B8AC92A58F6590C3E8A5C494A4920451F6EEF13CF83A13875C83462CD2FD937D84B2778FAF73BDF47E77262AE52C42E90C4B322CD72079936BF058A44369FAA809BE2E0922C92B4192C76B9A6ECA23FB3AB9B6745405861307DAC9546324F059EDCA952BB872E50AE2F1387A7A7AB076ED5A2C5DBA74DC62B57E229824703A9D58B87021162E5C78D36D1E7FFCF1115FEFECEC84D168C4E0E0A01A58EBF3F9E0F7FB11894454E6EB6E8041E9B30E5DCFCCCC54462C638D6432899E9E1E343636E2C2850B78E08107C66CBFF1781CCDCDCD181C1C444646C6988D5B282828C0EAD5AB313838887FF9977FC1E1C38761B158505353A3329FBC66C0B089427A55504A90A4B98D0C6E0C68A3114712CB8926953977EE1CCE9D3B873FFCC33FC4DAB56B515C5C7CAF0F694C108944D0DBDB8BC6C6463CF0C003B7451225994F473C1E87D7EBC5A54B975053538369D3A669A2A8A1F139208912FBF2A4794A281452C48AA4CC6030C0EFF7A798C9B0C2C6982D07CECBDE3F56FB38AE88FD8C3474E13D3E2B2B4BF5CFF1DE4E02C40A1B89198F49125AA3D198722C8C215C83E48F325169F0227B31797D24894C4F64A63BC3D258461AF9C835A4594FBAB98C1C55C1FDCA5609926E797FCCC8C850D54FEE8BC499842EDD9C28DD488E3192EF957194EBDFCD672F8DC98DCCCC4C54575723180CE2FCF9F3C8C8C8407E7E3E1E7EF8619497978FDB71E8A781FB00454545AA9AC52AD7C99327110E8751535383FAFAFABB5665894422E8EFEF477F7FBF228B0C5A0C82F2E62C4737B0EFA0AAAA4A55CAC6123E9F4F4912BFF6B5AF8D491511803212A8ABABC3C18307D1DFDF8F0D1B36A87E93CF8BAAAA2A3CFFFCF3B870E102B66FDF0EBBDD8EECEC6C4C9F3E1DB1584CF51CF2BA32039C9EC50486EDBDF9600140053706ED915C4FE5F808D9DB71AF914824108944F0C1071F60FEFCF978F6D967EF88FCD3182A1C0E7FA6E09D9999099BCDA61E20C612F1781CDDDDDD3870E0003A3B3B515D5D8DE9D3A7DFF27D7EBF5FF5A0A6837F83BFFFFDEFB172E54AD4D7D7A3A0A060C2F79A6A684C54C841ED76BB1D838383B05AAD2AF6D2B885F24A83C1009FCFA708178992C3E1C0E0E0608A718BEC612301B2DBEDF0783C8A60526A69B3D9100C06159962FF1C2B691C382F87DD039FDE439D4E674A3FA4CD6683D7EB55E491F746CA5AA544967250C6719ABB48D3B348247283610E25B194ABCA44A624BA24C7DC4E12C974B7538BC5A288239DBF43A1904AA8C6623195F824389E847257AEC19827D720E1E731656565A9F3E5EB72D409D7E3F169688C86ECEC6CAC5AB50AAB56ADBA67C7A049E27D84783C0EBFDF8FEDDBB723140AA1A8A8085D5D5DD8BC7933D6AF5F7F57C602F4F6F662DFBE7DF8F8E38FD1D2D282D6D656783C1EE5E0545959A9082A09625B5B1B2E5FBE8C818101545555E11FFEE11FB074E9D2319D0B934C26F19BDFFC06172F5EC4F2E5CB51565636E62474DEBC79B87CF9321A1B1B118FC7F1CA2BAF8CD9BE0B0B0BF1DDEF7E17E7CE9D43636323F2F2F2B066CD9A947E0F002973AA24C9633F627AD588595A5680E902C7204D798DAC544E2442E1F7FB71F0E041343737E3C73FFE3166CD9A7547C777FDFA75ECDBB70FBB76EDFA4C41DC6EB7E395575EC1DCB973C72CE940747474E0C08103387AF428DE78E38DDB228800B065CB1694949460EDDAB537FC2E2B2B0BF9F9F9F8FAD7BF8E1FFDE847E8EDEDC5C68D1BC7FCD83534EE17B03F90EA1DF6CF9120381C0EF87C3E35C38FE48D848BC4912A14596D930EA046A31146A3111E8F47DDCF298FE41AB20AC67EC85028A49280814020651E211D517D3E9F1AD741124BF91BAB860E87037EBF5F1D23A5932E974B91424A5749EA781D68EEC2582289632412491944CFE4A5ACDC391C0E95C893955BAEC1711A8C65B2B752F62092208E2439A5794FFAB1F0F3E467C0CF5C12472925653F234795249349754E1A1A131D9A24DE47E08D6FE5CA9558BC78B1AA0E994C26381C8EBBB2667E7E3E56AD5A853973E62889E4F6EDDB51595989D75E7B0D35353529158E643289603088D6D656ECDCB913478F1E455B5BDBA832DBCF82A3478FE2ECD9B370BBDD58B66CD95D91D8994C262C5BB60C3D3D3DD8B973271E7EF8614C9F3E3D6516D46785D16844616121BEFAD5AFE27FFEE77F70E6CC19D4D6D6A2ACAC4C0522E9462A8732CB5E0A29B361B0A664494A4C09F6BA48E238510C8FA2D1283A3A3AF0BBDFFD0E73E6CC417D7DFD1DF7D952D69D979787B6B636ECD8B1037BF6EC81D56AC597BEF4252C5EBC38C51D389148E0FAF5EB6AE0EDA54B97307FFE7C5454548C29D1F2F97CD8B973274E9E3CA9C678DCEE77D6E7F3A1A7A707EDEDED48241270B95C70381CEAFD595959282A2AC282050B70E6CC196CDEBC19AFBFFEFA981DBB86C6FD04DE7328ED0490E250CA710DB2778FAE9BFC9B248920A121C1A4710D630865A2269349491A0D06030281C00D062D24567C9D04CA6EB7A718BD48F22609264913AB8EE9331D79EE7C9DED085C83444CF639CA7E481AC34852C6B5D93FCFF74822C973616551F6FE71BF005465926BCB198EACC20248713EE5B9525E2B673D3241CAD8CA356445569E879E83A83119A149E27D046602C753CF6CB3D9505E5E8EF2F272C4E371BCFDF6DBEAF5850B1762E6CC9923CAE0162C580087C301B3D98C8E8E8E319333B25AF9EEBBEF222323038B162DBAAB73F38A8A8A3073E64C9C3C79125BB66CC12BAFBC8269D3A67DEEFD32A0AF59B306A74F9FC6C71F7F8C43870EA9D998C030B9637F84248E0CD472B030B39F37238E725D49228161B3847B89EEEE6E1C3972047D7D7DF8933FF913646767DFF13E2C160BCACBCB51545484EAEA6A1C3B760CBDBDBD703A9DA8ADADC592254B52BE2FC964125EAF1755555570B95CF8ED6F7F8BCECE4EF5A03456387AF4285A5A5A909B9B8B850B17DE32D1108944D0D3D38323478EE0D8B16330180C686F6F57F3BB56AF5E8DD9B3672BC763A3D188254B96E0F2E5CB3871E2045A5A5A505151A1FB133534EE10B25D82D52C9AC090C4507AC88A1EC922DF9F2ED9E458079ABD308EB1DA27EFE5BCC7B33A284D60B836890AD72064BFBA3494E1769278D2F486F77DD9FB27A59954B2488317699C26FBE279AD581565CB09E39774644D977F4AB7531EBB34CC01A0AE0FD7906BA76368680876BB5DC54FF9F93039CAEBC9F3903D9072FC867CFD5EC7490D8D3BC1C4D189694C79A46BFF6F7673060097CB85FAFA7A3CF9E493E8EAEA1A3392188D46D1D6D68683070FA2A4A404F5F5F563B2DF9B212B2B0B3367CEC4A2458BF0F6DB6FA3BDBD7D4CFBF74A4B4BF1F8E38FA3B2B212C78F1FC7E5CB97110C060140CDB7622F06AFBF0C767C0889C562AAF7820F197C7021716456941224FEBB9BE642B70B36779F3C79124B972EBDA989D3AD40C264B3D950565686FCFC7C25D32D282880D3E984CD6653FFEC763B8A8A8AB074E9523CF7DC73F8E217BF08AFD73B66FD2694A37DF8E18748241278ECB1C7E0703846FDDB191818C0F1E3C7F1EB5FFF1ADBB66D53C982CB972FA3B5B515E7CE9D436F6FEF0D73962A2A2A50535383A1A121ECDCB953F7CC6868DC21D8DB4D89235F2331636F1BC91BC90AAB802433B2CA25B793D530922326E8E4F8236E2FDB01381C9E552CDEBF59450486E7014A374F1E0B7F4782C8B549A078EEB21F9E71836D0BDC9EBD8D3C5F1247C618123E69BEC3ED589593B18C3254B906AFBBAC60CA58C6AA9EDC061876EE96063FAC0AF25A91004AF227C75EC8FE49124612655D45D4984CD0245163C262DAB469A8ABABC3F5EBD73FB33B6A3ABC5E2F7EFFFBDF0300CACACA5050503026FB1D0D454545983D7B361A1B1BD1D4D484C1C1C131DDFFEAD5ABF1D8638F211A8DE2DD77DF45474787922B49A319FEE3A803B3D9AC023D416953341A55439647228E32D093388E465CEE36AE5EBD8A3367CE60686808DFFAD6B7505A5A3AEEC7505C5C8CA79E7A0A814060CC7A4E86868670E5CA151C3B760C0E8703CB972F1F75FB68348A63C78EE1DFFFFDDFF1CFFFFCCF282D2DC577BEF31D7CFFFBDFC737BFF94D7CE52B5FC1DFFFFDDF63DDBA75237EF767CD9A85929212FCF297BFC4E0E0A0CE7A6B68DC26482E28FF94730339D49EA4478EC648373FE1507BF601D2F02C1289C06C36A70C61371A8D080683B0582CCA188EF776F6E501C304916485B180A656ACDCB1C70F40CA7694C8CA311494BE924891BCA5CF0DE4507B393790FD9740EAC0799BCD96721EDC8E2494FBE5C810C62192D0F40AA6EC8DE43A34B3215167752F9DBC59AD56551196E33828C32551A62456565FF939C98AA29E85A83119A1B5441A13167487A323DA58607070109B376F466D6DED98CD2FBC158C4623A64D9B86A54B97E2C08103A8A9A91953726AB7DBB16CD932AC5FBF1E3FFCE10F316FDE3C646767A7D88353F2C3EC2AB3D0C0A7D54E669E2D168BCAC432A831CB2AE5390CE27C40906EA7E38D64328913274EA0A7A707AB56ADC2C30F3F3C267D9F770AB3D98C69D3A6A98782B140381C560EB6E5E5E54AA275339C3A750A6FBDF516F6EDDB87471F7D145FFBDAD7505C5C8CCCCC4CB85C2EF5C074B3BFA78A8A0A545757A3B5B515274F9E84DD6E4FE9C1D4D0D0181DACF49320068341451CD8CBE7743A110E8753EEA3C160104EA75319CC656666223B3B5BBD5F1AB4381C0EC4E371844221457A483CD993C87E46AE61B55AD5EB894402C1605025FA58FDA4AC35140A291318F64A92E85049C2911D3C267A1E040201457A49DED84728C77DC80A2BAF5B2010B8C130874A0E1244BBDDAE8827631100E596CAFDD2D846CA5D699823C76430F129AB92EC1D75381C29BD95369B2D851432365276CBDED374E2C8FFD7D0986CD095448D098B8C8C0C64676763DDBA7563620232343484EBD7AFE3D8B163A8ABAB1B75766132F9E9D0E2F3E7CFA3A5A5E586EA5F2010C0952B5770FCF8715CB8706154691E4D03962D5B868B172FA2BBBBFB739F4BFAFEABABABB17EFD7A545454E0C89123686F6F57A48E0F0AE17018E17018D16814A150485507655F06839A94A8B2E2487912AF8F74401DAB4AEF67C1C58B17D1DCDC8C8282026CDCB85111DDF1062B08858585B72473B78B70388C0F3EF800F9F9F9A8ACACBC25F9FCE0830F70E8D021E4E7E763D3A64D6AEE21256BFC4C6FB61F8BC582A2A222CC983103FBF7EF476F6FEF989C8786C654078946381C561524DE7BAD56AB3239B15AAD4AA5C14A5D241281C3E1402C16530ED534812141E4FB690243792600B506C92925ADAC76D15D937D8AEC8794263072DE222B75B26F32168BA9FB1A65B0248E5C83849249461247124400296332187B484CD30D73A4A3369399AC2C4A59A9CD6653315856ED488801A438AD32294A8228DB256482549AB2592C1675EC54D39078CABE432995A5445813448DC90A5D49D498D0B0DBED58B972E51DBB548E84402080CECE4E0C0C0CA0A2A262D4911F838383D8B3670F2C160B5A5B5B61B7DBB162C50A949696E2C48913F07ABD2A53DADADA0AB3D98C871E7A08757575239A7D582C16CC9A350B3B76EC407F7FBF7A88182B389D4ECC9D3B179B366DC2DB6FBF8DA6A62614161662FAF4E929AEA60014B9631697419A59503EECF0F824A960154A1ADE48F92903E77821994CE2C8912388442258B66C19162D5A346E6B8F048BC582356BD6DCF6788AD130343484C1C14134373763E5CA95282E2EBEE5F667CE9CC1B56BD7B06AD52A2C5BB6EC8E2BAAAC5ECC98310367CF9E1D7369B486C65446FAFD8FE40D18363C6102920A196926C37E754A3BB91DDFC7D7496EA4BC916BF05E4C374E6E238F490EA5E7FB793F97E630DC4E0EA267F58CA63CE92637FC591AE610245324AB5246CA7D499247E9AA24A434A461EC929251C620E9E02D63D4486636AC7AA6F7A142BCF50000200049444154244AD7567E4EF23AC8CF43265A653FAA36AAD198ECD095448D090D93C984B2B2B231910F7A3C1EB4B5B529F9E7CD86DB874221B4B7B7E3C89123301A8DB878F1227EF7BBDFE19D77DEC1912347D0DCDC8CFEFE7E188D46E4E4E4C0EFF7E3A73FFD2976EDDA85EBD7AF8FB84FB3D98C8A8A0A844221F4F7F72B7399B1445E5E1EBEF295AFA0B2B212972E5DC2D9B367550F06B3B0B4616730E6430DB3C6FCAF34B291B6DDCCB65222C5B95DCC368F67058F95E193274FA2B8B818CB972FBF2BB33EEF042693092B56AC405E5EDEE7DE57381C464747077C3E1F0A0B0B4775E1E56744699ACD66437676F667FA3C6C361B4A4B4B71F5EA55F8FDFECF730A1A1AF71DE4BD55BA92F2FEC94A1F490849A29CFB47131826F800A8DF5152C9E41D937C72A61F0D5A483E49C024F103A08E4556FF5871A36C13408A23ABEC5B04A0D6A3A98E6C6B90663BE94638247F23115229D5E4B9C80A1D41F2282B953C26693403409D9B349A91AEB32484249EBC77F2FDECB994B2546998C3CF5C92634990353426233449D4981260556FB4AC9DD7EB45474707DC6E37EC76FB4DEDFDBBBABAD0DCDC8C254B9660F1E2C5A8A9A9415757177EF2939FE0ADB7DEC2C2850BF1DC73CFE1B1C71EC3B265CBF0FAEBAFC3E7F3A1A1A101172E5C18719F1C3D62341AD1DBDB8BBEBEBE31396F0993C9848A8A0A3CF7DC73482412387EFC387A7B7B6F7028CDCCCC84D56A551221CA49A52D38C962281452463634B049278EB22F713C49622010404343037A7B7BB178F162AC58B162DCD61E0F50D29C4824909B9B0BA7D379D36DF9A0585A5A0AB7DB8D603088FEFE7EF8FD7EF87C3EF87C3E0483C11B86468F049BCD86A2A222747575C1EFF7EB071D0D8D3B801C3D64B7DBE1F3F952DC35814F951FD168541117D9132865900E874399A7488228AB61EC359404331E8FC36EB7AB7BB674D7E46C429ACE704E228F45F6D9015032D34824A2881589A4EC8794E4CF6C36AB984C02CA73E02CC6F4B11594C8720D9E2FAB8952724AE2C9AA2CD796866A9C5329C91B470051D6CA35D2C73CF1FC640593895059C1A43458124A93C9A4E4C41A1A931D5A6EAA3125100C0671F2E449CC9B370F4EA773C49E2BAFD78BEEEE6E1417178F6AB472EDDA35343535E19BDFFC26EC763BFAFBFBD1D9D909B7DB8D6F7CE31B983163464A65930FDD5EAF171E8F67C47D9A4C26949494C06C36A3B7B7173D3D3DA8AAAAFA9C673D32366EDC8813274E60CF9E3DD8B3670F5E7AE9259531E6034CBA5C0780921C913C4BD9291F1CE2F1B872EE944E7E52C6335EF0783CD8B163076A6A6AB070E1C231993F39914092E8743A61B7DB6F294FCEC8C8C0B3CF3E8B6BD7AEE1C2850BF8F18F7F0CB7DBADA4D1C5C5C5A8AFAF474D4DCDA8F30FAD562B4A4A4A108FC7D1DDDD0D8FC773CF2BB41A1A9301EC49E47DD4E3F1A81141240D6EB75BBD4EF2C6DE41596173381CF07ABD2AB1C74AA1DBED4E19641F0C06D5C07A56AF1C0E07FC7E7F4AB52C1A8DC2E57221140A296245122BAB86F1785CAD41E92449A4DD6E575543F633F2DE4FB24B731759B9E3EBF1785C39AD722D6098580F0D0D29C31C0EB99712531AFF50AE4AE2C87E489253393A4492489269ABD5AAB64B1FA7212BAF24B734DF21B94D2693AA4A49275392451AE368684C05E84AA2C6A487C7E3C1810307F09DEF7C07E7CF9FBF61FE1B118944100804E0743A477DE0E6EC3B87C38168348A6BD7AE21333313CB962D434D4D0D2C168B0A28914804172F5E44241281DD6E87C3E118719FCC9432C31908043EFF89DF04D9D9D958B3660D6A6B6B71FCF871B4B7B7ABEA1F0D6C58258C46A34A5E0AA40E1D9656EEB46597B317B98D34C719AFE0E8F17870F1E245B4B6B6E2C9279FC4ECD9B3C7B4C7F36EA1AFAF0F870E1DC2D6AD5BD583DECD100A85D0DDDD0D97CBA57A456F85DADA5A2C5CB810797979B870E1020E1C3880F6F676F4F5F5A1ADAD0D2D2D2DB79CD3693299909D9D8D8C8C0CF4F5F5C1EBF5DED1396A68DCAF602F1C005579E32805C60059F593524B121FDE6F29F56605322323034EA733657404AB8C744565258DD532F6334A674F8EE2A0090C30EC4E9D4C2695610ED5274C0ED251558E8E88C7E3CA288C3DEDB22A4989AA1CD1C1C423A5AB8C25ECDF647F224917DDB9D3A5ABB2B248692E2B9324E63C5700EAB9403A91CADECC741512AFBB5C43F6DD9338A6CF99D40451632A41571235263586868670E1C205FCE637BFC1FEFDFB479DED26DDDE467BE02E2D2D5555B5B6B636747575C1ED7663D1A245CA84800885423871E20482C1208A8B8B471DABC1E0C8E3B85BC8CCCCC4D2A54BD1DCDC8CA6A626ECDDBB5739C48ED4A02F1D4ED3475B302093109238CA0AA4EC8F91EE6E77137D7D7D686E6E464E4E0E962C59326EE34CEE14F1785C2531A2D128DADBDB71E9D225646666E2D1471FBDE1FB24313434844020A07A4A4743229180CFE7C3E1C387E176BBF1EAABAF22373757550FD88F5A5050306A151180926565646420180C8ED9CC470D8DFB01E9EE9AE9062D244DBCF7B21A4559288911475AC856011ACD90605216CAF528ADE41AF2986884237BFDE4BC4620B5BF9071521ACDF07801A418E6C8989BFE5E592594FD7AD2C97424D2CCED48BAB906AF8F94D6F21CE57B79DDF85ED94B29B78BC56229BD86D20C879F8724E07206A45C9BC45543632A4193448D498D8E8E0E343636A2B5B5F5B66ED00CA4A3A1A0A040CD316C6A6A426F6F2FF2F3F33167CE9C1BB60D06833876EC18128904CACACA6EE940C9B5EF76B6B1A4A404CB972FC7D1A347B167CF1E2C58B0003939398A703070CB3E19002AD0C96CA974B003A082B994E830D32B33CF770B894402DDDDDD686D6DC5F2E5CB515E5E3E2AD9BA97482412884422B87AF52A42A110CE9C3983F3E7CFA3A2A2E296D7487E06A37D6793C92482C120F6ECD98313274E60FEFCF958B76E1DDC6EF7673A66E96C2B930A1A1A1AB7061380523922AB5C5467706403E5A0ECFD631251AA0778EF658F1E30FC77CA198BAC98C971169C5328FBE7A4490D4DC72897A45C96C7248D5882C1A022660052662C720D9964642CA1E493FBE13592DB717FACD6A59BD0B00AC84A5E3AD9A4E10D5F67DCA2036B3AD196DBA5C732096940C3EB2693A2B23792715343632A41CB4D35262D2291080E1F3E8CFEFE7EAC5EBDFA96DB3340DEC9DCA2A6A6260C0C0CA0A0A000B5B5B529BF4B2693080402387EFC389C4E270A0B0B47351791B3A36E55CD190BCC9D3B171B376EC4C0C0008E1F3F8E8E8E0E259F01861F624C2613AC56AB929292103268524ACA195EEC4B64565B5ABBCB26FEBB855028A446996CD8B0E13393A1F180D16844515111BEF18D6FE02FFEE22FF0D4534FDD76EFA474CC1BEDFB1A8BC570EDDA35FCE0073FC09C3973B066CD9ACF7D4DA4D3DFEDC85C3534343E052B64948CB2FF9B44C366B3A93E429A86058341D5DB46E2C1798AEC81632F1F092765907EBFFF06C263B7DB110C06D5DF2F631EF7C52A99D56A55FD7B00149993330CD9CBC7B8C5FB81D56A552EDD2494C96412369B4D1133292B25B9E51ADC4EBABE4A531E5E1FBABEF21C69D6C3F823AB857C2FAB9924919254B2324A2229DD6781E1E41CABBBE9AEA824E3FC9CB8B626881A53119A246A4C5A1C3C7810999999A8ADAD457676F62DB7B75AAD70B95C6A4EE1EDA0A9A909C96412A5A5A537AC313434848181019C3B770E555555AAFA381212890442A1906AE0BF59EFE258222727070F3EF8209E7EFA699C3871028D8D8DF0F97C8846A30804024AD2C48701CA71F820C2AA239D5029BD01A06453D16814E17018434343884422E33238B8B5B515ADADAD70B95C4A463B15919595A506518F5625EFEEEEC6EEDDBB51575787BABABADBFA5B180D4C02F0616A3493270D0D8D4FC1FB1EEFED814040FDEDB0AFCE6C36C3E3F1209148C0E17020232323C58885124EB3D90C9FCFA7C8100989CD6653DB039F2A5968DC42126A369B95E10D2B75BCB74B0927D74897603A1C0E04020145CA48DE48EAD85BE9F7FB95E18D3C77F652CAFE3DA7D3A99CB10D06835A43CA7093C9A47273E5F1F23E248923C9292B88AC84D2A595B25D4A57656B040D7E64DF24D79689B174C759E9E6CAB8292B935A66AA3155A149A2C6A4C3D0D0107A7A7A70F1E245E4E7E763E6CC99B755BD72B95C983E7D3ABABBBB6F69DE118FC7E1F3F970E9D225389D4E949797DFB0C6C0C08032AD99356BD6A873EC62B118BABABA108BC5505050302E4E9C999999AA8A65B55A71EEDC395CBA744965924906C2E1700AD9630005A032B89416D1B486E481A492DBCAE1C5770B972F5F86DFEFC7030F3C8069D3A68D4B55F65E80A32806060646ED0BECE8E8C0CE9D3B3167CE1CE4E7E77FEE4A6E341A456F6F2F1289040A0A0A2674A5564363A2808487F753E9AE69B55A1521043E8D45244DD2BD94BDC01C1D2167034A074F26E938CE881547004AC64A47559221B3D98C6834AA08979CB798BE064916552276BB5DC95501A864A0D56A4D998B48674F39D49ED54A56ED689823DB13484259352471242994FD88346193F25A8EE890FDF394FDCAF834D27624E652E2CA58C6DE4A127059212571D415448DA90C4D1235261592C9243C1E0FDE7FFF7D141515A1AAAA6A5489A784CBE542717131BC5E2FFC7EFFA8E631742DBD7EFD3A8A8A8A505E5E7EC3367D7D7D387FFE3C92C92466CF9E3D6A2531168B29B9E7B469D34625946309BBDD8E254B96E0A1871E82D7EB455353937AA09066340094B48615423AA1F241850F03324852F24429922494770381400057AF5E455656161E7AE8A15B9A104D66D86C369497972B37DC9B2536BC5E2FCE9D3B77CBC4C7ED221C0EA3B7B71766B319050505B7FDF7A5A1A181946A5BBA3C918486A63172C410AB83D22485B2496992C235E4680DA9F0201962C58BF768121DB91D7BF6589193F24ADEEFE5FC42DEFFA5610E6308E304C7504823339AC34857D4F41E3FE99C4A82C97D4922963E6E897DF52319CDC8FECDF4ED806137DAF435E47B798C922C720D5D41D498EAD02451E3AE626868087EBF1FBDBDBD686969C1E0E020804F1F442F5CB880CECE4EF4F6F6C2E3F1DCD643AED7EB454B4B0BDADBDBB160C1825B1AC548B85C2E94969662686808DDDDDD4A16331282C1208E1F3F8E603088F2F2F25149A2CD66437575F5A832BF68348A2B57AEC06C36233737775CE4A600947CE8D9679F457E7E3E5A5A5AD0DADAAAA4A426932985E4C92A14E53A248EAC3046A3D114831B6968438278B76626767474A0BBBB1BB9B9B958BE7CF95D598390633D680E339E0392ED763B2A2B2B017C5AB5BED9D81466CD0F1D3AA47A683F4F763B1C0EA3A7A707797979C8CECE1EF7F9971A1A931594493279258D5B48C638C05DCE2604A0E6113209C77B2BC91425A724885C43BE9E3E17910431BD1A269D3E8161575356FB488CB88DAC6C02C3F77A125DC60AAE0D0C57564732CC91C93D262BB906DFCB84A31C3121E59F3C16DEFFB83DAB80DC4EDE0B6FE6649ADE26211D52253966CFFDDD3667D3D09828989A3A2D8D0983402080B6B636B4B6B6E2DCB9736A28FDD0D010B66CD902BFDFAFE497D5D5D5C8C9C9B9E9BEE2F1389A9B9BD1D0D080A79F7E1A4EA75355BD483069AE4229A484C3E1407171316C361B9A9B9BF1C0030FDC94D84522115CB87001999999A8AAAA42696969CAEF93C924FAFAFA70E9D22594959561FAF4E9A33A6CD2D972DAB469C8C9C919F7EAD7A38F3E8AFDFBF7E39D77DEC1471F7D8459B366A538BC01505227F99AB432E78300DDECF810C36C3633B2B20764ACD1DCDC8C5028848A8A0ACC9E3D7BCCF72F25B803030318181850D7E2F2E5CB983D7BB67A7862AFE6DDFA2CAD562BCACACA60B158D0D5D585EBD7AF8FF87D75BBDDA8AEAEC6EF7EF73B657EB168D122381C0E582C9614B389DB41301844474707CACBCB61B7DBC7F2943434A63C1807D8C3160E871531224104A02A719C0FC81E3DBA9A462211B85CAE1BE62AB2AF8E7255560D59A5CCCACA82DFEF5706344CEC592C96945EE3CCCC4C84C3E194BE674962D983C83E42008A84D2CC86953E125B8BC502BFDFAF5E673FA33C46262783C1A032C821A135180C6ABD74475592348BC582402090320223232323E55AB33522140ADDD07349C929091F0D7E08C62FBABCB2EA984824D4B5BA9B23AC343426123449D4B8AB088542E8E8E8C0C58B1761341AB161C3063CF1C413EA66EDF3F930383888502884E9D3A78F4A123B3A3A70E1C205B4B5B5A1AFAF0F838383C8C8C8C0F5EBD7D1DADA0A00B870E1022C160BCACBCB51535393F2FEACAC2C64676763E5CA9568696941777737AAABAB475CCB6432A1ACAC0CCF3FFF3C1E7CF0C11B2A7FB1580C3D3D3DE8EEEEC6638F3D069BCD36EA75F0F97CD8B3670F962F5F8E929292DBB974630A83C18075EBD6A1ADAD0DBB77EFC69933675056560697CBA582205DF8183C192CD3DD584992989126510790E2247737D0DADA8AECEC6C545555DD95357A7A7AB06BD72E7CF0C107E8EEEE465757170A0B0B91919181B7DF7E1B1F7FFCB1AAF06DDCB8110F3CF0C05DABB4190C06389D4E545555A1ADAD0DEDEDED237E5FABABABF18D6F7C03972E5DC2D6AD5BB16BD72ECC9A350B5FF8C217B076ED5AD4D4D4DC51E5BABFBF1F274E9CF8FFDABBD3D8AACEFC0CE0CFDD776FD8266C069B1DB318DB31210402213403749A0CD354342375A469558DAA4AADD4F64B3FF5732B4DD5AAF3652A75C94855554D974C34ED4C1212A664829849CC4E4C0C066316638C8D97BB9DBBF5037D5EDE7B6D0806DBD70ECF4F42499C639F739D997BEE73DEFFFFFFA2A3A343FD882253E072B9303E3E6E42215710B9C2C612C5AAAA2A331994A18C9341191C39DC85533BB98D452C163361C81ED012894490CFE7CD24D28A8A0AD323C8F7EB5C2E8768345A141C1DC7310FF9782DA150C87C9D9521C964D25C1F27ADDA5B4D78BD5E8C8F8F9B9548BB2790A5A43C2E9148146D4FC180C929AF9CE6CA1553AE96DA9356F9FB74B95C08854248269345FD85ECAD0450740EFBEBBC46FE7E81071534F6501EF6562693499598CA3345215166545555155A5A5AB072E5CA49F722E253C85028F4C88008DC5FD5AAAFAFC78A152B30343464BE3E3030809B376F02B85F96373030F0D09F555D5D8D43870EE13FFEE33FD0DFDFFFD073555656E2D77FFDD7914AA5505F5F3F6165ECE6CD9BE8EBEB83D7EB457B7BFB23575C52A9146EDFBE8DEEEE6EFCD11FFDD1A4A5AB33CDE572A1B9B9193B76ECC0C99327F1939FFC04870F1F361F2C18EEB80A6B6F93C1521EFEB7E3936E7BE880BDB79E5D46345D375496F75CBB760D4D4D4D686A6A9A969F5BAABABA1A3B77EEC49A356BCC1363FB35F003482412C192254B667C684E2814C2ABAFBE8A3367CEA0AFAF6FD2632A2A2AF0E28B2FE2AFFFFAAF71E4C8111C3F7E1C9F7FFE39AE5EBD8A1FFFF8C758BB762D5A5B5BB17DFB76B4B4B43CF27CF1781C376FDEC4CD9B37B17BF7EE5919B024F255C2BE387B6378BB5433168B219148984A0CF6C945A35153F6C8E99AB95C0EC1601000CCD60F1C02C3D0C4C99E1C3A6687217BCB23064F7BDF409698F21CEC8164A09C6CB227FB06FD7E3FD2E9B4794866AFCEF101A25D32CA9E4BAE1A02C5E5A35CB9E3EF83E7E06BE2F732BCD9FB223234F31C2C5165492CAF8365BE3C370366E9FB3C573FEDCA18B659883C4B141265460583410483C169F9B0198BC5B06EDD3A2C5CB870C239CE9F3F0FE0FE26F2AB56AD9A700C55545460EFDEBDF8C94F7E826BD7AEE1C68D1B93AEECF9FD7E2C5FBEFCA1D7D2D7D7876BD7AE211C0EA3BDBDFD912B89B76EDDC2F9F3E7B176ED5AAC5BB7EE4BC3F04CA9ACAC445B5B1BF6ECD9837FFAA77FC2B66DDB505D5D3D610B097BFA299F14B35FD16EF4B7CB4A1922ED3F7EBF7FDA6EAC994C06B76FDFC6D0D01076EEDC89C6C6C6A7FE9993E12A743982FC6482C1207EEDD77E0D274F9E445F5F1F46474727FCF7F27ABDA8ADADC5DEBD7BB164C912B4B7B7A3ABABCBFC3972E408CE9C3983EEEE6E64329947AE7EDEBC7913D7AF5F474343039A9B9BBFB2DB8B88CC04BBD78FAB54A5835C18B4B8E2660F81E1710C980C6FF6D733998C7950C79E470E87618062F8B3FF7F6E4F3BE57BB43D30C7EEF16358E439EC6B62E89D6C108EBD37E1647B0BF238AE6CF2BE52DA5F68076B863AFB1CA5D349B94A696FA7C16B6168B7B702B12B5EEC3D12A9F401A7BD322AF22C5148947923128920128998FE40C77130343464A6861237329E4C2010C0CA952BD1DEDE8E1B376EE0B3CF3EC3E2C58BA7DC57D6DBDB8B1B376EA0AAAA0AEBD7AF3737F3528EE3E0E2C58B3875EA14DE7AEBAD59597D7A94A6A626BCF6DA6BF8F77FFF779C3F7F1E4B972E454D4D8DB959F3466B6F63610FA9B1F796B2F74DE4071E7B622AFBE3A6433A9D46777737F2F93C1A1A1ACA52B2FBB458E2C527EE1C52F1A8FE4D9FCF87CD9B3763C58A15B87BF72ECE9F3F8FEDDBB74F388E3D392D2D2DD8B2650BEEDDBB87F3E7CFE3C489133879F2244E9E3C890F3EF800F5F5F558BB76EDA4FFFFC866B3F8FCF3CFD1D7D78703070EA0AEAEEE2BBBBD88C84CB0038D5D26CAD52C0045FB1C0230BD78F6BE8A767F207BC04B2B3D78CF63692503A23D04C60E3B3CCE1E50C673738B9DD29537BE0E96CE32BC318CF1412080A270CCD541FE3EB81AC9BFE7BDC29E6A6AAF0EDA3F8B618FE7E0FDC91EB663F733DAD702144F3F2DFD3A00B395883DCC866195E7D2901A795669BAA9CC5BE3E3E3F8ECB3CF70E4C8115CBC7811CF3DF71C8E1D3B86FFFEEFFFC6850B171EFA7D2E970B6FBEF92652A9144E9C3881B1B1B1299DB75028E0DAB56B181E1EC6D2A54B515B5BFBD00FD3030303B870E1026EDFBE8DDFFEEDDF2EDB2A22C56231AC5FBF1EAFBFFE3ABABBBB71F9F265D3FB01C07C30F1F97C66E809FB4878F3E44002F622B22C8A3D2CBC214FE74097542A85AEAE2E54565662F1E2C5F3AA572E9FCF63646404838383181E1EC6F8F838E2F1B8591965DFD06418FEBEF6B5AFC1E572E1BDF7DE9B30896FB2F3C56231BCF8E28BF8933FF913FCDDDFFD1DBEFDED6F231A8DE2C68D1B0FFDC0333C3C8CD3A74F63707010870F1FFED23E5B11998865EA3E9FCF9487DA7B18F23D95AB6D5EAF176363634565AA6EB71B914864C286F3DC4FD09E50CA7E469E83E1866594F61E86DCD20280E9B363E9ABBD2D44381C2EDA709EE7B3CB391910ED89AA2CE7B457F5382886D7CB5EC2502854740EAE5AB25285036CEC154086CDD2B254AFD76BDE17790E5EA31D42B982696F4BC2DF3BEF575C35E43D9DE7177916E931B1CC5BE170189B376F46636323BEFDED6F9B377F97CBF5C8ED280060D5AA55D8BD7B37BABABAF0B39FFD0C6FBEF9E6639FD7711CF4F5F52193C960C3860D8F3CF6E8D1A3181D1DC577BFFB5D545555CDD8D4CFA9A8ADADC577BEF31D1C3D7A14E7CE9DC392254BB069D326D337C2A7D66CDA6740B4F7440C854245A3C0F944D7DE0839140A4DDBCD9521B1B9B9795EF5C9150A058C8E8EE2FBDFFF3E1289041CC7C1962D5BE076BBF16FFFF66FC8E7F3D8B973275E79E59587AE4603C08E1D3B70F1E2459C3C7912E7CF9F477373B3F9A0538A439D6A6B6B4D39716D6D2D56AC58818E8E8E87AEB2BFF7DE7B482412D8B3670F162F5E3C63C38744BEAAEC21273E9F0F636363088542661B21AFD78B482482B1B131048341140A0524934933B59381D2EBF5626464A46845CFE572211A8D9AC9A52C0BB5377D67A966381CC6F8F8B8093A5C618B46A326C8F97C3EB30D14436BA15030E7E07B3EDFE3393087E196012F1C0E239FCF9B878D3CCEEEADE4DC01BB0792E1D40E759148C41CCFE098C964CC39181CEDB2597B6B0DFB1CAC64B127CBA6D3E9A249AB760FA55D8D640FC6511FA23CCB141265DEF2FBFD66637A7B3299FD54F4617C3E1F5E7AE925844221747575E197BFFC259A9B9B1F6BE47F2E97C3A2458BB063C70EBCF2CA2B0F3DEEC8912348A7D3E8E8E8C0B66DDBE6444004EE97DCAE5EBD1A3B76EC406767272E5EBC880D1B3698A7A7EC03B16FB640F1DE51BC89F2EB2C55B5F7C8021E94163D4D58CC66B3181D1D455F5F1F0E1D3AF4D07ED3B9C8E572211289E0D0A14345BD40C083A14DB5B5B50F0D7C140A85B06FDF3EC46231BCF3CE3BA8ABABC3C2850B275DC10E87C3B873E70EDE7BEF3D8C8C8C2097CB61686808DBB76FC7DEBD7B2784D14C2683CB972FA3BFBF1FCDCDCDD8B3678F02A2C8138A442245259F5C992A9DEC69AF84717B0ABE0FB0C49413401916391195EFC35C85B3278072D5D05E9DE3FB100322032500B332C99FCBCA063B387245D42E8FE796100CC01C98C380C88788F671BC37F381221F5871FB0EF6B073758FDB8394863AB631F07D8A0191A18EAFDB1E66C3FB5B69CF245777ED7B17CFFD65EFCB225F750A89326F711B8D27B570E142B4B4B4C0E3F1A0A7A707AB56AD7AAC90E8F57AB16FDF3EA4D3696CDAB469C2BFE753D591911134353561DDBA75A8A9A979E2EB9C6E7CD27CF0E0415CB97205972F5F465F5F1F962E5D5AB4F9B05D76C31B2F3F8C944E7EB3571C790E06C7A76DFA4F2412B87DFB36C6C7C7B176ED5AD4D6D64ECBEF61B6F87CBEA7DED3D1E572A1A9A9C97C78F9E8A38FB07BF7EE09FB7702F703657D7D3D1A1A1A4C485CB3660D162F5E8CC58B17171DEB380E06060670FCF8712C5FBE1C5BB66C9997FD9E227301AB28EC10C421305C996280622F1C834B693F2387D9D8035AB80A67074CAE8C315871952D1008144D00B5CFCDD5B140206082A05D1952FAFECE078676686288E4EA257B07EDDE3F96A8B2AFDD7E8D0C8876FF3BEF376C6BB05709EDD53D96B8DAC7D9E7B07B2681E2A13CF639EC6B22065B9E47E459A69028CFB4C58B17231A8DE2C489138F3DA4C3EFF74F3A3C8478535BB97225162D5A3467CB23B76FDF8E23478EE0E38F3FC6A953A7D0D4D454348C86A1D05EF9E20715DEBC790C9F94DB2B88004CAFC8D3181B1B437F7F3F82C12056AC5831AFFA11A793CFE7C38A152B100E87F1EEBBEF9A6113A5BC5E2FEAEBEB1FEB7F77F97CDE0CD2696F6F7FE4445F11F972ECD3B3DF23D90BC7F749BB57D0E572C1711C13F6EC1EBFD2BE3ABEC7F2FBEDA0C420C830C780C3F773965ADA836CEC953486230EC6B107BAB0CC938191A5A88944A268D00C5743794D0CA81C98C360666F8DC120CAD548AE92F277686FAD613FB8B4B760B25F87FDA092E7E03FDB534D790E3B40934A4C45EE534894675E454505F6EDDB376D3FCFE3F120168B61CB962DD3F63367424D4D0DB66FDF8EEEEE6EFCEA57BFC2FEFDFB110C068B82214B13F921C0BE01F3034D369B35E551FC6000143F2D7E1AE3E3E3181C1CC4A2458B505D5D3D639BD7CF073E9F0F4B962CC1EFFFFEEF4FCB60A0402080C6C646AC5CB9721AAE4EE4D9C6F73F7B904B454505E2F178D1EA572E9743241231D185B86D00002000494441541BD33308B2EC929BC6B3D492AB73C16010636363A60494412D128998C1611C3C964C264D09264B5FEDE1303C87BDDAC6D2D7F1F171F375864596923264B1F4D51E34E3F178CCFE891C349348248AB6A1E0CF8AC7E3A62496C3B458760B144F44B5B7F960592BC323FB1EED1E4AFE1ED9EF69EFCB180E87273D87560D45269A1B4D522252163B76EC40474707FAFBFBF1F39FFF1C77EEDC413A9D36934B79C3E5D35EF6C978BD5E040201040281A249A8F67E5AFC394F7BF31D1F1FC7BD7BF7D0DCDCFCC8E12ECF127B1ADFD3B0F7BA1491A7170E87CDC0154E28E5F014069A582C662643DB835B42A11080FBDB64D82B887CAF1D1B1B433E9F47341A85CBE5422A9542301884E3386695D2EFF79B8098C9644CB0E29451BE8732BCB147D0E7F3211008607C7CDCAC44B294341A8D9A5543E0C1201CAE4CB2DC351C0E174D736590B34B5FB9DD871DEAD833994C26013C28DB2D140A264CB3E792E7E0FB1FEF310CC4C0FD50C9E0583ACD35994C4EE8AD0C0683EAC31699845612459E61B5B5B5D8B2650BD6AF5F8F23478EA0A9A909555555457D20764F8D3DD080BD1FF6C8733B70F0430000D3E3F124C6C7C731323282175E78C17C881211996B18DCEC09A0D96CD66C27C39EC2542A65CA2659921F8944CCAA21CB2B1DC731A18E036562B198398EEFAFFCB900CC1611A55B3F3020DAE7E0B018AE1ADAA59DF6F5315002282A050550740E967CDAFD813C873DAD148009C15CE94BA552008A37B20F8542664B11FB1CF6764CDC1684A5ABFC7DB01F92FD9EFC7DDADB8570C591536245A4981E218B3CC3FC7E3F366CD880575E79053D3D3DB872E58A2903B23743B6FB11B3D92C52A994192FCE9BBE3D1CC02EB9E2CDFD49A4D3698C8C8C209D4E63C3860D5A49149139CDAE9CE0744EE0C1FB63A150300FDED81BC760C55E43F6C9D9259F5C09B38F6398E30037AEBE318CD9E7B0031457D8ECA0690F84E1D7ED6D20EC69A5F6C01D7BEF439EDB1E74664F75E6315C81B4BFCE9FC5925DFE7CBB07D19E4C6AF77BDA534DF9FB6789AAFDDF852BBAC440AA2135229353481479C62D5DBA143B77EE447D7D3DCE9F3F8FFEFE7E539EC4F1EAA51B0EF3A6CED098CBE54C4F0CBF6E3FE97DD292C6B1B1310C0F0FC3E572A9DC5444E6347BCA33C31F077BD9534DED0767F680160644BECF7ABDDEA25E4396AB72F5AD74781807B13048D9D341D97FC700C670666F49610F7EE1CFB1079531F095863496A6DA81943F8B5F6725893D00C79EA86A9F9B7F2D7DADF6E454FB77C5925AB227A1F23EC4FF1EF6B5F37B15104526A79028F28C0B0683686C6CC4A14387D0D3D383CB972F9B867F00662362F61EF2AFDC1791376006C64C26634A84F8D727BD090F0D0D61787818E170186BD6AC5148149139CD9EBAC94DEDF975AE6C45A35153E268975A06834113AC82C12092C964513F63329934E5FDC0833E3B6E4C6FAF0AB204937D852C13E53938399521C9EE99640926039E3DA59AC7F11A799CBDDAC7954DF65CDA25AA2C19E54A1F832AAF85219081D6EECDE4434B3BB8DA25B2F6E4D4743A6D7E1F0CE82C7DE5BDED69EE4D22CF02854411C182050BF09DEF7C07914804E7CF9F4757571732990C128984097FF626C57C22CB897BFC2B0365692FE293F67BDCBD7B17A9540ACF3DF71C62B198860B88C89CE572B94C38090402181D1D35A5F70C8E151515181B1B33C7F3FDB1A2A2C204479FCF677A1B39119581860193A18B935319CCF2F9BC1998C3F76A96A572600E57DEF8FE1C0A858AB6E2E0A6F67EBFDF4C4A652065C00C040248A55245AB9C8EE39849AB3C476949AC1D1C4BA7B1B23CB5B42496BF07FE5ED86BC8106BEF47093C08980C8E0CA7C964B2E8DEA43E44914753481411F8FD7EAC58B1023B77EE442291C0C58B17CDD35B9692A65229F3D7D2E0C8A7D80C8E1CB1CE0F199CBA3755434343C8E7F3686C6CD4144E1199F3EC3004C00C8B61588CC7E30060CA1E0120168B9920C6077176BF1FC30C278096F6F87102280053BACA6005DC0F44A150A868A80E832707E6F01A59D61908044CE8E5B9ED9E407BF22A83A0DFEF3701D35E81E4E4517B280F832307CAD8E18DBF1FE0C1564ABCDEC9022603A25D126BAF380228DA93510151E4F1E853978898BDABF6EFDF8FCACA4A5CB97205B76EDD32C367EC69720C871CAFCEBDBEF821C00E8E7CC2CC0F4853353C3C8C42A180C6C6C61978D52222D38FE12D180C9A60C450C730650F68B1431A503C5CC6DE7BD11E0E5328148ACEC1C0C9F7688655E041A92B57DEF8FD762927F0606593DF9BCD6601DC0FBAA5C1CA3EAE74308E1D6EED7E42E041AFA31DEA788D7C1DF6BE8AF63E8E7CEDA501DA0ECDEC872CDDE60240D1E45595998A7C39854411313A3A3AB07AF56A8C8D8DE1ECD9B345C36BD88B620F18B0FB1139E994C1914F94ED0F365391CD6671EFDE3DB8DD6E343434CCC4CB1511995676292857DC1866D807C8F7428647965ADA1BCBF3A19A3DA085A59AC4EA0DC7718A868AF1DCF6C469C7718A5A01F873F9BDFCBA1D5CED72551EC7E0C57B81FDFECE106AF7024E760E7E9DE7289D9CCA73D8935E1996190A193E1944EDC9B05C8DB5BFB7748AAB887C39854411316A6A6AD0DADA8ACACA4A7CFAE9A7A6478613E6B8E2C892529695DAFB28F269793A9D46269381E33826304E453C1EC7F8F838028100962D5B3643AF584464FA70858EA5A5DC5796E12D180C9AB0572814CCDE827EBFDF3C6CF37ABDA637902B6E3C8E2B6E2CB58CC7E3E6C11DC350381C36C3C718DE5C2E1742A190591D7CD8209C402080783C6ECA3CD9CB674F19056036A6071E0CEBE1D719FEB8572400138EF97359C6CAD7C4725086635E4B2A9532AF8BAFB174BF47AE0CF27BB99A694F6D6558554014797C0A892252E485175EC0E6CD9BD1DBDB8B3367CE606868088EE398C9A5F63E58A5C13110089801365C85B4571DA7D25778E7CE1D24120954545460E9D2A533F5724544A60507CB0030AB832CFFF4FBFD080683E6C1172B2F3C1E0F2291881912C6C9D1F178DC84211EC780C9324F0E62B1F72CF4FBFD181B1B2BDAECDEED7623168B211E8F9BE0C8F01689448A2697B237D2EEAD74B95C45A5B30CA7F68A1E7F1627ADDAE18D7D8F7670E439B8CAC969B076592A03A25D72CA706AF75672F88E1D1CB9CA58DA232A228F4F2151448A34343460D3A64DA8A9A9C1CF7FFE73333D2F9BCD9AB0C821362C2F0550D45BC2D1E576A92A9FA23F6E50BC73E70E1CC7415555156A6B6B67ECF58A884C0797CB85542A854C2663CA3633998CD97622954A15F5E8F1615A2291403E9F47381C36A59DEC9FCB66B3E6B8542A65FA08F9C02E180C9A154796A4F2DCF65E8DF6B6467CC8170E87914AA58AFA09ED3E40F6F88542A1A2AD23B8221708044CA509B7B6E0AA9FBDB2984EA78B7A2919F6F83ADC6E37C2E1301CC731BF47064C1E6797AEDAAB86BC0E7EDDEEFFB4A7A06A055164EA141245A448381CC6BA75EBD0DADA8ACECE4EDCBD7BD7EC51656F41C10F3ADC278BE5A57CF20D3CF830C21B373FC83C8EC1C141F87C3ED4D4D4687F4411991758DAC9D53DBB0492A58FF6DE871C5A63EF91C8B0C380686F0CCF00C40771EC03B4CFC12069AFB471A59161ADB49F90EFE7AC0EB1570DEDDE467E0FCB68794D2CA92DEDA5E4A018FBE120BFD79EFA5A3AF4CC3E07F11AED49D9F6B9799F01605EEBD36CC124F2AC534814910956AC58815DBB76E1DEBD7BB872E50A4647474D39296FEAEC25B19F0EF3C6CFE135FC2B6FE253195E73F7EE5D84C361AD228AC8BC606F186F4F78666F3757D8EC812CDCBE815B3970C5CC5EA1632507FBEC18F2EC499F7608E5B9EDA9A62C3FB587BB946E3DC19F6B5F234B53ED4138ECF12BDD3683F7047B5019CFC17FE643439698F27AED6B011E54A470C5D41E46533A94C79EA86A7F3F7FEF22F2641412456482FAFA7AB4B7B763D5AA553873E60CAE5DBB5614F2F8418865500C90A5C1914FC933990CD2E9B429497D1C232323884422A8A9A999A997292232ADB822C83253EE4DC89543EE1BC8815E2CC38FC7E345D34473B99C29C1E46A211FC4B1B2229D4E9BD5449660B2EC33100898F75F96FDDB8370383C67B2AD27EC2D34EC89AA7C1D1C66636F63C1954D3BECB19494AB911C7EC38137DC0AC49EBC6A6F0DC2F25C3BF406020153526B6F7BC1D257002684AAC454E4E928248AC8042E970B0B162CC0B7BEF52DF4F7F7E3D2A54B181E1E462693413299347D1EBC41DB4FD019183D1E0F028180F970647F00789C15C5B1B131040201545454CCC22B1611793A2E970BF178DCAC6CF1C158381C36C1919347594ACAC0C5FE3BE07E2F602412290A8E0C98D168D4F48373D58F3F973D898140C05471700A75329934C35D181C19EAD887E8F3F9904EA7110E874DBF39DFBB197A81FBC1D12EA3F5F97CE61CA5C131140A99B007C0AC2072100EAF857D850CA40C822C4565D09DACB792C36CEC725C054491A7A790282293AAAAAAC2EBAFBF8EEAEA6AF4F6F6E2EAD5AB45AB83E974DAF421A652A9A232537B1C3B9F1E73900D571CBFCCC8C88842A288CC2BF63E7FB95C0EB158AC68B2A7BDCD0557F1F2F93CA2D168D18A5E3A9D36E1CD9EE0C9E0C9F364B35933A194E59F004C9F23CB2E19B6ECED33780EBB1FD2EFF79BF7714E4E654064A863292A8F07600225AF95A18E5B77F0F701C0AC2CDA8375183CEDD6045E0BBF9FA5A70CC7BC3E7B6591AD0F22F2F414124564528140004D4D4D78FEF9E7313E3E8ECB972F038059192C2D2BE566D1F6201BDEF079D3B6C7963F0CCB8FF8E45B215144E6035654F0EF19ACECFE39061D56564C761CDF53B972C70A0CAE1ADABD7F9C62CA60C5E0694F28B537BBB7C3692E9733E7B083957D9CBDD97DE9501EBB0C95A1CD0EC0F6EBE6310CB7A54372ECE3EC73F05EC1EFE7EBE5FDC71E8CC3154CAD228A4C0F8544119914A791EEDBB70F9148043D3D3D181C1C342B811CB6C0A7B92CF5E18D9A4FCCB9F2C8210D5F7603CFE7F3666532140A99122C1191B9CC7EF8C520C87D06ED3248966A0230EF9F2CC3041EF4FE950E68B17BF70014AD3A3220F2587B988D1DF64AB7D6B0A79CDAE1ADF41CBCBED2AFDBAB9F640736BB9792D768EFB36B1FC750C807897CA8689FC3EE4FB407E6D8415444A68742A2883CD2AE5DBBD0D4D4848181017476760240D1CDDCED7623180C9A8D9CD987C8322996FFE47239539EFAA81B399F96F3C394FD814A44642EB3F748E4E6F50C43F610190620AFD78BF1F1F1090128140A2191489880C9553C7BC379965AF2811E00B3813CFB1CEDC065F71A72600E8F63E8626FA4BD317D369B0570BFBA8461D7EE67B47B2683C16051DF238FE7F53288F2380644FBDAB9E26A0758FB1C76E9AC5D12AB325391E9A59028228F54595989F6F6762C58B000BFFAD5AF4C29288727D87B22020F7A72F8943A100898E0C88136A57B2E96B29F1C3FEA381191B982A5A3004C7863A863B8E1E01A968372A80BF736E4C3B6B1B131F3108EAB80D16814E3E3E3001E6CFD5028144C3F2300D307C87D060198809848248A56101942ED8DE9239108128944D1EA207B26D9ABC8554A7BD22A0322DB0C18EA1CC70100332D950191535F19245939C27605BB8F91DF6B07479E835350B5822832FD141245E491DC6E373A3A3AB071E3465CBF7E1D172E5C3037E56C366B46B4279349131AF9C1C0EE35E120023E497FD8F01A7B25914F894544E63A7BE37A97CB854824624AE7396534954A4DD84C9E5B6230ACD9AB83934DF6B4FBFD780E6278B3571C59926A9766F23D36180C16F501F2BDDDEEADE48452F636B2CC33140A99C066F739FAFD7E3330070042A15051DF22AF91D526FC7B7B3F497B588FDD77C8AFFB7CBEA2D72122D34F215144BE54636323366DDA844824825FFCE21766EFACD2953E7E78E0CD9EAB8D9C7CCAD253BB7FA6941D12EDFE1B1191B98EC18FFB177205D12E9DE4CA192B2EECA9A43C26100898724F0623AE02DA7B0932A431BCF17BEDD24BBBD49565A500261CC7B600EE5F08C0F414F25AF8F31874ED9E497BD5CF7E1D0C8876C0E42A2730B187D19E8ECD73DBE7B05719A7B2F7AE884C8D42A2887CA9582C8675EBD661F3E6CD3871E2048687874DB90F4B48B94A688F80E70D9E1F96181C1F3581CE9E50A7954411994F18DE0098ED1FD883C8324A8642AEEA31C0D9BD7BA5418901D13E0FF745E48334AE06B2778F8370B8B2C9AD230098F76A1E670F81616863050807E6F09FD98FCEEFB5AFD55E29E4F01DFB5AECE34A4333AF89ECEFB587F2F07B151045669642A2883C96A6A626BCFCF2CBB875EB162E5FBE8CA1A1A1A227D8EC0FB17B0FD98B68DFFC39D4801F0E4AF1A93700F5248AC8BCC1D2CC42A180442261FA085951614FE1E48A1BF707E48A208775B12CD5DE57911BCEDB65A97C90660FC249241245036BF8FE6CBF57B37C95C191DF1F08048A822707F170E5906193A5AFF6FB3307E6D80131994C16AD0EBA5C2E730E064CFE5CAE9EDA1355011495BE72608E02A2C8CC53481491C7525F5F8FB6B636343636E2D4A953B872E50A52A91432990C92C964D15617F6F8727E7061700C0683F0FBFD8F9C5CAAC1352232DFB85C2E241209B382180E87118FC74D0F1D830F83A3E33845835BC2E13000988068F7F8F9FD7E2412090402015399C1F7531ECFEF650FA33D01D4E7F3C1711C134E798DEC6FE4FB7122913025AD2C31654F228326B7C3E0FE8E0C8E1C7863076096D4F27EC070CAD541AE6C864221F3757BBB10F63D0230BF3F4D3115991D0A8922F2583C1E0FEAEBEB71E8D021F4F7F7E3D6AD5B457D86DCE2229D4EC3711C33B081C11178506A644F402DC59544854411996FEC153D4E030D0683455B3FD81340791CB7A760292A87B20483C1A2924FBED7720A6A3A9D2E1A84C31539AEB631FC3120326072304E26933103641CC7291A8CC31547863D064797CB6586EDD821972B7DF6718140C0045A0066980D8323CB6EED95453B383290F2C1A302A2C8EC51B38F883CB6AAAA2ABCF1C61BF8D9CF7E86BEBE3EDCBE7D1BAB57AF367D30769F219F04DB6541D96C168140A0A8DFA59406D788C87C6497D0B3179B835B186EF8308DAB750C859C14CD124E8642AE06F2FD9065AB004C9F377B0BEDEF751CC7AC2EDA0FF3EC1E3FFEBD7D0E064A86C2D26D2F8007BD827C6FB707DBF035D97D8B7CED76E92B7F167F37ECD7E4CFE4F54D36D467BAFF9B85C361B4B7B7A3AEAE0E35353558BE7C79D1FE8E521EFCDF8B948F42A2883CB670388CD6D656AC5BB70E376EDCC0A54B97B07AF56AB301B23D7480A549C40F020C930F9B705ABA92A8C1352232D7F181587777B70933F97CBE688B0A7BA80BB79E607F228FB1B7A80887C366D5D15EB1E3F772988DBDBAE8F178CCCFE2715C51B4F71774BBDD45AB8BF60A683A9D36E1D61E28C3D2556EA9C1A0CB10C8077AF6001C86557B1B0BAFD76B7A2BED554786C7D2A13A5CD99CA95544AEC62E59B2047EBF1F77EFDEC5F1E3C71F3A815B66C7C8C808AE5CB952EECB78A6E9D397883C36EE75B877EF5EBCFDF6DBE8EAEAC24B2FBD84CACACAA20F32EC4BE1D364F2F97CE6A9B91D14271BD70E402B892232E7B9DD6E048341844221FCF4A73F2DF7E5887CA5D4D5D54D78E82CB343215144A6ECD5575FC5871F7E88AEAE2E9C3A750A2FBEF8A2D90F8C2B857C7A6C6F89C14D96ED91ED2E970BA954AA28286A0B0C11992F6A6A6AB077EF5ED4D6D69A899C22323D42A1101A1A1A1E3AE84E668E3E7D89C8942D5AB4089B366DC2B56BD770FAF469BCF4D24B660591836AD81BC3D5433B38DAA5A61C8C40A55B60A8E44744E6B270388CD5AB5763F1E2C51AAC2232CDDC6E37AAAAAA545554060A89223265814000EDEDED387FFE3CCE9D3B87818101545555156DD64C6C3E67392A07143038963E1DE4B0040649959888C85CE6F178108BC5108BC5CA7D292222D3468FE845E4896CDCB8111B376E443C1EC7A953A7CC443CEE89C82D2EEC2D2F800793F0388ABD74821C03A502A2888888487928248AC81359B468119A9B9BF1DC73CFE1A38F3EC2C8C888999EC770C77DB67C3E1F0281003C1E0F0281802941E5710A8422222222738742A2883CB1A6A626ECD8B10367CE9CC1AD5BB7303A3A8A542A854C26836432895C2E67560BD9B3C8C13576700C06831A5023222222324728248AC8135BB66C1976ECD801B7DB8D0B172E606868C84C37E5BE56994C06E9741A8EE320954A995253969932386A2551444444646E5048149127168D46B172E54AB4B7B7A3BBBB1B77EEDC81D7EB357F18FE1800EDE0C815466E162D22222222738342A2883C31B7DB8DDADA5A7CE31BDFC0D0D0106EDCB88144220197CB65F644F4F97CF0FBFD66CF4306C642A150B4650600AD268A888888CC010A8922F2542A2B2BF1F5AF7F1DA150083D3D3DB87AF5AAD9E790534A39E1D4EFF7C3EBF5C2EFF79BE0E8F3F9CC7617DA1351444444A4FCF4894C449E8ADFEF474343035A5A5A303C3C8C0B172E20994C229BCD22954AC1711CF3A7502898554386423B3896EE992822222222B34F2151449E8ACBE582D7EBC59E3D7BE0F7FBD1DBDB6B4A4E39D13497CBC1711C64B359A4D36964321964B3D909C151E5A622222222E5A7902822D362FBF6ED58B26409EEDEBD8B9E9E1ED38FE8F57AE1F178E0F1788AFA11ED29A70C908542A1CCAF4244444444141245645A34363662C3860D70BBDD3875EA1472B99CE945F4783C453D880C8CA5534F01A82F51444444A4CCF4694C44A685DBED466B6B2B962D5B86B367CFE2EEDDBB669B0B0EB00160B6C7F0F97C080402F07ABD080402263C7ABDDE32BF1211111191679B42A2884C9BD6D6566CDEBC19C3C3C3F8F8E38F71EFDE3DA45229D387984C2691CBE54C7064CF22F754E4001B11111111291F8544119936555555686E6EC6DAB56BF1BFFFFBBF482412A62711B85F569ACBE5904EA7914EA7CD04D46C366BFA13ED325411111111997D0A8922326D7C3E1FD6AE5D8B5DBB76E1D2A54BE8EDED452A952A5A29E4D617F6E4D37C3E6F82227B1335C446444444A43C141245645A2D5DBA142FBEF822229108CE9C3983818101130AEDE1353E9FCF04477BEA69A15030FD8B0A8A22222222B34F215144A6552412C1AA55ABB07BF76E7CFEF9E7E8EDED353D89004C2F22279FFAFD7ED38B688748959C8A888888948742A2884CBB9A9A1AFCCEEFFC0E1CC741777737AE5FBF6E7A0F93C9241CC741269381E33870B95C2638B214D5DE535144444444669742A2884CBB4824826DDBB661CD9A35B879F3262E5DBA8440206086D2140A0564B35964321933BCC60E8E22222222523E0A892232EDBC5E2F6A6A6AB07BF76EE4F37974777723954AC1ED76C3E7F39989A79C7A0AC00CB1B187D788888888C8EC5348149119B377EF5E2C5CB810376EDC404F4FCFA47B223238B24751436B44444444CA4B21514466CCE6CD9BB171E346388E834F3EF904C964D26C79C13E44006655D1E7F321100898A02822222222B34F9FC44464C6B85C2EBCF0C20B686A6AC2A953A770E7CE1DA45229F32793C998E0C83F22222222525E0A892232A35A5A5AB075EB56A4D369FCF297BF442A95323D8900CCAAA2E338701CC70CB451B9A9888888487928248AC88CAAADADC5C68D1BB16AD52A1C3B760C232323457D883E9FCFF42272F2A902A288888848F928248AC88C72BBDD58BD7A3576EEDC898B172FE2CA952B88C7E3663B0CBFDF0F8FC703AFD76B82A33DF55444444444669742A288CCB8868606BCFCF2CB088542F8F4D34F71FDFA75E472395356CA21365C51F47ABD66A88D88888888CC2E85441199717EBF1F4B972EC5EBAFBF8E9E9E1EF4F5F599E135D96C16C964128EE32093C998BE44AE348A888888C8EC5248149119E772B9505B5B8BB7DE7A0B2E970B972F5F467F7FBFD92791FD881C6093C964CCD744444444647629248AC8AC0887C3686D6DC5DAB56BD1DFDF8F4B972E99A135EC456460CCE572F07ABDDA2F51444444A40CF4094C446685C7E34175753576EFDE8D5C2E87AEAE2E8C8D8DA150289880C869A7B95CCE7C4D4444444466973E8189C8AC7AEDB5D7B068D122F4F6F6E2ECD9B348A7D3C8E7F3C8E57266804D369B55481411111129137D02139159D5D8D888F6F676783C1E7CF8E18748A7D3701C07E974DAFC7D2A9532A5A72222222232BBF4094C446695D7EBC59E3D7BD0D6D686CB972FE3F4E9D3701C075EAFD7EC8F98CD66151245444444CA449FC04464D6AD59B3061D1D1DA8ADADC5FBEFBF8FE1E1E1A2FD11F3F9BCF64A1411111129138544119975B1580C2D2D2DD8B973273A3B3BCD101BAE1CE6F379F5248A88888894893E81894859AC5EBD1A5FFFFAD711894470F4E8517CF1C517A62751836B44444444CA479FC044A42C02810056AD5A853FFEE33FC6F5EBD771F2E449DCB87103A9540AE974DAEC9D2822222222B3CB5BEE0B10916793CBE5C282050BF0E69B6FE2C48913E8EAEA42381C464B4B0BEEDEBD8B8A8A0A8442A109DF57281490CFE74DDF22FF1980197693CD66E172B9E076BB91CBE500DC1F9823222222225F4E9F9A44A46CFC7E3F962F5F8EB7DE7A0BFFFCCFFF8C53A74EE1F6EDDBB872E50A0E1E3C889A9A9A09DF93482470F6EC597CF2C927482412A63475C3860D78F9E597515B5B8BE3C78FE3FDF7DF87D7EB453018C49A356B70F0E0410DC311111111790C0A89225276AFBDF61A868787F1E31FFF18972F5F46341AC5F3CF3F8F458B164D38369BCD62686808E7CE9D434F4F0F4E9E3C8942A180DFFCCDDFC4D6AD5B515B5B8BAEAE2EFCCDDFFC0D366EDC88C6C64684C361E47239AD268A8888883C067D621291B20B87C3387CF830D6AE5D8BA3478FC2E7F361FFFEFD9386C4CACA4A1C387000BB76ED42676727FEECCFFE0C3D3D3DC8E57248A7D348A552A8AFAF475B5B1BFEFCCFFF1C2FBDF41282C1E0849F93CFE791C9648AB6DE1011111111854411992342A110DADBDBB169D326B85C2E84C3E14706B74824826DDBB6E1BBDFFD2E7EF0831FE0830F3E403A9DC6EFFDDEEFE11FFFF11FF1B77FFBB758B66C190281C0A4DF3F343484B367CF62E1C28568686840341A9DA9972622222232AF28248AC89CE072B91008041E1AEA1E76FCD7BEF6350C0C0CE0473FFA113EFAE823F4F6F6E29BDFFC2656AD5A05BFDF3F21685EB8700157AF5EC5E79F7F8ECECE4EFCD66FFD16EAEAEA141245444444FE9FB6C01091796DD1A245D8BB772F5A5B5B71F7EE5D9C387102894402C16070D27D16A3D128EAEAEA100C0671EDDA358C8D8D9909A822222222A2902822F35C369B45A150407D7D3D9A9B9B118BC5CC8A6232999C707C4343039E7FFE79B4B4B47C6949AB888888C8B348215144E6AD42A180DBB76FE39D77DEC1E0E020FEE00FFE005BB76E45676727FEF55FFF1557AF5ED52AA1888888C814A9275144E6A542A1804C2683EF7DEF7BF07ABD78E38D37D0D1D1818E8E0EFCE11FFE21FEEAAFFE0A3E9F0F796987900000078F49444154E17018CB972F2FF7E58A888888CC1B0A892232AF8C8E8EE2D2A54BF8ECB3CF70E1C2051C3D7A14070E1CC092254B5059598975EBD661E3C68D387EFC387EF8C31FE2E6CD9BD8BD7B37D6AF5F8FE5CB976BAF44111111912FA14F4B2232AFE47239C4E3718C8C8C00005A5A5AB066CD1AC46231B8DD6E844221B4B6B6E29BDFFC26028100BC5E2FEEDDBB8764328942A150E6AB1711111199FB141245645E09040258BC78313A3A3AE0F17890CFE7B160C102C46231734C4747079A9B9BE172B9502814100C0651535333E9B4531111111129A6902822F34A381CC6CA952BB172E5CA871EB375EBD687FEBB5C2E877C3E0FC77190CBE5E0380E1CC741369B85C7E3D1B45311111179E629248AC83365707010376FDEC4E9D3A771F3E64D9C3C7912959595D8BA752B962C5902BFDF5FEE4B14111111292B85441179A6140A0578BD5E6CD8B0017FFAA77F8A050B16A0BABA5A2B8822222222FF4F2151449E29D168141E8F07757575D8B2650B0A8502F2F93C2291083C1E4FB92F4F444444A4EC141245E499128D46118D46CB7D1922222222739646FD89888888888888A190282222222222228642A2888888888888180A8922223225F97C1EB95CAEDC97212222223344836B4444644AF2F93C86878771FDFA75D4D7D7A3B6B6168140A0DC9725222222D3442B892222326557AE5CC1F7BFFF7DBCFBEEBBE8EEEEC6E8E8281CC729F765898888C834504814119129F17ABD58B26409B66DDB86BFFCCBBFC4EFFEEEEFE27BDFFB1ECE9D3B57EE4B1311119169A07253111199B2DADA5ABCF4D24B58B3660DCE9E3D8B1FFEF087387EFC385A5B5BF1DA6BAF61CB962DA8AEAE2EF7658A8888C8135048141191290B040258BE7C390E1F3E8CFEFE7E9C3D7B16376EDCC0C58B17F1C5175FA0ADAD0D6D6D6D686E6EC6D2A54BCB7DB922222232050A892222F24482C1200E1E3C885FFCE217B875EB16060606D0DBDB8BDEDE5E7CF2C927D8B66D1BF6ECD983E79F7F1E0D0D0DA8ABABD3801B1111917940215144449E88DBED465D5D1D0E1C3880BEBE3EBCFFFEFBC8E7F30080FEFE7EBCF3CE3BF8F0C30FD1DCDC8C6F7DEB5BD8BD7B371A1A1A100C06E1F7FBCB7CF5222222F2300A892222F254F6EEDD8B0B172EA0B3B31377EEDC29FA77E3E3E3E8ECECC4C58B17B17AF56AECDFBF1FBFF11BBF81D6D6D6325DAD8888887C1985441111792AD168143B77EEC4175F7C81B7DF7EBBE8DF150A05388E03C77170EEDC390C0E0E6AC08D8888C81CA7902822224FC5ED76A3B9B919FBF6EDC3C71F7F8C6BD7AE219BCD4E382E9148A0A7A747036E444444E63885441111796A0B162C405B5B1B0E1C3880B7DF7E1B63636328140A931E9B4EA735E0464444640E53482CA34C2683F1F171DCBB77AFDC972222F2D4AAAAAAF0C61B6FE0BFFEEBBF303E3EFED09068D3801B111191B94721B18CCE9C39837FF8877FC0FFFCCFFF94FB5244449E5AA150C0E8E828EEDDBB67A69C3E2E0DB8111111993B141267512814427575352A2A2A303A3A8AAB57AF62707050655522F29591CBE5904C26A7FC7D8F1A7073F0E0416CDAB4099595953370C5222222524A217116757474C0E3F1E0D34F3FC50F7EF003C4E371C4E3F1725F9688C89C92482470F5EA55A45229D4D6D62297CB95FB924444449E290A89B3A8B5B5151B366C407373334E9C3851EECB11119976994C06DDDDDDC864324FF4FD6EB71B757575686868C0C68D1BB16BD72EAC5CB912A150689AAF544444441EC655789CC902326DB2D92CEEDCB983A3478F96FB524444A6553E9FC7E0E020FEE22FFE62CA03B9BC5E2F42A1102A2A2AB077EF5E7CE31BDFC0AE5DBB5053533343572B2222220FA395C459E6F57A515F5F8FD75F7FBDDC97222232AD86878771FCF871783C9E297D9FC7E3C1B265CBB07FFF7E1C3E7C182B57AE447575B5FAB5454444CA4421B10C3C1E0FC2E170B92F434464DA140A055CB87001FFF22FFF824422F158DFE3F57AB175EB56ECDEBD1B3B76ECC09A356BB06CD9328442A129074D111111993E0A892222F2D4AE5FBF8E4F3EF904C78E1D433A9D7EE8716EB71B55555558BF7E3DDADADAD0D6D686D6D656343535E9E1998888C81CA1902822224F2593C9A0B3B3133FFDE94F31383838E931930DA479F5D557515F5F0FBFDF3FCB572C2222228FA2902822224F65606000C78E1D9B74209706D2888888CC3F0A892222F254DE7DF75D1C3B760CA954AAE8EB1A48232222323F29248A88C813C966B3E8E9E9C1071F7C80AEAE2E7047250DA411111199DF1412454464CA0A8502E2F1387EF4A31FE1F4E9D3181F1F474D4D8D06D28888887C0528248A88C8942512095CBC7811FFF99FFF896C368BB6B6360DA4111111F98A50481411912929140AE8EFEFC77BEFBD87783C8E5DBB7669208D8888C8578842A288884C89E338181D1D85CBE5C2DFFFFDDFA3B1B1510369444444BE425C054E1A101111790CF97C1E636363181818C0A2458B3490464444E42B4621514444444444440C77B92F40444444444444E60E8544111111111111311412454444444444C45048141111111111114321514444444444440C8544111111111111311412454444444444C45048141111111111114321514444444444440C8544111111111111311412454444444444C45048141111111111114321514444444444440C854411111111111131FE0FAD8FEC59E4060ED00000000049454E44AE426082>|png>|0.45par|||>
      </document-at|<point|-10.9417912422278|2.85080698505093>>|<math-at|<very-large|<around*|(|\<xi\>,\<eta\>|)>\<mapsto\><with|font-series|bold|x><rsup|e><around*|(|\<xi\>,\<eta\>|)>>|<point|3.07064426511443|1.09477113374785>>|<math-at|<with|font-series|bold|x><rsup|e>
      <text|is a <with|font-series|bold|degree <math|k>> polynomial in
      <math|\<xi\>,\<eta\>>>|<point|2.66847466596111|-1.29707964016404>>|<math-at||<point|11.4123|-1.40485>>>>
    </equation*>
  </hidden>|<\hidden>
    <tit|Transformation of conservation law>

    <wide-tabular|<tformat|<cwith|1|1|3|3|cell-valign|c>|<cwith|1|1|1|1|cell-valign|c>|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|3|3|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-row-span|1>|<cwith|2|2|1|1|cell-col-span|3>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <math|<tabular*|<tformat|<cwith|2|2|1|1|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<with|font-series|bold|x>=<around*|(|x<rsub|1>,x<rsub|2>,x<rsub|3>|)>=<around*|(|x,y,z|)>>>|<row|<cell|<with|font-series|bold|\<xi\>>=<around*|(|\<xi\><rsub|1>,\<xi\><rsub|2>,\<xi\><rsub|3>|)>=<around*|(|\<xi\>,\<eta\>,\<zeta\>|)>>>>>>>
    </cell>|<\cell>
      <image|<tuple|<#89504E470D0A1A0A0000000D494844520000032800000292080600000039D2FF560000000473424954080808087C0864880000001974455874536F66747761726500676E6F6D652D73637265656E73686F74EF03BF3E0000002F744558744372656174696F6E2054696D650053756E6461792031342041756775737420323032322030363A30323A313620414D9AC821D30000200049444154789CECDD795C54F5FE3FF0178B20E2BEEF9AE60279DD502B3517C0049C1110079D145434C85253D38BDA62DAADF4AB95DA7523350371543496411141DC4553B4DCD30435F70544C48565E6F7873FCE7502811966E6CC30AFE7E3711F37CE19663ED6DB0FEF17E79CCFC74AAD56AB4144444444446402ACC51E00111111111151110614222222222232190C284444444444643218508888888888C86430A0101111111191C9604021222222222293C1804244444444442683018588888888884C06030A1111111111990C0614222222222232190C284444444444643218508888888888C86430A0101111111191C9604021222222222293C1804244444444442683018588888888884C06030A1111111111990C0614222222222232190C284444444444643218508888888888C86430A0101111111191C9604021222222222293C180424444444444268301858888888CEAD2A54B18366C18468F1E2DF65088C804D98A3D00222222B22C0F1F3E447474341C1D1DC51E0A1199205E4121222222A352A95400006B6BB62144541C6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D6706222222322A0614222A0D670622222232AAC2C242000C28445432CE0C44444464544557506C6C6C441E091199220614222222322ADEE24544A5E1CC4044444446C5804244A5E1CC4044444446C5804244A5E1CC4044444446C5804244A5E1CC4044444446C5804244A5E1CC4044444446C5804244A5E1CC4044444446C5804244A5E1CC4044444446C5804244A5E1CC40444415F2E9A79F22242404A74F9F167B286426D46A3500C0CACA4AE49110912962402122A20A898C8C44585818AE5FBF2EF650C84C14161602E04EF244543206142222AA10DEAE43DA62CD105169383310115185B0D9246DB16688A8349C198888A842D86C92B6583344541ACE0C444454216C36495BAC19222A0D67062222AA10369BA42DD60C1195863303111155089B4DD2166B86884AC3998188882A84CD26698B354344A5E1CC40444415C26693B4C59A21A2D270662022A20A61B349DA62CD105169383310115185B0D9246DA9D56A00AC19222A1967062222AA100614D2166B86884AC3998188882A84CD26698B354344A5E1CC40444415C26693B4C59A21A2D270662022A20A61B349DA62CD105169383310115185B0D9246DB16688A8349C19888848676AB59A2B3291D60A0B0B01B06688A8649C198888486745BF0907D86C52F9F10A0A11958633031111E98C018574515437363636228F84884C117F9A101191CE18504817BC824244A5E1CC4044443A6340215D30A01051693833101191CE185048170C2844541ACE0C4444A4330614D205030A11958633031111E98C018574C1804244A5E1CC4044443A6340215D30A01051693833101191CE8A36DC03B8642C951F030A11958633031111E98C575048170C2844541A5BB1074044A663DFBE7D3872E4083A75EA84214386883D1C32030C28A40B0614222A0D67062212ECD8B103B366CDC2D6AD5BC51E0A99090614D205030A119586330311098A9E2760D340E5C58042BA604021A2D270662022019B06D216030AE9A2A86EACACAC441E09119922FE3421224151D3C0D598A8BC18504817FC650811958633031109D83490B6185048179C6B88A8349C198848C0A681B4C58042BAE05C4344A5E1CC404402360DA42D0614D205E71A222A0D67062212B069206D31A0902E38D710516938331091804D03698B018574C1B986884AC3998188046C1A485BAC19D205EB86884AC3998188046C1A485BAC19D205EB46FF8A36DA25AA0C38331091804D03698B3543BA60DD54DCE3C78F919C9C8C59B366A1478F1E983E7DBAD84322D21B5BB1074044A6834D03698B3543BA60DD68EFE9D3A7484B4BC3A14387909C9C8C7DFBF6213F3F5F389F979727E2E888F48B018588046C1A485BAC19D205EBA66C8585853876EC1892929290929282D4D4543C7FFE5CE3350D1A3480ABAB2B5C5D5DE1E6E626D24889F48F018588046C1A485BAC19D205EBA664F7EEDDC3DEBD7B919C9C8CB8B838DCBE7D5BE3BCA3A323DE7EFB6DB8BBBBC3DDDD1DDDBA75E3BF43AA9418508848C0A681B4C59A215DB06E5E282828406A6A2A76EEDC899D3B77E2E4C99350ABD5C2793B3B3BF4EEDD1B6E6E6E70737343CF9E3D616BCBD68D2A3F563911098A9A062B2B2B914742E6828D26E9A268C5294BAC9B9B376F222121013B77EE447272321E3E7CA871BE75EBD6F0F0F080878707DCDCDC50BD7A7591464A241E06142212B0D9246DB1664817457563636323F2488CE3ECD9B3888F8F8752A9446A6AAAC606A7B6B6B678F3CD3721954AE1EEEE8EEEDDBBF3974464F118508848C06693B4C59A215D54F6BAC9CBCBC3BE7DFB10171707A55289AB57AF6A9C6FD3A60D3C3D3DE1E9E989810307A25AB56A228D94C83431A01091A0B2370DA47FAC19D24565AC9BCCCC4CECDEBD1B4AA512717171C8CECE16CE595B5BA35BB76E904824904AA57071711171A444A68F0185880495B16920C362CD902E2A4BDD646464202E2E0EF1F1F1C5F625717070809B9B1BA452292412099A366D2AE24889CC0B030A11092A4BD340C6C39A215D986BDDA8542A9C3C79124AA512F1F1F1484B4BD338DFA04103787878402A95C2D3D3930FB813E98801858804E6DA3490785833A40B73AA9B274F9E60F7EEDDC243EEB76EDDD238EFECEC2C5C25E9D3A70F1F7027D203061422129853D340A6813543BA30F5BAB979F326944A25626363B167CF1E3C7BF64C38676F6F8F01030660E8D0A190482468D9B2A5882325AA9C1850884860EA4D03991ED60CE9C214EB263D3D1D4AA512515151C59602AE5BB72EDCDCDC209148E0EDED8D5AB56A893852A2CA8F01858804A6D834906963CD902E4CA16E542A158E1E3D8A989818C4C4C4E0E2C58B1AE75F7FFD75F8FAFA422A95A277EFDE16B3670B9129604021228129340D645E5833A40BB1EAE6F9F3E73870E000944A25B66EDD8A9B376F6A9C777676864C26E352C0442263402122019B4DD25661612100D60C69C798734D56561692939385674A1E3D7A249CB3B1B1C15B6FBD05994C063F3F3F346FDEDCE0E321A2B231A01091800185B4555433BCFD85B461E8B9E6EEDDBBD8B97327A2A2A2B06BD72EE4E5E509E7AA55AB06575757C864320C1D3A14B56BD736C8188848770C2844246040216DB166481786A89B971F723F7CF830D46AB570AE687F12994C8677DF7D17F6F6F67AFB5C22D23F06142212B0D9246DB1664817FAA89B828202E17992D8D858A4A7A76B9C77727282B7B7377C7C7CD0AB572FEE4F42644618508848C06693B4C59A215DE85A37B9B9B9484949417C7C3C62636371E7CE1DE19CB5B535BA75EB068944027F7F7F383B3BEB75CC44643C0C28442460B349DA62CD902EB4A99BA25BB7944A25F6EFDF8FFCFC7CE19C838303DCDDDD21954A3174E850346AD4C860632622E361402122019B4DD2166B8674515ADD141616E2E8D1A3888F8F8752A9C499336734CE376EDC1812890452A914EEEEEEA856AD9A51C64C44C6C380424402369BA42DD60CE9E29F7593999989DDBB770BCB01DFBA754BE3F56DDAB4814422814C2643EFDEBD596F44951C030A1109B8A705698B018574515437919191983D7B368E1E3D2ACC3F0060676787FEFDFB432A95422A95A275EBD6228D9488C4C080424402369BA42DD60C95574E4E0E929393B163C70E3C7CF81000101616269C6FD6AC19BCBCBCE0E9E989418306A17AF5EA620D958844C6804244026EBA47DA6240A1D29C3F7F1E3B76EC404242020E1C38A0B161220074EEDC1923468C80979717BA76ED2AD22889C8D430A0109180CD26698B35432F7BF2E409F6EEDD8BEDDBB7232121011919191AE7EBD7AF8FC1830763DBB66D78F6EC197EFAE927F4EAD54BA4D11291A962402122019B4DD2166B8632323290949484E4E464242424E0F1E3C71AE79D9D9D8515B7060C18005B5B5B4447470360DD1051C918508848C06693B4C59AB13C797979D8B76F1F121212B07DFB765CBC7851E37CEDDAB53168D020787A7AC2D3D3138D1B372EF61EAC1B222A0D030A1109D83490B6583396A1681960A55289B8B8386467676B9C2F5A06582A95A25FBF7EB0B3B32BF5FD583744541A06142212B069206DB1662AAF4B972E212E2E0E4AA512070F1ED45806D8D1D111EEEEEEC2AA5B2D5AB4D0EABD593744541A06142211656565A14E9D3A620F43C0A681B4C59AA93C542A154E9E3C09A55289F8F878A4A5A5699C6FD8B021060F1E0CA9540A2F2F2F383A3A56E8B300D60D11958C01854844C3870FC79C3973E0E6E626F65000B06920EDB166CC5B6E6E2E121313A1542AB17DFB76DCBB774FE37CB76EDD20954A3174E85074EFDE1D5656567AF95CD60D1195860185484467CF9EC5D0A143111D1D8D77DF7D57ECE1B06920ADB166CC4F666626E2E3E3111F1F5F6CD52D5B5B5BBCF9E69B90C96418366C98D6B76E954751CD00AC1B222A19030A91489E3E7D8ABB77EF42AD56432A9562F3E6CDF0F1F111754C6C36495BAC19F3F0F7DF7F232121014AA512898989C8CFCF17CED5AD5B176E6E6E904824F0F6F646AD5AB50C3A96979F65E1A6B0445412061422915CB972056AB51AC08B653B478C18818D1B37C2CFCF4FB431B1D9246DB1664C577A7A3A944A25A2A2A270F8F06161BE0180162D5AC0D3D3131289041E1E1EA852A58AD1C6C52B28445416061422915CB97245E3EBBCBC3C8C1C3912E1E1E190CBE5A28C89CD26698B35635ACE9E3D8BA8A828444545E1DCB9731AE78A960296C964E8D3A78FDE9E27D116030A11958501854824FF0C2800505050808080003C7FFE1C63C78E35FA98D86C92B65833E252A954484D4DC5D6AD5BB16DDB36FCFDF7DFC2392B2B2BF4E8D103C3860D838F8F0F3A76EC28E248FF87018588CAC28042249292020AF0E2FEECA0A020E4E4E460F2E4C9461D139B4DD2166BC6F8542A150E1F3E8CA8A8286CDBB60D376EDC10CED9D8D8E0ADB7DE824C26839F9F1F9A376F2EE2484BC68042446561402112494646C62BCFA9D56A7CFCF1C7282828C0B469D38C3626369BA4ADA2E71A5833865558588883070F0A574A6EDDBA259CB3B3B3839B9B1B860F1F0E6F6F6FD4AB574FC491968D018588CAC280422492575D4129A256AB317DFA74E4E5E5213434D428636240216DB1660CE7E52B255151511AA1E4E52B25EFBDF71E1A346820E248B5C38042446561402112495901A5C8AC59B390959585050B1618764060B349DA63CDE8974AA5C2BE7DFBB079F366444747E3EEDDBBC2397B7B7BBCFBEEBB90C964183A74A8C1970336140614222A0B030A91087273738BEDD85C9A850B1742A552E1FFFEEFFF0C382A369BA43DD68C7E9C3D7B16111111888888C0CD9B3785E355AB5685BBBB3B64329951F62831060614222A0B030A91084A7BFEE455162D5A84C78F1F63F9F2E5065B1E94CD26698B35A3BBB367CF42A15060D3A64DB87CF9B270BC6AD5AAF0F4F4844C26834422418D1A35441CA5FE31A01051591850884450DEDBBBFE69E5CA95282828C0AA55AB0CF2839DCD2669AB685770D64CF95CBB760DD1D1D1888A8AC2A1438784E32F3F53326AD428D4AF5F5FC4511A16030A11958501854804BA061400F8E9A79F909B9B8B5F7EF905B6B6FAFD2BCC8042DA62CD94EDC18307D8B66D1BC2C3C38BEDE8EEE2E2828080008C1831028D1B37167194C6C380424465614021124145020A006CDCB811050505D8B06103AA54A9A29F4181CD2669AFA8666C6C6C441E896979F8F021E2E2E2101515859D3B77A2A0A04038E7ECEC0C994C86808000B46DDB56C4518A83018588CAC2804224828A061400D8B2650B9E3C7982AD5BB7C2DEDEBEC2EFC7A68174C150FB3F4F9F3E45727232222222101B1B8BBCBC3CE15CEBD6AD3162C4088C1D3BD6647674170BE71A222A0B030A9108F4115000203E3E1EBEBEBED8B66D1B1C1C1C2AF45E6C1A4817961E500A0B0BB167CF1E84878723262606393939C2B966CD9AC1CFCF0F32990C7DFAF431D8E216E686730D11958501854804FA0A2800909090002F2F2F28954A54AF5E5DE7F761D340BAB0C480F2F2068A0A854263C9F03A75EA402291402693C1CBCB8BB7BE9580730D1195850185C8C8727272F0E0C103BDBEE7DEBD7BE1E5E585F8F878D4AC5953A7F760D340BAB0A48072F4E85128140A6CD9B2456357F79A356BC2C7C70723478EC4A04183F4BE784565C3B98688CAC25994C8C8F479F5E465070E1C8087870712121274DACC8D4D03E9A2B20794EBD7AF23323212EBD6ADC3C58B1785E3F6F6F618346810643219FCFCFCE0E8E828E228CD0BE71A222A0B030A9191192AA000406A6A2ADCDDDD91989888BA75EB6AF5BD6C1A48179531A03C7AF408DBB66DC32FBFFC8203070E087F465B5B5BB8BBBB432E97C3C7C747E7AB95968E730D1195850185C8C80C195000E0F8F1E318387020929292D0B061C3727F1F9B06D24565092845CF9544444460E3C68D78FCF8B170CED9D9198181811833668CC5EC5562484535636565C5850388A8440C28444696919161F0CF3875EA14060C1880DDBB77A3499326E5FA1E0614D285B9079473E7CE61CB962D58BF7E3DAE5EBD2A1C6FD2A409643219020303E1E2E222E2082B1F73AF1922323C0614222333F4159422E7CF9F47FFFEFDB17BF76EB468D1A2CCD733A0902ECCB1D9CCCCCCC4D6AD5B111E1E8E43870E09C7AB56AD0A777777040606C2C7C747AF9BA0D2FF9863CD10917131A0101999AE01E5EDB7DF869D9D1D4E9C38A1B1D742692E5DBA847EFDFA21252505AFBDF65AA9AF6540215D984BB3F9FCF973ECDAB50B111111888989417E7EBE70CEC5C505010101183D7A34EAD5AB27E2282D83B9D40C1189870185C8C8740D2875EBD6457C7C3C542A152E5CB880E3C78FE3F8F1E33876EC18FEF8E30F3C7DFAF4959FD7AF5F3FECDEBD1BEDDBB77FE5FB33A0902E4CBDD94C4B4B437878382223233596F76ED9B225E47239DE7FFF7DB46DDB56C4115A1E53AF1922121F030A9111656767232B2BABCCD7F5ECD9137DFAF4C192254B8463BB76EDC2FDFBF751BF7E7D383B3B0B0FEE0240414101CE9C39230496E3C78FE3F4E9D3C26F89AF5FBF8EFEFDFB233939196FBCF146899FC98042BA30C566F3DAB56B50281458B3660DFEFAEB2FE178EDDAB521954A111818083737373EA02D1253AC1922322D0C284446549E07E49B3469825F7FFD158F1E3DD20828F9F9F9D8BA752B3EF8E08362DF636B6B8BAE5DBBA26BD7AE98306182F0FA8B172F222D2D4DF89F9B9B1B944A257AF6EC59EC3D0A0B0B857FE6EED7545E2FAFC824A6ECEC6CC4C6C622222202BB77EF865AAD06F0A296070E1C888080000C1F3E1CD5AA5513759CC48042446563402132A29757092A89838303E2E2E2D0BC79730040E7CE9D71EAD429E1FCC68D1B4B0C2825A952A50ADE78E30DBCF1C61BC29596C78F1FBFF216335E41215D88D96C16161622313111EBD7AF8752A9C4B367CF84733D7AF440606020468E1C89060D1A187D6CF46A0C28445416061422232AED0A8A959515D6AC59831E3D7A08C7468E1CA911500E1E3C882B57AEA075EBD63A7D7EF5EAD5D1A953A712CF31A0902EC468362F5DBA84C8C8C8624B03376DDA14C3870FC7B871E3D0B56B57A38D87B4C380424465E1EC406444A53D20FFD9679FE1BDF7DED338366AD4288D5B67D46A35366FDE6C90B131A0902E8CD56CE6E6E662FDFAF5E8D7AF1F3A74E88079F3E6E1EAD5AB707070C0E8D1A391949484BFFFFE1B4B972E6538317145B793729E21A257E1151422237A5540F1F5F5C5975F7E59EC78CB962DD1BB776F8DBD1A140A05424343F53E360614D285A1034A5A5A1AC2C2C2A050283496D7E6D2C0E6ABA866F8AC1B11BD0A030A9111951450BA76ED8A888888573678EFBDF79E4640F9E38F3F70F6ECD957AEC6A52B0614D2852102CAEDDBB7B179F366AC5BB74EE316C73A75EA40269361E2C489BC4A62C6788B17119585B3039111FD33A0346AD408B1B1B17074747CE5F7C864B2623B5A2B140ABD8F8D018574A1AF66B3B0B010C9C9C9F0F7F747CB962D3175EA549C3A750AD6D6D6707777C7962D5B70FBF66DAC5EBD9AE1C4CC31A0105159383B101949666626B2B3B385AFEDECECB065CB16B46CD9B2D4EF6BD0A001DCDDDD358E6DD8B0415846555F18504817156D362F5CB88059B366A159B36618346810A2A2A2909F9F8FF6EDDB63EEDCB9484F4F47525212643219ECECECF439741209030A119585B7781119C93FAF9E2C5FBE1CFDFAF52BD7F7CAE572242424085F5FBD7A15478E1CC1DB6FBFADB7F1BDBC9F85D87B5A90F9D0A5D97CF4E8116262628AED59E2E0E000894482E0E0606EA4588931A01051591850888CE4E580121A1A2A6CA8581EC3860DC3C48913919B9B2B1C5328140609286C1A481BDAD44DD103EF9191911AB5ECE2E282E0E060C8E572D4A851C3606325D3C0B98688CAC2D981C8488A028A878707BEFEFA6BADBED7D1D111128944E3D8A64D9B505050A0AFE1B169209D945537376FDEC4C2850BD1AE5D3BF4E8D103616161C8CDCD4593264D3065CA149C3A750AC78F1F47707030C38985E05C434465E115142223B972E50A9C9C9CB069D3269D96D794CBE51A7BA0DCBB770FBB77EFC6E0C183F5323E360DA48B92EA262F2F0FB1B1B158BB762D92929284D7D8D9D941229160DCB871F0F4F4E432B3168A730D1195850185C8481E3D7A84B8B838D4AA554BA7EFF7F4F444BD7AF5F0E0C103E19842A160402151BD5C37172F5EC4BA75EBF0F3CF3FE3EEDDBBC26B9C9C9C3066CC188C1B370E0D1B36146BA8642238D7105159383B1019C9575F7D85D75F7F5DE7EFB7B3B3839F9F9FC6B1E8E8683C7DFAB4A24303C0A6817453749BE1F7DF7F8F8E1D3B62E1C285B87BF72E6AD6AC899090101C3D7A14E7CE9D43686828C30901E05C434465E3EC4064242D5AB4A8F07B8C1C3952E3EB478F1E213E3EBEC2EF0BB06920ED9C3F7F1EB366CDC2B163C70000972E5D825AAD868B8B0B56AF5E8D1B376E60D5AA55E8D5AB97C8232553C3B98688CAC25BBC88CC48FFFEFDD1BC79735CBF7E5D38A650282093C92AFCDE6C1AA82CCF9E3D8352A94458581892939335CEF5EFDF1F4B962CE1268A5426CE35445416CE0E4466C4DADABAD85594EDDBB7233333B3C2EFCDA6815E252D2D0D21212168D8B021FCFDFD8570E2E2E282D6AD5B0300C68D1BC77042E5C2B98688CAC2D981C8CCC8E5728DAFF3F2F2101D1D5DE1F765D3402FCBCECE46585818BA77EF2E2C0F9C939383468D1A61CA9429387DFA348E1F3F8E7AF5EA0160DD50F971AE21A2B2F0162F2233D3BD7B77383B3BE3DCB973C231854281F1E3C757E87DD9341050F2668AD6D6D6707575457070307C7C7C50A54A15E1F5AC1BD2166B8688CAC280426486468C1881B973E70A5FEFD9B307376EDC40B366CD747E4F360D96EBE1C387D8B2650BFEFBDFFFE2F4E9D3C2F1A64D9B2220200021212178EDB5D74AFC5ED60D698B35434465E1EC406486468D1A052B2B2BE16B954A852D5BB654E83DD9345816954A8583070F222424044D9B36454848084E9F3E0D6B6B6BB8BBBB63CB962DB87AF52A162C58F0CA7052F43E00EB86CA8F35434465E115142233D4B66D5BF4ECD913BFFDF69B704CA15060DAB4693ABF279B06CB70EBD62DFCFCF3CF58BB762DD2D3D385E36DDAB4C1F8F1E33176EC58346DDAB4DCEFC7BA216DB16688A82C0C2844664A2E976B049463C78EE1E2C58B68DFBEBD4EEFC7A6A1F252A95448494941585818626262909F9F0FE0C5E69FDEDEDE080808809797176C6C6C747A6F807543E5C79A21A2B2707620325323478E2CD6502A140A9DDF8F4D43E573FBF66D7CFBEDB768D7AE1D060D1A84A8A828E4E7E7A363C78EF8EEBBEF70E3C60D6CD9B20552A954A77002B06E487BAC19222A0B67072233D5B871630C1C3850E3D8860D1B747E3F360D95C7C18307E1EFEF8F962D5B62CE9C39484F4F879D9D1D64321992929270EEDC394C9F3E1DF5EBD7AFF067B16E485BAC19222A0B6FF122D2B32B57AEE0A79F7EC2912347909D9D8D1A356AA06BD7AEF0F7F7C7DB6FBFADD7CF92CBE51A3B7AFFF5D75F484B4B838B8B8BD6EFC5A6C1BC656565212A2A0A4B972ED55882BA5DBB76183F7E3C828282D0A04103BD7F2EEB86B4C59A21A2B2707620D2A3152B5660C08001A855AB16BEFEFA6BFCF4D34F18316204626262D0BB776F787B7BE3E1C3877AFBBCE1C387C3C1C141E398AEB779B169304F45BBBC376BD60C2121213877EE9CC6D5923FFFFC13A1A1A106092700EB86B4C79A21A2B2F00A0A919E6CDEBC192B56ACC0D1A347D1A85123E178B76EDDE0EFEF8F77DE7907717171F0F2F2C2FEFDFB616B5BF1BF7E356BD684A7A7277EFDF557E19842A1C0C2850BB57EA6804D83F928DAB7E4C71F7FC499336784E3AFBFFE3A264C988071E3C6A161C38646190BEB86B4C59A21A2B2707620D203B55A8D59B36661ECD8B125FEA6BA6EDDBAF8F1C71F0100A9A9A9080F0FD7DB67CBE5728DAF6FDEBC89FDFBF76BFD3E6C1A4C5FD1D592A27D4BCE9C39031B1B1B61DF920B172E203434D468E10460DD90F65833445416CE0E447A70E5CA155CB972053367CED4D8E1FD65FDFBF747D5AA5501007171717AFB6C8944825AB56A691CD3E5362F360DA6293B3B1B616161E8DCB9337AF4E881B0B0303C7DFA14CD9A354368682832323290949404994CA6F34A5C15C1BA216DB16688A82C9C1D88F4C0D1D151680E3333334B7C8D8D8D8DB001DEEDDBB7F5F6D955AB5685AFAFAFC6B1AD5BB7E2F9F3E75ABD0F9B06D3F2CFAB25A74F9FD6B85A52B4CB7B8B162D441D27EB86B4C59A21A2B2F01914223D68D8B021E2E2E270F2E4497CF8E18725BE263F3F1FD7AF5F0700346FDE5CAF9F2F97CBB17EFD7AE1EBACAC2CECDCB913DEDEDEE57E0F360DE2CBCECEC6E6CD9BB17CF9729C3A754A38DEAC59338C1E3D1A1F7EF8215AB66C29E2088B63DD90B658334454160614223DF1F2F2829797D72BCFEFD9B307797979008A3F3752516E6E6E68DCB8B1C695198542C1806226D2D2D210161686C8C848E4E6E60278F1DFC1D5D515C1C1C1F0F5F5D5CBA20A86C0BA216D1516160260CD10D1AB99E64F3CA24A46AD56E3EBAFBF06F0E2599461C386E9F5FD6D6C6CE0EFEF8F65CB9609C7626363919D9D5DECF9945761A3695C8F1E3DC2A64D9BB072E54AFCFEFBEFC2F1A64D9B2220200013274E44AB56AD441C61F9B06E485B453523C6337B096A7100002000494441545344641EF81385C808962F5F8EFDFBF7A343870E888A8A82959595DE3FE39F57659E3D7B86D8D8D8727F3F7FAB691CFF7CB6E4F7DF7F87B5B575B1674BCC219C000C28A43DD60C1195855750880C6CCF9E3DF8E4934FE0E2E282B8B838836D98F7D65B6FA15DBB76B874E992704CA150203030B05CDFCFA6C170727272A05028B06AD52A9C3C795238DEA44913040606E2830F3E40EBD6ADC51B6005B06E485BAC19222A0B67072203DABB772FA45229241209F6EDDB27ACE2652823468CD0F83A39391977EEDC29D7F7F2B60BFDFBE7D59293274F9678B5C45CC309C06693B4A756AB01B06688E8D5383B1019C8FEFDFB21954A317EFC78444545C1D1D1D1E09F396AD4288DAF0B0A0A10151555AEEF65A3A91F393939080B0B838B8B8BB06FC9E3C78FD1B87163848686E2AFBFFE12F62DA952A58AD8C3AD30D60D698B35434465E1EC406400494949F0F6F6C6F2E5CBB174E9528D1FC4E9E9E998316386413EB763C78EE8DAB5ABC6B1F26EDAC8A6A1624E9C3881909010346BD60C2121213871E204ACADAD3178F0606CDBB60D7FFFFD37162C5880D75E7B4DECA1EA15EB86B4C59A217DC8CBCBC3810307F0E5975FE2FCF9F3620F87F48CCFA010E959626222DE7FFF7D28954AF4EDDBB7D8F923478EE0D1A34706FB7CB95CAEB12A546A6A2A323232CA6C8CD93468EFD9B367502A95080B0B437272B270BC51A346183B762C828383D1A64D1B11476878AC1BD2166B8674A152A970FEFC791C3A7408C9C9C9D8B56B17B2B3B30100356AD480939393C823247D624021D2A31D3B76E0C30F3FC4BA75EBD0B46953A4A7A76B9C7FF8F021D6AF5F5FEA7E29152597CB317BF66CA10950ABD55028149833674EA9DFC7A6A1FCFEF8E30FAC5EBD1A91919142D8B4B2B2829B9B1B424242E0EDED5D296EDF2A0FD60D698B3543E575FEFC79A4A4A4202525057BF7EE456666A6C6F96AD5AAA14F9F3E66FD1C1F958C01852C5E6161212E5EBC888C8C0C6193BC5AB56AA171E3C67072722A77A3999090003F3F3F3C7BF60C83060D2AF5B586BAC50B005AB46881BE7DFB62FFFEFDC2B10D1B3630A054D093274FB079F366AC5EBD1A478F1E158E376CD81063C78EC5FBEFBF8FD75F7F5DC4118A837543DA62CDD0AB3C7CF810494949D8B9732712131371E3C60D8DF3B6B6B6E8D5AB17DCDCDCE0EAEA8AB7DF7E1BF6F6F6228D960C8901852C565A5A1ABEFCF24BA4A4A4E0C9932725BEC6DEDE1E83060D424848082412C92BDFEBC68D1BF0F1F111768A2F8BB3B3B34E632E2FB95CAE1150CE9F3F8F53A74EA173E7CEAFFC1E360D253B73E60C56AF5E8D888808E176022B2B2B0C1C3850D8E5DDCECE4EE4518A877543DA62CD5011954A8593274F62E7CE9DD8B973278E1C3982828202E1BC9595153A77EE0C575757B8B9B9A15FBF7EA851A386882326636140218B74E4C8110C183000CF9F3F07004C983001B367CF469D3A7550585888F3E7CFE3C71F7F44545414E2E3E3111F1F0F6F6F6F6CDCB811D5AA552BF67E75EBD6C5E1C387CBFDF9CD9A35D3DB9FA524FEFEFEF8F8E38F35029342A1604029A7BCBC3CFCFAEBAF58B162050E1C38201CAF5FBF3EC68C1983E0E060B46FDF5EC4119A06B55ACD2563496B9C6B2CDBFDFBF791949484848404242626E2EEDDBB1AE71B356A84C18307C3C3C303EEEEEE06DB3B8C4C1B030A59A4254B9608E1040062636311161626ECF0FECE3BEFE09D77DEC1071F7C80D5AB570BAF19356A14A2A3A38BBD9F8383035C5C5C8C33F872A85BB72EDE7DF75DC4C7C70BC7366EDC886FBEF9E695BBD8B36900AE5DBB86D5AB5763EDDAB51AFBC7F4EBD70F212121F0F3F3E3ED042F29AA19C0B2EB86B4C3B9C6F29C3973064AA512717171F8EDB7DF34E60E5B5B5BBCF5D65BF0F0F080878707BA77EFFECA9F5364391850C8223D7CF850E3EBECEC6C141616C2D656F3AFC4FCF9F3F1D34F3F0993694C4C0CF6EDDB87FEFDFB1B6DACBA92CBE51A01E5DAB56B3874E850892B8B0196DB34A8542AA4A4A4202C2C0CD1D1D1C2ED05356AD4805C2EC7471F7D54EA95274BC68042BAB0D4B9C69214161622353515F1F1F1888989C19F7FFEA971BE61C386E8DFBF3F241209A45229EAD4A923D248C95431A090451A3E7C3812131385AF7D7D7D8B8513E0C524DABC79735CBB764D38A6542ACD22A0F8F8F8A07AF5EA78FCF8B1704CA15030A0FC7F0F1E3CC0CF3FFF8C55AB56E1F2E5CBC2F1CE9D3B63E2C489183D7A34AA57AF2EE2084D5F6161A1F0CF363636228E84CC89A5CD3596E2E1C387484848405C5C1C76EEDCA9F18B406B6B6BF4E8D103DEDEDE18326408BA74E922E248C91C30A090459A3061026AD6AC89A4A42438393961E2C489AF7C6DAB56AD3402CACBFF6CCAAA55AB066F6F6F4446460AC7B66CD982254B9694B83299A5340D696969080B0BC3860D1B84C511ECECECE0EDED8DE0E060B8BBBB8B3C42F3C12B28A40B4B996B2CC1952B57B06BD72E28954AECDAB54BE3B9C7AA55ABA26FDFBE904824183E7CB8C19FBDA4CA8501852C96BFBF3FFCFDFD4B7D4D414141B11FA2F9F9F9861C965EC9E5728D8052F4706249FBB054E6A6A16843C5254B96682C66D0AC59334C9830011F7EF8211A366C28E208CD13030AE9A232CF35955DD1AA5B4AA512F1F1F13871E284B05006F06221114F4F4F48A55278787870C52DD219030A59BC8282021C3B760CA9A9A93879F224D2D3D371FDFA7564656521272747ECE155C8E0C183D1B061438D5552140A85C504944B972E61EDDAB558B3660D1E3C7800E0C59FCFD5D5555822B8A45BFBA87C185048179571AEA9CC9E3E7D8A43870E41A95462EBD6ADB879F3A6C6F9366DDA402291402693A177EFDEFCEF4A7AC19FCC64B1323232B074E95228140AA181B7B3B3C3C08103F1FEFBEFE38D37DE4093264D3063C60C1C3A7448E4D1EAC6D6D6167E7E7E58B972A5702C3A3A1AB9B9B9707474D4786D65691A0A0A0A101B1B8B952B5722252545F8ED5EFDFAF511141484909010B469D346E451560E0C28A48BCA32D75466B76EDD427C7C3CE2E2E2B07BF76E3C7DFA543857A54A15F4EFDF1F52A91452A914AFBDF69A8823A5CA8A01852CD2F7DF7F8FCF3FFF5C7806A14A952A080D0DC5D4A95351AF5E3D8DD73A3838883144BD91CBE51A01253737174AA51223478ED4789DB9EF6771FBF66DFCF2CB2F58B16285C673422E2E2E080E0EC6E8D1A34BDCC38674C78042BA6040314DE9E9E9502A95888A8A426A6AAAC6DFEF3A75EAC0DDDD1D12890443870E45EDDAB5451C2959020614B238DF7CF30D3EFDF453E1EB2A55AA202929C92C56E6D245DFBE7DD1BA756B5CB9724538A650288A0514736D1AF6EFDF8F65CB96213636565822D8D1D111A3468DC2C48913D1B56B579147587931A0902ECC75AEA96C542A157EFBED37C4C4C420363616172E5CD038DFB66D5B0C1D3A1452A914EFBCF30E6F8725A362B59145C9CCCCC4FCF9F3358E4D9932A5D470F2F20380E6C8CACA0A23468CC0C2850B856309090978F0E081C6D522736A1AF2F2F2101B1B8BEFBFFF1E478E1C118EB76FDF1E41414178FFFDF751B76E5D1147681918504817E634D754360505053872E408A2A2A2B06DDB36DCB87143E3BCB3B333643219A452A9496D3E4C968701852CCA9123473476900750E6B2B22F3F606EAEE472B94640C9CFCFC7B66DDB101C1C2C1C3387A6E1EEDDBB58B56A1556AE5C89DBB76F0378B1FF86B7B737264D9A84010306186407E2DCDC5C2C5AB4088181817C7EE5250C28A40B73986B2A93A2FD49626262909090A0B1F84B952A553060C000F8F8F860E8D0A168DEBCB9882325FA1F0614B228F6F6F6C58E3D7BF6EC95AFBF75EB56B1CBDEE6A84B972EE8D4A913CE9C39231C532814661350FEF8E30FAC58B102111111C2C39A453BBD4F9F3E1D1D3A7430E8E73B3A3AA25DBB7668D7AE1DBCBCBCF0C5175FA067CF9E06FD4C73C08042BA30E5B9A6B2B877EF1E121212101515556C7F926AD5AAC1D5D51532998CCF9390C9E2EC4016A5478F1EC56EFD090B0BD368B48A14141460D2A449C51A5173BDA2F2CF674EF6EFDF8FEBD7AF0B5F9B5AD3A052A9909C9C0CA9548A6EDDBA212C2C0C4F9F3E459B366DB060C1025CBB760DAB57AF36783829326AD428787979213E3E1EBD7AF542DFBE7DA1542A8DF2D9A68A018574616A734D65919E9E8EA54B97A26FDFBE68D4A811C68C1983F8F878E4E5E5A17EFDFA080808405C5C1C323333A1542A111818C87042268BB30359945AB56A61EDDAB5A85AB5AA702C212101BEBEBEF8FDF7DF919F9F8F9C9C1C6CDAB4097DFAF4C1D9B367B165CB163469D24478FDE1C387D1A54B17BCF7DE7B983B77AE187F0C9D8C1E3D5AE3F627954A854D9B36697C0D88DF34E4E4E460D9B265E8D0A103060D1A84F8F878A8D56AB8BABA22363616972E5D426868A8283F58FFFBDFFFA27AF5EA008043870E61E8D0A1707171417878788921B7B26340215D14D58D216EC7B4248585853870E00066CE9C8976EDDAA16DDBB6983A752A0E1D3A04B55A8D8E1D3B22343414A9A9A9B873E70EC2C3C321954A4BBC9380C8E4A8892CD0B973E7D4A3468D5257AF5E5D0D40F89F8D8D8D1A80DAC1C141FDFEFBEFAB333333D56AB55ABD6FDF3EB5939393C66B01A8EDECECD4CF9F3F17F94F537E6FBFFDB6C6F8BB77EF2E9C9B3A75AA1A803A38385894B1A5A7A7AB434343D575EAD411C6676F6FAF0E080850FFF1C71FA28CA9248B162D2A560700D49D3A7552FFF2CB2FEABCBC3CB1876834191919C29F3F373757ECE19099F0F3F3530350CF9F3F5FECA1989DDCDC5C755C5C9C3A383858DDB871E362F390B3B3B37AEEDCB9EAB367CF8A3D54A20AE1332864919C9C9CB061C306E4E5E5E1F4E9D3B876ED1A1E3C7880BCBC3C346DDA14EFBCF38EC60A57FDFAF5C3B973E770E7CE1DDCBA750B8585850080860D1BC2CECE4EAC3F86D6E4723952535385AF4F9C388173E7CEC1D9D959B42B28FBF6EDC3D2A54B11171727FC7B6DD2A409264E9C88909010346CD8D0A8E329CBD4A953A1502870E2C4098DE367CE9CC19831633077EE5C7CF2C927080A0AAAF4FBAEF00A0AE9A2E8EF396BA67CAE5DBB266C9AB877EF5E8D855EAA56AD8A8103070A0FB9376EDC58C49112E90F030A59343B3B3BB8B8B8947B39C5468D1AA151A346061E95E18C1C3912D3A74F17F60B0180CD9B3763DEBC79460D28AF5A26B85BB76EF8E0830F101818A8711B9E29B1B5B5C5BA75EBD0B3674FE4E7E7173B7FE5CA154C9E3C19F3E6CDC3471F7D842953A654DA258F19504817457563636323F2484CD7D9B367111F1F0FA55289C3870F6B2C775FAF5E3DB8BABA422291C0C7C707356BD61471A44486C19F284416A4418306707373D33816191909B55A6D948072F7EE5DCC9B370FAD5AB582BFBF3F8E1C39021B1B1BF8F9F961FFFEFD3871E2048283834D369C14E9D2A50BA64C9952EA6BEEDFBF8F79F3E6A175EBD6983973266EDEBC69A4D1190F030AE9C2549E773325393939F8F5D75F3161C204346DDA149D3A75C2AC59B384E7499C9C9C101A1A8A83070FE2CE9D3BD8B2650B020303194EA8D2E21514220B2397CB919898287C7DF9F2651C3B76CCA04DC3A953A7B064C9126CDCB851B83DA156AD5A98306102264D9A84D6AD5BEBFD330D6DFEFCF9888E8E467A7A7AA9AFCBC9C9C1E2C58BB16CD9328C18310273E6CC41C78E1D8D344AC36240215D30A0BC70E1C2056CDFBE1D0909093870E080C652C0B6B6B678E79D772091483074E850BCFEFAEB228E94C8F81850882CCCB061C33071E244613F11E0C59E2886681A76EFDE8DC58B1723313151B845A15DBB769832650AC68E1D2BAC88658EAA55AB86E5CB97C3D3D3B35CAFCFCBCB43444404222323E1E5E585CF3EFB0C6FBEF9A6814769580C28A40B4B0D284F9F3EC5BE7DFBB07DFB76ECD8B1A3D82F371A346880C1830763C89021183C7830EAD4A923D24889C4C7804264616AD4A801894482A8A828E1D8C68D1B2191480054BC6928282840545414162F5EACF120B9ABAB2BA64E9D8A214386549AC6C4C3C303EFBDF71E366EDC58EEEF51A954888F8F477C7C3C060D1A8459B366C1D5D5D580A3341C4B6D34A9622CA96EAE5CB982848404ECD8B10329292978F2E48970CECACA0ADDBB7787979717860C19829E3D7B5AC4BF13A2F2604021B24072B95C23A0DCBD7B17376EDC00A07BD3F0F8F163AC5DBB163FFCF003AE5EBD0AE0C56D0AC3870FC78C1933CABD1081B959BA742976EDDA85FBF7EF6BFDBD494949484A4A42D7AE5D316DDA348C1A35CAAC1E1CB6A44693F4A732D74D5E5E1E0E1E3C881D3B7660C78E1D387FFEBCC6F99A356B62D0A041F0F2F28297971757DD227A050614220B3464C810D4AD5B17999999C2B1A2DB0DB46D1A6EDFBE8D1F7FFC112B57AE4456561600C0D1D111E3C78FC7B469D3CCF2F9126DD4AF5F1FFFF77FFF87A0A0209DDFE3F7DF7FC7983163307FFE7C4C9E3C1921212126BF500050B91B4D329CCA5637376EDCC08E1D3B90909080E4E464E4E4E4689C777676160249DFBE7D51A54A1591464A643E1850882C909D9D1D7C7D7DB176ED5AE1D8952B570094BF69B870E102BEFBEE3B444444080FBE376AD40893274FC6C489132BEDD2BA25193B762C366EDC88E4E4E40ABDCFE5CB973175EA547CFBEDB7F8E0830F306DDA34D4AA554B4FA3D4BFCAD6689271987BDD1414142035355508257FFCF187C679474747B8BABAC2D3D3135E5E5E68D5AA95482325325F0C2844164A2E976B0494A23D3DCA6A1A7EFBED372C58B000B1B1B142A3D1A143077CF2C927080808308BDFFCEB9B95951556AC58812E5DBA682C3EA0AB3B77EE60DEBC79F8E1871F3076EC58CC9E3DDB246F0531F74693C4618E75939595859D3B77222E2E0E898989C2D5E222EDDAB513AE92F4EBD7CF22E741227D624021B25003070E44B366CD84674F8ABCAA69484A4AC282050B909292221CEBDBB72F66CC9801A9546A56CD8621B46BD70E9F7FFE39E6CC99A3B7F77CF4E811962D5B86B56BD762C28409983E7D3A5AB66CA9B7F7AF28736C34497CE65237E9E9E9888B8B8352A9C4FEFDFB3536B8AD5AB52AFAF7EF2F84122E034CA45F0C284416CADADA1AFEFEFEF8E1871F348EBFBC3BBA4AA542747434162C5880E3C78F037871B5C0CBCB0BB367CF469F3E7D8C3AE67F52A954C8CECE06003C7FFE5C5821E7F1E3C7C8CFCF875AADC6C3870F01BC78783537371700909B9B2BEC39F0F0E143A8D56AE4E7E7E3F1E3C70080274F9E08B7AD65676743A552A1B0B0108F1E3D02F062B9D067CF9E017811220A0B0BA152A98AFD56555F727373B174E952AC58B102EFBDF71EFEFDEF7FC3D9D9D9209FA50D736934C9B4986ADDA8542A1C3D7A54082567CF9ED538DFA4491348241248A552B8B9B9A15AB56A228D94A8F2634021B26072B9BC5840B970E102F2F3F3A15028F0EDB7DFE2C2850B005E341303060CC0A4499384DFE21F3E7CB85828002034EA658582828202E181D2B242C1B367CF84DBA78A4281A5C9CFCFC72FBFFC828888087CF2C92758B87021ACACAC441B8FA9369A64DA4CA96E9E3E7D8A43870E41A95462EBD6ADB879F3A6C6F9366DDA402291402693A177EFDE263166224BC0804264C17AF6EC89F6EDDBE3E2C58BC2B1B8B838D8D9D9157BAD4AA5424A4A8AC62D5E647CCD9A35C3E79F7F8EA0A02051C309605A8D26990FB1EBE6DEBD7B888B8B434C4C0C76EFDEADF1DC989D9D1DFAF7EF0FA9540AA9545AE957212432550C2844164E2E9763DEBC79B0B7B7C7F3E7CF851DDFC9B4D4AD5B17A1A1A1983C79321C1C1CC41E0E00F11B4D324F62D4CDD5AB57111313839898181C387040E30A6CDDBA75E1E9E989A1438762F0E0C126BD721E91A5604021B260F7EFDF477676366AD4A8516CEDFECAAC468D1AB0B5B5859595156AD7AE0DE0C56F4E1D1D1D01BC5826B4E82A529D3A75000055AA5441F5EAD50100D5AA5583BDBD3D00A056AD5AB0B6B686ADAD2D727272306FDE3CBD8EB55AB56AF8F8E38FF1EF7FFF5B18ABA96040215D18AB6ECE9D3B87E8E868444747232D2D4DE35CAB56ADE0EBEB0B6F6F6FF4EDDB17B6B66C87884C09FF461259A03B77EE60F1E2C558B56A95F060B88383039E3E7D0A3B3B3BE159918AA85AB52A1C1C1C84FF7FF99836E7F5F95E45AF3194B163C7EAEDBDAA54A98271E3C661EEDCB968DAB4A9DEDE579F1850481786AA1BB55A8D63C78E09A1E4CF3FFFD438FFC61B6FC0D7D717BEBEBEE8DEBDBB5E3F9B88F48B0185C8825CBF7E1D8B162DC24F3FFD24DC77FDDA6BAF61D6AC5988898941424202FCFCFCE0EBEB0BA0E42B05363636A859B326006834FC356BD6848D8D8D087F2AD370E2C40944444454F87DACADAD3162C408CC9F3FDFE4972E2DBA4DC692FFBB93F6F419500A0B0BB17FFF7E6CDBB60DB1B1B1B87EFDBA70CECACA0ABD7AF5124249FBF6ED2BFC7944641C0C284416E0EAD5ABF8FEFBEF111616262C8FDBA64D1B84868622282808B6B6B68889890100B8B8B840269389395CB3346DDA34A1F1D295BBBB3B162E5C6836BFDDE51514D24545EB46A552E1F0E1C3888A8A425454146EDDBA259CB3B1B1C15B6FBD05994C063F3F3F346FDE5C2F632622E3624021AAC42E5EBC886FBFFD16919191C212C09D3A75C29C3973E0EFEFAFF19B6F369BBADBB66D1BF6EFDFAFF3F7BFF9E69BF8F6DB6F3170E0403D8ECAF05833A40B5DEAA6A0A0007BF6ECC1D6AD5B111D1D8D7BF7EE09E7AA56AD8AC1830763D8B061904824A85BB7AEDEC74C44C6C58042540965646460C1820558B76E9DB0FB71E7CE9DF1C9279F60D4A85125DE92C3665337797979983D7BB64EDFEBE4E48479F3E661F8F0E1A22F19AC0BD60CE9A2BC7553585888D4D45444454561F3E6CDB873E78E70AE6AD5AA707777874C26838F8F8F70DB2911550E0C284495C8E5CB97F1D5575F2132325208266FBDF5163EFBEC3378797995DA04B3D9D4CDB265CB70E9D225ADBEA775EBD698376F1E468F1E6DD6FFBE5933A48BD2EA263F3F1FC9C9C9D8BA752B626262909999299CAB56AD1A3C3D3D317CF87048241261553D22AA7C1850882A81AB57AFE29B6FBED1B862F2E69B6FE2D34F3F85542A2DD77BB0D9D4DEBD7BF7F09FFFFCA7DCAFAF57AF1E66CE9C898F3FFED8A0AB89190B6B8674F1CFBA79F999924D9B36E1EEDDBBC26B1D1C1CE0E6E606994C065F5F5FD4A85143943113917131A01099B16BD7AEE1BBEFBEC3EAD5ABF1FCF9730040972E5DF0E9A79F6A7DDB109B4DED7DF1C517C8CECE2EF375D5AB57C7471F7D84D9B36757AA4DE05833A48BA2BAB97EFD3A66CD9A85888808DCBC795338FF722819366C18AF9410592006142233545230E9DCB9333EFBEC339D9F6760B3A99DB367CF62CD9A35A5BEA66AD5AA98387122E6CC9983FAF5EB1B6964C6C39A216D9D3B774EB86DEBA38F3E128EDBDBDB63D0A0410C254404800185C8ACFCFDF7DFC2AD5C459B2976EFDE1D73E7CE85542AADD083D66C36B5F3C9279F08B7D3FD93B5B535FCFCFCB060C102B469D3C6C823331ED60C9547464606366DDA04854281D3A74F0BC7ADADADE1EEEE0EB95C0E5F5FDF4A757591882A860185C80CDCBF7F1F8B172FC6B265CB840D163B75EA842FBEF8426F2B40B1D92CBF1D3B76203131B1D8712B2B2BF8F8F8E0EBAFBF869393930823332ED60CBDCA83070FB06DDB36848787E3F0E1C350ABD5C2393B3B3BE4E5E561E3C68D1831628488A3242253C5804264C2B2B2B2B078F1622C5DBA14B9B9B900807FFDEB5F98376F1E7C7C7CF4BA342D9BCDF2292828C08C19338A1D1F387020BEFDF65BBCF9E69B228C4A1CAC197A595656167EFDF55728140AECDDBB17858585C2B9AE5DBB422E9763C48811E8DDBB376EDEBC897AF5EA89385A2232650C28442628373717FFFDEF7FB170E1426465650178B134EDECD9B3317EFCF812F731A928369BE5B372E54A9C3F7F5EF8BAE84A964C26137154E260CDD0B367CF90949484888808C4C6C60AB79E0240AB56AD3072E4488C193346E38A62517061DD10D1AB30A0109990BCBC3CAC5FBF1E73E7CEC5EDDBB701002D5AB4C0679F7D86A0A020D8DA1AEEAF2C9BCDB265656561FEFCF900FE1718274C9860B1FFCE583396A9B0B0107BF6EC41787838626262909393239C6BD6AC19FCFCFC2093C9D0A74F9F12AFF216D58D217ED142449503030A9109C8CFCF8742A1C0975F7E898C8C0C0040FDFAF53163C60CA3ED99C166B36CF3E7CF87BDBD3D962C5982891327C2CECE4EEC21898A3563395EDEAB44A150E0DEBD7BC2B93A75EA402291402693C1CBCBABCCE0C1BA21A2B230A0108948A55241A15060EEDCB9B87CF93200A06EDDBA98397326264F9E0C474747A38E05B0DCA661C78E1D983A752AB66DDB867FFDEB5FC5CEDFBF7F1FAD5AB5C2A54B97E0E0E020C2084D8FA5D78C253875EA147EF9E51728140ADCBA754B385EB3664D787B7B432E9763D0A0415A5DDD65DD10515918508844929C9C8CD0D0509C38710200E0E8E88849932661D6AC59A85DBBB6D1C763694DC3C9932771E3C60D5CB87001D1D1D1484D4D855AADC6FDFBF74B7C7DFDFAF53175EA54238FD2B4595ACD588ACCCC4C6CDDBA15E1E1E13874E89070FCE5BD4AFCFCFC74FE050AEB8688CAC280426464C78F1F4768682852525200BCF8A1FFD1471F61D6AC5968D0A08168E3B2B4A661D1A24578F6EC199C9C9CF0DD77DFC1C3C3A35CBBC2D3FF585ACD54664F9F3E454C4C0C222222B06BD72E8D07D9FBF5EB87C0C040F8F9F9A166CD9A15FE2CD60D1195850185C848AE5EBD8A6FBEF9066BD6AC814AA532B9CDFC2CAD69D8B871A3D843307B96563395515A5A1AC2C3C311191989070F1E08C73B74E880912347222020006DDBB6D5EB67B26E88A82C0C28440656B4C9E292254BF0FCF9730080BBBB3B162D5A84AE5DBB8A3CBAFF61D340DA62CD98A76BD7AE41A15060CD9A35F8EBAFBF84E3B56BD786542A45606020DCDCDCF4BACFD2CB58374454160614220329DACBE49B6FBEC1A3478F00003D7BF6C4C2850B3170E0409147571C9B06D2166BC67C64676723363616111111D8BD7BB7B0B3BB8D8D0D060E1C88808000C86432A32C00C1BA21A2B230A010E9597E7E3E56AF5E8DAFBEFA0A77EFDE0500B46FDF1E5F7FFD35FCFCFC0CF65BC98A62D340DA62CD98B6FCFC7CECDCB913E1E1E1502A95C2155CE0C52F4B0203033172E448D4AF5FDFA8E362DD105159185088F428393919D3A64DC399336700FC6F2F9369D3A699FC9E196C1A485BAC19D374F6EC5944444460FDFAF5B873E78E70BC6813C5A0A02074E9D245B4F1B16E88A82C0C28447A9096968619336660EFDEBD0080EAD5ABE3DFFFFE37A64F9F6ED4BD4C2A824D03698B35633AAE5FBF8EC8C848848787E3DCB973C2F1EAD5AB63D8B061080C0CC4C081034DE2BF15EB8688CAC280425401D7AF5FC7A79F7E8A0D1B3640A552C1C6C606414141983F7F3E1A376E2CF6F0B4C2A681B4C59A115774A9DF7500002000494441546E6E2E7EFDF557E1B99297FF7BB8BABA22303010C3860D33A95F92A8D56AE1F917D60D11BD0A030A910E8A1E80FFCF7FFE83C78F1F0378B132D7E2C58B45BD75A222D86C92B65833E2285A1A78C3860DC8CCCC148E77ECD81123468CC0983163F0DA6BAF8938C2572BAA1980754344AFC68042A485C2C242AC5BB70E5F7CF1056EDFBE0D00E8D4A913162F5E8CC183078B3CBA8A61B349DA62CD18CFEDDBB71111118175EBD6E1C2850BC2F1060D1A402E97232020003D7AF4107184E5C3804244E5C18042544E89898998316386F0007CE3C68D316FDE3C8C1F3F1E363636228FAEE25EDE399AA83C18500C2B3F3F1F3B76ECC0BA75EBB063C70E1414140078B134B08787078282822091484C7E018E9731A010517930A01095E1D2A54BF8F4D34F1115150500707070C09429533067CE1CD4AC5953E4D1E90F9B4DD2166BC6302E5CB880F5EBD7175B85AB7DFBF690CBE518376E1C5AB56A25E20875C7804244E5C18042F40A8F1E3DC2575F7D8565CB96212F2F0F565656183D7A34BEFEFA6BB468D142ECE1E95D51E35019AE06917130A0E8CFA3478FB079F366AC5BB70E478E1C118E57AF5E1D32990C414141E8D3A78FC9EEA3545E0C2844541E0C2844FFA056AB11111181D0D050E139131717172C5BB60CBD7BF716797486C36693B4C5DB022B2E2D2D0D616161D8B871A3B0E006F062CE090E0E865C2E478D1A35441CA17E31A010517930A010BDE4D8B163F8F8E38F919A9A0A0068D2A409BEFCF24B4C9830A1D2FF3035878072F7EE5DFCFEFBEFC8C8C8C0C3870F0100B56BD746C3860DD1B56B579D572E3A7BF6ACD01CA6A5A5A15FBF7EBC92540E45CBC5F2DF95766EDEBC89888808AC59B3067FFDF59770BC49932690C96498306102FEF5AF7F893842C3614021A2F2604021C28B8661DEBC7958B3660D542A15AA54A982891327E2ABAFBEAA54CF9994C694034A72723242434371E2C409002F1AE29A356B223F3F5FE3B7CE1D3A74C08409133079F264D8DBDB97FA9E212121502A9578F2E409B2B3B385E33367CEC4DCB97351AD5A35D4AC5913972F5F36CC1FAA1230E59A3135797979484C4C44444404A2A3A3351E781F387020828383E1E3E3832A55AA883C52C3624021A2F26040218B96979787952B57E2F3CF3F474E4E0E8017FB992C5BB60C4E4E4E228FCEB84CB5D93C78F0203C3C3C84DB89468F1E8DB56BD70A2B17DDBC7913AB56ADC237DF7C833FFFFC133367CEC4FAF5EBB173E74E346FDEFC95EFFBDD77DF61C182057074742CB60A925AAD16AED0D0AB996ACD989273E7CE213C3C1CEBD6ADC3BD7BF784E31D3B76C4D8B1633176EC58346AD448C4111A17030A119507030A59ACB8B8384C9B360DE9E9E90000272727FCF0C30F66BF9F89AE4CB5D95CB76E9D104E0060F3E6CD080B0B13BE6EDAB429E6CF9F8F3A75EA60FAF4E9005EDCB23564C8101C3F7EFC95BF91AE5EBDFA2B3FD3CACA0A75EAD4D1D39FA0F232D59A115B565616222323F1F3CF3F0B57FD00A056AD5A18397224828282D0AB572F1147281E0614222A0FCE0E6471D2D3D321954AE1EDED8DF4F474D4AE5D1B0B162CC0EFBFFF6EB1E10430DD66332F2F4FE3EBC2C2428DC052E4C30F3FD47898F8D4A953D8BC79B3C1C767C94CB566C492969686909010346FDE1C93274F16C2898B8B0B56AF5E8D1B376E60D5AA55161B4E000614222A1FCE0E64319E3D7B8679F3E6E18D37DE407C7C3CACACAC101414848B172F223434D4AC363B3304536D36C78D1BA7F110B65C2E2FF1EA87BDBD3DDAB56BA7716CD7AE5D061F9F2533D59A31A6BB77EF62D1A245E8D0A1037AF4E881B0B0303C79F2042D5AB4C0E79F7F8ECB972FE3F8F1E3080E0E86A3A3A3D8C3151D030A1195076FF1228BB07BF76E4C9A3409172E5C000074EDDA15CB972FAFD4CB066BCB549B4D3737371C3B760CDBB76F47DBB66DE1EFEFFFCAD7B66CD952E3969A5BB76E19638816CB546BC6D0542A1552525210161686D8D858E12ADFCB0FBCFBFAFAC2D6963F62FF89018588CA83B327556AD7AF5FC79C397310111101E0C592B45F7EF925264D9AC4A551FFC1949BCD6EDDBAA15BB76EAF3C9F959585ACAC2C61A1832225DD0A46FA63CA356308B76EDD42787838C2C2C28467D700E0F5D75FC7A851A3307EFCF84AB989AB3E31A010517930A050A5949F9F8F152B56E0B3CF3EC3E3C78F855DE0FF1F7BF71D15D5D53D7CFC0BD2ECBD3FD6187BEC4934D6284441C18A1D6C08C61A1313B11BC51E1388460111512C08762C28452326C6AE51ECDD68143BA8149999F70F5FEF4F620364B833B03F6B3D6B3DDE3BCCDDE8CE99BDE7DE73CEBC79F372D48A3969652C45C3A3478F888C8CE48F3FFEE0D8B1635CBA74899B376FA68A5F649D9CD0A0BC7AB7E4D5E5812D2D2D717070C0D5D595366DDA18FD0EEF59C558C61A2184BAA44111D9CE8E1D3B183972A4B2015ADDBA75F9EDB7DF68DAB4A9CA91192E432F1A8E1F3FCEAC59B3D8B2650B89898900142B560C0707075AB46841AD5AB5285BB62CC3870F67C3860D2A479B7364E706E5CA952B2C5DBA9465CB9671EBD62DE578CD9A35193C78304E4E4E142D5A54C5088D93A18F354208C3200D8AC8366EDFBECD0F3FFCA03CCE95376F5E264D9AC477DF7D27CF82BF87A1160D3A9D8E8913273277EE5CE59BEB3C79F2306BD62C5C5D5DB1B2B24AF57A438A3D27C86E0DCAAB9B296ED8B0417944D0CACA0A7B7B7BB95B92090C75AC11421816A9DA84D1D36AB5787B7B337EFC781E3F7E8C8989097DFAF461DEBC79942A554AEDF08C82A1160D53A74E65E6CC99CA9F2D2C2CD8B3670F9F7EFAA98A518997B24B8372F6EC59FCFCFC58B16245AACD141B3468808B8B0BBD7BF7A660C1822A46987DBC3A2F4CE6010A21DE461A1461D44E9E3C899B9B1BFBF7EF07E0A38F3E62F1E2C5D8D8D8A81C997131C406E5F1E3C7CC9D3B37D5B1A14387BEB33991B92859CB981B94A4A424B66CD982AFAF2F919191E8743A000A142840CF9E3D717272A259B3662A4799FD18E2582384303CD2A008A3949090C09C397398356B16C9C9C9989B9BF3EDB7DF3275EAD4D71EFB11EF678845C3C9932795F9262FBD6F1E912C2B9CB58CB1413973E60CCB972FC7CFCF8FFBF7EF2BC71B366C88ABAB2BBD7BF77EE33E3B227318E2582384303CD2A008A3B373E74E860E1DAA2CF3D9BC7973BCBDBDA959B3A6CA91192F432C1A0A1428F0DAB1070F1EBCF5F5B76FDFE6C89123FA0C49FC87B134284F9F3E65EDDAB5F8FAFA72E0C001E57891224570727262F0E0C1D4AA554BC508730E63C9192184BA64841046E3CE9D3B383B3BD3AE5D3B2E5FBE4CA14285F0F4F464CF9E3DD29C7C20436C506AD4A841D5AA55531D5BB060014F9F3E7DEDB50909090C1830006B6BEB540B22DCB87183A4A424BDC79A53197AB179F6EC59DCDDDD295FBE3C83060D529A93860D1BE2E3E3C38D1B37F0F4F494E6240B197ACE08210C838C10C2E0E9743A962C59428D1A359415BAFAF4E9C3B973E718356A947CD06502436C50CCCDCD090A0A4AB5D0C1A953A768D2A409EBD6ADE3EAD5ABC4C4C4F0CB2FBF50B76E5D62636359B66C59AA0D1D2F5EBC48A952A568D2A409BD7AF55276FC1699C3108BCD848404020202F8E28B2FA851A30673E6CCE1C18307142F5E9CEFBFFF9EF3E7CF73F8F0615C5D5DC993278FDAE1E6388698334208C3238F78098376E5CA155C5D5D89888800A072E5CA2C5AB488B66DDBAA1C59F662880D0ABCD841FEF4E9D3787979B176ED5ACE9E3DCBC99327717474545E53AC5831860C1982BBBB3B79F3E6252828886FBFFD96C8C8489E3C79C2A3478FF8EBAFBF387EFC38CF9E3DC3C2C242C5DF287B31A462F3DCB9732C5BB6ECAD734B9C9C9CC89D3BB78A110A30AC9C1142182E69508441D268347879793169D2249E3D7B8699991963C68C61F2E4C95264E881A1362800850B1766EAD4A94C9D3A95070F1E70F5EA55EEDDBB47626222A54B97A66EDDBAA99A8ECA952BB369D326E0C54A602F7FB77CF9F2616E6EAECAEF905DA95D6C26262612121282AFAF2FFBF6ED538E172D5A947EFDFAE1EAEA4AB56AD554894DBC99DA392384300ED2A0088313131393EA79F13A75EAB074E9521A356AA47264D997213728AF2A52A408458A1449F3EB65EF0AFD52ABD83C7FFE3CFEFEFE2C5DBA947BF7EE29C75FDE2DE9DBB7AF3CBE65A0A4411142A4853428C260A4A4A4307FFE7CA64C9942525292B274F0B469D3E4B11C3D339606451896977993153BABBF6DDF9282050BD2A3470F860D1B469D3A75F41E87F830D2A00821D2421A1461104E9C38C1C08103397AF428004D9A34C1CFCF4F56E7CA22D2A0888CC88A62F3C2850B2C5DBA147F7FFF54BBBCCBDD12E3240D8A10222DA44111AA4A4C4C64F6ECD9CC9C3993E7CF9F93274F1E264F9ECC983163C8952B97DAE1E518D2A0888CD057B1999C9CCCE6CD9BDFBACBFBD0A143A95BB76EA65E53640D6950841069210D8A504D74743483060DE2C2850B00585B5BE3EBEB4BA54A95548E2CE7910645644466179B172E5C60C99225040404A4BA5BD2B87163DCDCDCE8DEBDBBDC2D3172D2A00821D2421A1491E5121313993A752A3FFDF4131A8D8682050B3277EE5C060F1E9C25CFB28BD74983223222338ACDF7DD2DF9FAEBAFA957AF5EA6C42BD4270D8A10222DA4411159EAE0C183F4EFDF9F3367CE00606F6F8FB7B73765CA945139B29C4D1A1491111F526C5EBE7C99254B96B06CD932EEDCB9A31CFFECB3CF707575A567CF9EE4CD9B37D3621586411A1421445A488322B2C4CB15BA264D9AC4F3E7CF2950A000F3E6CDC3D5D555EDD004D2A0888C496FB1A9D168D8BD7B37BEBEBE6CD8B0018D460340FEFCF9E9D5AB176E6E6E3468D0406FF10AF549832284480B695084DE9D3A758A7EFDFA292B74595B5BE3EFEF4FB972E5548E4CBC240D8AC888B4169B376FDE64E5CA95FCF6DB6FDCB8714339FE7225AEDEBD7B932F5F3EBDC62A0C8334284288B4900645E8CD7FF735C99D3B3753A64CE1FBEFBF970F2703230D8AC888977740DE94335AAD96A8A8A8D7EE96585959616F6F8FABAB2BD6D6D6591AAF509F34284288B4900645E8C5A54B9718306000D1D1D1C08B7D4D020202A85AB5AACA91893791A24164C4CBBC797549F05BB76E111818C8A2458BB87EFDBA72BC66CD9A383B3BE3EAEA4AE1C285B33C56611864AC1142A4853428225369B55A7EFDF557C68F1F4F424202565656787878307AF468F94032605234888C78F5CEDBCB5DDEC3C2C294BB2579F3E6A567CF9EB8BABAF2D9679FA915A6302032D60891792E5CB8C0C71F7FAC76187A210D8AC834FFFCF30FFDFBF727323212804F3FFD94E5CB9753A3460D952313EF234583C88884840400264F9ECCA3478F94E375EAD45176792F58B0A05AE1090324638D101977F5EA55222323898A8A222A2A8A3B77EE101B1B4BB162C5D40E2DD349832232C5BA75EB707373E3C18307989B9B3379F264DCDDDD313393143306EF9A4B20C4AB341A0D616161F8F8F870E0C001001E3D7A44EEDCB9E9D1A307AEAEAE3469D244E52885A192064588B48B8D8D559A91C8C8482E5FBE9CEABCA9A929478F1EE5ABAFBE522942FD91EA517C90F8F878468E1C494040000055AB5665E5CA957CFAE9A7EA0626D2E54D73098478D5AD5BB758BA74297E7E7EA9E69600F4ECD993C58B1753A8502195A213C6421A1421DE2E2121813D7BF6B06BD72E2223233975EA94B279ED4BD5AA55A375EBD6B46EDD9A2FBFFC92A2458BAA14AD7E49832232ECE0C183F4EDDB970B172E00E0E4E4C4A2458B64B9502324458378935757E2DAB46913CF9F3F07C0D2D212070707626262387DFA34D6D6D6D29C883491B14688D42E5FBE4C444404111111ECD8B183274F9EA43A5FAA54299A376F8EB5B5356DDBB6A542850A2A459AB5A44111E9A6D168F0F0F0C0C3C3839494148A152BC692254BE8D4A993DAA1890C92A241BCEAEEDDBB2C5DBA141F1F1FAE5EBDAA1CAF51A306AEAEAE383B3B53A448111A376E0C48DE88B493B146E4744F9E3C212A2A8AB0B030C2C2C2B872E54AAAF3050A14C0DADA1A6B6B6B5AB76E4DB56AD5548A545DD2A08874B975EB167DFBF665F7EEDD007CF5D55704040450BA74699523131F428A0601F0C71F7FB078F162D6AD5B47525212F0E26E49B76EDD707575A5458B16A95E2F7923D24B7246E444E7CE9D23343494B0B030A2A3A3494E4E56CE99989850B76E5DDAB56B47BB76ED68DAB4A9CCDF451A14910EBB76EDC2C9C989D8D8582C2C2C98356B16A3478FC6C4C444EDD0C40792A221E77AF2E409AB56AD62F1E2C59C38714239FED1471FE1E6E6C6C08103DFFA8CB3E48D482FC919911368341AFEF8E30F424343D9B2650BE7CF9F4F75BE70E1C2D8D8D8284D897CC9FB3A6950C47BA5A4A43079F264E6CC998356ABA552A54A040505C9BE06D988140D39CFE9D3A759BC78312B56AC202E2E0E78B148829D9D1D43870EE5ABAFBE7A6F3E48DE88F4929C11D9557C7C3C616161848686B27DFB76EEDFBFAF9C333131A17EFDFAD8D9D9616B6BCBE79F7F2E8BD2BC873428E29DFEF9E71F7AF7EEADEC08DFB16347962D5B263B4167335234E40C1A8D86EDDBB7F3EBAFBF121919A9AC0E53A24409060C18C0902143A858B1629ADF4FF246A4972C692EB293EBD7AF2B4D497878B8F2682C809999199F7FFE398E8E8E74E9D28572E5CAA918A9F1910645BC555858187DFBF6E5FEFDFB585A5AF2D34F3F317CF870B5C3127A208566F676E3C60D7C7D7DF1F3F3E3F6EDDBCAF1E6CD9BF3F5D75FD3B56B572C2C2CD2FDBE923722BD64497361CC743A1D478E1C61CB962D84868672FCF8F154E78B172F4EFBF6EDE9D0A1036DDBB695554D3F803428E2353A9D8EB973E7327EFC78B45A2D152A542028284859B147643F5268663F3A9D8EC8C8487C7D7DD9B8712329292900E4CF9F9F5EBD7A3174E850EAD6ADFB41D790BC11E92539238C4D626222FBF6ED233434940D1B36F0CF3FFFA43A5FB972653A74E880BDBD3D2D5BB6C4DCDC5CA548B3176950442A0F1F3EC4C9C9896DDBB601D0A95327962F5F4E810205548E4CE893140DD9C783070F080808C0DBDB5BD9A308A076EDDA7CFDF5D7383939913F7FFE4CB996E48D482FC919610C626363D9BA75ABF2E8D6D3A74F9573666666346BD60C7B7B7B1C1C1CA852A58A8A91665FD2A008C5891327E8DAB52B972E5D2257AE5C7878783076EC5859A52B0790A2C1F81D3A7488C58B17131414444242020016161674E9D285AFBFFEFAB525823383E48D482FC91961A8CE9F3FCFA64D9BD8BC79337FFDF59792AB00050B16A46DDBB6383838606B6B4B912245548C346790064500B062C50A860C1942424202C58B1767CD9A35B469D346EDB0441691A2C138252424101414C4A2458B387CF8B072BC7CF9F2B8BABAE2E2E242C99225F5767DC91B915E9233C250E8743A0E1E3CA8342567CE9C4975BE62C58ACA5D92162D5A64689E9EC838695072B8949414468F1ECDC2850B01F8ECB3CF58B76E9DAC3691C348D1605C6EDDBAC5A2458BF0F1F1E1DEBD7BC08B7F3B1B1B1B860E1D4AFBF6EDB36412B2E48D482FC919A1A6E4E46476EFDECDA64D9BD8B2650BB76EDD52CE999898D0A041033A75EA8483830375EAD4513152210D4A0EF6E0C103BA77EF4E646424006E6E6E787979616969A9726422AB49D1601C0E1F3E8CA7A727212121CA4EC4458A1461E0C081B8B9B965F9B3D0923722BD246744567BFCF8313B76EC60D3A64DECD8B143D9F709C0DCDC9C962D5BD2B163473A76EC285FCE1A10695072A8F3E7CFE3E0E0C0B973E7303333E3E79F7F66C488116A872554224583E1D26AB56CDBB68D5F7FFD95888808E5F8C71F7FCCB061C3707171216FDEBCAAC506923722ED24674456B87BF72E3B76EC202424E4B5FD49F2E4C943EBD6ADB1B7B7A753A74E94285142C548C5DB48839203EDD8B1835EBD7AF1F8F1638A162D4A4848085F7EF9A5DA61091549D16078E2E2E258B66C19BFFCF20BD7AE5D538E376DDA94B163C7D2A14307D517B090BC11E9253923F4E5F2E5CB848686121212C2FEFDFB534D722F56AC18B6B6B6D8DBDB636767A7DA973A22EDA441C961BCBCBCF8F6DB6FD16AB57CF2C9276CDEBC994A952AA91D965099140D86E3E2C58B2C58B080A54B972A4B5B5A5A5AD2BD7B77C68E1D4BAD5AB5548EF0FF48DE88F4929C119945ABD572ECD831424343090E0E7E6D927BA54A95B0B7B7C7DEDE9E56AD5A61662625AF31917FAD1C2229290917171756AE5C0940E7CE9D59B16285EC722A00291AD4A6D3E9888888C0D3D393B0B030E5DFA35CB9720C1B368CC183071BE4B296923722BD2467C48778F6EC19E1E1E1848686B275EB56EEDCB9A39C333131E1D34F3FA553A74E74EAD4891A356AA818A9F850D2A0E4000F1E3CA073E7CEECDDBB17131313264E9CC88F3FFEA8FAE321C27048D1A08E84840456AE5C89979717313131CAF1264D9AF0CD37DFD0A54B1783FED64FF246A497E48C48AF5BB76E299B264646462AFB3CC18BBD9EBEFCF24B65E5AD3265CAA818A9C84C86FBC92732C5C58B1769DFBE3DE7CF9FC7D2D2127F7F7F7AF7EEAD7658C2C048D190B56EDEBCC9A2458BF0F5F5559609363737A75BB76E7CF3CD377CF6D9672A479836923722BD2467445A1C3F7E9CD0D050424343397CF8303A9D4E3957A448116C6D6D717070A05DBB7614285040C54885BE4883928DEDDBB78FCE9D3B73EFDE3D8A162DCAC68D1B69DEBCB9DA610903244543D63878F0209E9E9EAC5BB78EE7CF9F0350B468515C5D5D19366C1865CB965539C2F491BC11E9253923DE242121813D7BF6B06DDB36424343B97EFD7AAAF355AA54C1C1C1017B7B7B9A356B66D0779645E6907FE16C2A2424847EFDFA919090C0471F7DC4B66DDBA856AD9ADA610903254583FEBC6F99E0C1830793274F1E1523CC38C91B915E9233E2A56BD7AEB173E74E222222080B0B233E3E5E39676A6A4AFDFAF5E9D0A103F6F6F6346CD850C548851AA441C98666CE9CC9C48913D1E974346FDE9C8D1B3752B46851B5C312064C8A86CCF7E4C913FCFCFCF0F4F4549609363131C1D6D6966FBEF9066B6B6BA39F07267923D24B7226E77AFEFC39FBF6ED63C78E1D6CDFBE3DD5BC3B8002050A60636343870E1D68DFBE3DC58B175729526108A441C946B45A2DA3468D62E1C28500F4E9D387A54B97CACEF0E2BDA468C83CFFFEFB2F0B162CC0DBDB9B870F1F0290376F5EFAF5EBC7C89123B3D59D4CC91B915E2FE71248CEE40CB76FDF561A92F0F0701E3F7E9CEA7CCD9A35B1B3B3C3CECE8E66CD9A616E6EAE52A4C2D04883924D242525E1ECEC4C7070300063C78E65D6AC5946FF0DADC81A52687EB83367CE307FFE7C56AE5CA9EC5A5CAA5429468C18C19021430C7299E00F257923D24B72267BD368341C3C7890EDDBB7B363C70E8E1E3D9A6A827B9E3C79F8F2CB2F95A6A462C58AEA052B0C9A3428D9405C5C1C9D3B77262A2A0A5353537EFEF967468D1AA57658C28848D190717BF7EE65DEBC796CDBB64DF920AE5EBD3ADF7DF71D4E4E4ED9FA0EA646A301246F44DAC95893FDDCBB778F9D3B77B27DFB7676EEDCC9FDFBF7539DAF5CB932B6B6B6B46FDF9E56AD5A913B776E952215C6441A142377FBF66DECECEC3876EC18161616040404D0AB572FB5C31246468A86F47939F17DD6AC59ECDFBF5F39DEB46953468D1A45972E5DC8952B978A11668D977993137E57913964ACC91E626262D8BA752B111111ECD9B387949414E59C9999199F7FFE39F6F6F6585B5BCB04779121D2A018B18B172FD2B66D5B2E5FBE4CFEFCF9D9B06103D6D6D66A87258C90140D69939898484040003FFDF413972E5D025EFC9D75EEDC993163C6D0B871639523CC5A923722BD24678C537C7C3C616161CAA35BAFEEE00EF0BFFFFD0F3B3B3B6C6D6DB1B6B6265FBE7C2A452AB20B69508CD4993367B0B1B1E1E6CD9B942C5992EDDBB7D3A04103B5C312464A8A86778B8F8FC7DFDF9F79F3E671F3E64D002C2D2DE9DEBD3BE3C78FA77AF5EA2A47A80EC91B915E9233C6E3FAF5EB848585111A1A4A7878B832B70E5EDC35AD57AF9EB20C7083060D64CEABC854D2A018A1C3870FD3AE5D3BEEDFBF4FC58A15090F0FA74A952A6A87258C98140D6F161B1B8B979717BFFDF69BB2FA4C91224518366C1823468CC8F1CB604ADE88F4929C315C3A9D8E23478EB065CB16424343397EFC78AAF3C58B17A77DFBF6D8DADAF2D5575F51A850219522153981342846263A3A9A0E1D3A10171747B56AD5080F0FA75CB9726A87258C9C140DA95DBB768D9F7FFE193F3F3F9E3D7B0640C9922519326408DF7CF38D7C30F37F3903923722ED64AC312C898989ECDBB78FD0D050366CD8C03FFFFC93EA7CE5CA9595BB24AD5AB5921DDC4596914C332261616174EDDA9567CF9E51AF5E3D76EEDC49891225D40E4B64035234BC70EAD429E6CC994350509032E9F3E38F3FE6871F7EC8F62B72A5973428222364AC51DFBD7BF7080D0D253434945DBB76F1F4E953E59C999919CD9A35C3DEDE1E070707793A43A8461A1423B161C3067AF5EA457272328D1B3766FBF6ED142E5C58EDB0443691D38B86FDFBF7336BD62CB66EDDAA2C155CBF7E7DDCDDDDE9DAB5ABAC52F506D2A0888CC8E9638D5AAE5FBFCEC68D1BD9B46913D1D1D1CA12E100050B16A46DDBB6383838606B6B9B2DF76C12C6471A1423B076ED5AFAF6ED4B4A4A0AAD5BB766F3E6CDB24286C85439753F8B3D7BF6E0E1E1416464A472AC65CB96B8BBBBD3AE5D3B1523337CD2A0888C900625EB9C3E7D9A8D1B37B271E3468E1C3992EA5C850A15707070C0C1C181162D5A606161A1529442BC993428066ECD9A35383B3B93929242FBF6ED59B76E1D5656566A8725B2999C5634ECDCB9130F0F0FF6EDDB07808989091D3A7460DCB8713469D244E5E88C833428222372EA97215941A7D371E8D021A5293977EE5CAAF3B56AD5A253A74E74E9D24556FD14064F1A1403161C1CAC3427B6B6B6D29C08BDC9291BEE4544443071E2440E1C3800BC2892ECECEC9832650A8D1A3552393AE3220D8AC8889C32D664158D46C3FEFDFB09090979E324F79A356BE2E8E8488F1E3DA851A3864A510A917ED2A018A8571FEBB2B3B363C3860D324157E84D76BE83F272D7F769D3A671F8F061E0C5EFD9B56B577EFCF147F9D0CE206950444664E7B126ABBCDA94AC5DBB36D5A689B972E5A271E3C6383A3AD2B56B57FEF7BFFFA918A91019270D8A010A0A0AC2C9C94979AC6BFDFAF5D29C08BDCA8E458356AB65FDFAF54C9D3A95D3A74F03606E6E4ECF9E3D99306102D5AA55533942E3260D8AC888EC38D66485579B92A0A0206263639573565656585B5B636F6F4FC78E1D2959B2A48A910A9139A44131308181810C1830008D4643E7CE9D59BB762DE6E6E66A8725B2B9972B576587A22125258555AB56E1E1E1C1C58B178117BBBE0F1C3890B163C752A142059523CC1EA4411119210D4ADA2527271329473F6600002000494441541E1ECEBA75EBD8BC79330F1F3E54CEE5CD9B173B3B3B1C1D1DB1B3B3236FDEBC2A462A44E69306C58084848428CD49972E5D080A0A92E6446489EC503468341A56AF5ECDF4E9D3B970E1020079F2E461F0E0C17CFFFDF7942D5B56E508B317695044466487B1469F929292D8B56B17EBD6AD63CB962D3C7AF44839972F5F3EDAB76F4FB76EDDB0B3B3234F9E3C2A462A847E49836220424343E9D3A70F1A8D06070707694E449632E6A241A3D1101414C4F4E9D395556BF2E4C9C3D0A143F9FEFBEF6533533D9106456484318F35FAF2FCF97376EDDA45505010A1A1A13C7EFC5839973F7F7E3A74E840B76EDDB0B5B52577EEDC2A462A44D69106C500444444D0BD7B779E3F7F8EB5B5B53CD625B29C31160D2FE7984C9E3C99B367CF022F1EE5EAD7AF1F53A74EA574E9D22A4798BD49832232C218C71A7DD06AB5FCF9E79F6F9C5392274F1E5AB76EAD4C7497C7B7444E240D8ACAF6EEDD4BC78E1D494C4CA465CB966CDEBC5996121659CE988A06AD564B484808D3A64D5326BFE7CE9D1B373737C68E1D4BA952A5548E30679006456484318D35FA70E8D021D6AC5943707030376FDE548EE7CB978F8E1D3BD2BD7B77DAB66D2B0BE3881C4F1A14151D3870800E1D3AF0ECD9333EFFFC73424343E59952A10A63281A743A1D5BB76E65CA94291C3B760C000B0B0BFAF7EFCF9429532853A68CCA11E62CD2A0888C7899372626262A4792754E9F3E4D7070306BD6ACE1FCF9F3CA714B4B4B6C6C6C707474A44B972EE4CB974FC52885302CD2A0A8E4E4C993D8DADA121F1F4F83060D080B0B237FFEFC6A87257228436F50B66CD9C2A44993F8FBEFBF81171FECAEAEAEB8BBBB4B63A2126950444618FA589359AE5EBD4A5050106BD6AC51C62D78B14F49EBD6ADE9D5AB179D3B77A650A1422A462984E19206450557AE5CA15DBB763C7CF8909A356BB273E74E19A484AA0CB568888C8C64C28409CACEEF969696B8B8B8E0EEEE2E1B90A94C1A149111863AD664863B77EE101C1C4C505010FBF7EF57966F373131A1499326F4ECD993EEDDBBCB3E2542A481342859ECCE9D3BB46DDB965BB76E51A1420576EEDC49B162C5D40E4BE470865634ECDFBF9F091326B07BF76E00CCCCCCE8DFBF3F93264DA27CF9F22A4727401A1491318636D67CA8478F1EB171E346D6AC59435454141A8D463957B76E5D7AF6EC49AF5EBD64FF2521D2491A942C141717879D9D1D172E5CA058B162848585C9B7C0C220184AD170EAD429A64D9BC6BA75EBD0E974989A9AD2B56B573C3C3CA85AB5AAAAB189D4A4411119612863CD87484C4C243C3C9C909010D6AF5FCFB367CF9473152A54A063C78EF4EFDF9FFAF5EBAB18A510C64D1A942C929C9C4CB76EDD387AF428F9F3E767C78E1D54AF5E5DEDB08400D42F1ACE9E3DCBCC993359B56A95128BB5B53573E7CE950F7903250D8AC808B5C79A8CD26834ECDEBD9B152B56B069D326E2E3E3957365CB96A56BD7AE383A3AD2B469D31CB5008010FA220D4A16D06834F4E8D183F0F0702C2D2DD9B871238D1A35523B2C21146A150D57AF5EE5C71F7F243030507934C2C6C6060F0F0F3EFBECB32C8D45A48F342822238CA941D1E974ECDDBB9755AB56B17EFD7A1E3C78A09C2B5AB428DDBA75A357AF5E346FDEDC287E1F218C8934285960F4E8D16CDAB40953535302030369D3A68DDA2109914A56170DF7EFDF67DEBC797879799198980840E3C68D99316306AD5BB7CE9218C4879106456484313428D7AF5F67CD9A352C59B2844B972E29C773E7CE4D870E1D707272A26DDBB6585858A818A510D99B34287A366FDE3C162C5800C082050B707474543922215E975545C3D3A74FF9E5975F98376F1E717171003468D080E9D3A7636767A7D76B8BCC650C85A6303C869A370F1E3C60EDDAB5040606B27FFF7EE5B8858505767676F4EEDD9B0E1D3A903B776E15A31422E79006458F42424270777707E0871F7E60E8D0A12A4724C49BE9BB68484949C1DFDF9FA953A7F2EFBFFF022F26938E1F3F1E171717832B56C4FB196AA1290C9B21E5CDABF34AFE3BD9BD66CD9A383B3B3360C0004A9428A1629442E44CD2A0E849747434CECECE68B55ABA77EFCEAC59B3D40E4988B7D267D1101A1ACA983163941D948B152BC6983163F8E69B6FB0B4B4CCF4EB89AC614885A6301E869037313131040606B26CD93262636395E32F27BB0F1C3890BA75EBAA169F10421A14BDB878F1225DBB7625313191E6CD9BB37CF972F91017064D1F45C39F7FFEC9D8B163D9B76F1F0079F3E665F8F0E18C1F3F9E02050A64DA75843A0CA1D014C647ADBCB979F326EBD6AD23202080E3C78F2BC75F9D5762676747AE5CB9B2342E21C49B498392C9626363F9EAABAFB87BF72ED5AB5767D3A64D585959A91D9610EF949945C3DF7FFFCDB871E3D8BE7D3B00E6E6E6B8BABA3269D224D941391B910645644456E6CD93274FD8B061032B56AC60F7EEDDCAB573E5CA459B366D707272A24B972EE4C99347EFB10821D2471A944C94949444972E5DB872E50AA54A9562FBF6ED14295244EDB08478AFCC281A6EDEBCC9A4499358BE7C395AAD161313131C1D1D9931630655AA54C9AC50858178B92CB43428223DF4DDA068B55AA2A2A258B162051B366CE0E9D3A7CAB9DAB56BE3ECEC4CEFDEBD295BB6AC5EAE2F84C81CD2A064A2E1C387F3C71F7F606565C5C68D1BA954A992DA210991261F52343C7BF68C050B163063C60C65F3B2A64D9B3267CE1C9A366D9AA9710AC3F1EAB7D142A495BE1A943367CEB076ED5A56AC58C1952B5794E3458A14A15BB76E383939D1AC59B34CBDA610427FA441C92473E7CEC5CFCF0F131313FCFCFC68DCB8B1DA2189FFD06AB568341ACCCDCDD50EC5E0BC2C1AD2B303B256AB65FDFAF58C193386EBD7AF0350AD5A35A64F9F2ECB69E700F28897C888CCCC9B870F1F121212C28A152BF8E38F3F94E3969696D8D8D8E0ECEC4CA74E9D64CC17C2084983920942434319376E1C00E3C68DA34F9F3E2A4724FE4BABD5D2BC79736EDCB8C1F1E3C7E5D1BBFF486FD1101111C19831633871E20400254A94E0C71F7FC4C5C505333319567202695044467C68DE3C7FFE9CEDDBB7E3EFEFCF8E1D3B78FEFC39F0E2CB952FBEF802676767BA77EF4EA14285322D662144D6934AE2039D3E7D1A272727B45A2D9D3B7766FAF4E96A8724DE202E2E8EFDFBF7A3D3E9183D7A34CB972F573B248392D6A2E1DCB9734C9A3489909010E0C5266643860C61DAB469142C5850EF710AC3210D8AC8888CE6CDD9B367090808202020803B77EE28C7CB952B47EFDEBD193468101F7FFC71A6C62A84508F34281FE0DEBD7BB46FDF9EC78F1F53AF5E3D020303E5C3DA40152A5488F6EDDBB375EB5656AC5841AF5EBD68D7AE5DAAD75CBB768D0A152AA814A1BADE5734C4C6C63265CA14FCFCFC484949C1C4C4845EBD7A316BD62CCA972F9F95A10A03210D8AC888F4E44D5C5C1C4141412C5BB68CBFFEFA4B399E2F5F3E1C1D1D19306000CD9A354BD7A3A94208E3200D4A06A5A4A4D0A3470FAE5EBD4AC99225D9BC793379F3E6553B2CF10E0B172E64CF9E3D3C79F2043737374E9D3A45FEFCF901080E0E66E0C081DCB87183C2850BAB1C69D67B5BD1909494849797173366CC202E2E0E8066CD9A317FFE7C3EFBECB32C8F53180E69504446BC6FF5379D4EC7EFBFFF8EBFBFFF6BBBBB376DDA94810307D2BD7B77F2E5CB9725F10A21D4210D4A068D1D3B96A8A828CCCDCD59BB76AD7C8B6C042A54A8C0CC993319397224D7AF5F67DCB8712C5CB890EDDBB7E3ECECCCE2C58B736473026F2E362322221839722467CE9C01A07CF9F24C9F3E1D272727F9C65248832232E46DABBFDDBA758BC0C040FCFCFCB878F1A272BC74E9D2383A3AE2E2E2C2279F7C92A5B10A21D4230D4A06AC59B3869F7FFE19805F7EF985962D5BAA1C9148AB61C386B176ED5AFEF8E30F162F5E4CB972E5F8F1C71F99356B1603060C503B3CD5BC5A6C9E397386D1A347B373E74E000A162CC8A44993183162041616166A86290C88342822235ECD9BA4A424366FDE8CBFBF3FE1E1E1CA390B0B0BDAB76FCFC0810369D7AE9D2CBC21440E24FFD5A7D3DF7FFFCDE0C1830170727262D8B0612A4724D2C3D4D4143F3F3FEAD5AB47525212EEEEEE4C9A3489D1A347AB1D9AAA5E16063B76EC60C2840924272763626242DFBE7D99376F9EEC002F5E230D8AC8889779B37AF56A860D1BC6DDBB779573356AD4A05FBF7E0C18308012254AA815A210C2004883920E0F1F3EA44B972E3C7DFA94FAF5EBE3E3E3A376482203AA57AFCEE8D1A3993D7B3620059656ABE59F7FFE01202A2A0A804F3FFD142F2F2F9A3469A26668C280498322D2E3D1A34704070773F5EA5500366DDA0440810205E8D8B123CECECE585B5BAB18A110C290C8274B1A69B55A7AF5EAC5A54B972851A2049B376F2677EEDC6A872532E0F2E5CBAC58B142F9F79B356B163131312A47A58EE8E8681A356AC4A953A780178F73AD5CB99203070E487322DE491A14F13E5AAD969D3B77D2B3674F4A952A859B9B1B09090900D4A95387C0C0406EDFBECD8A152BA4391142A4229F2C69E4E1E1C1CE9D3B3133332338389872E5CAA91D92C8805BB76E616363C3E79F7F4E444404B972E52239399941830629ABCBE404376EDCA067CF9EB46CD99263C78E2945E6942953E8D3A78F4C8217EF250D8A789BCB972F3379F2642A56AC48BB76ED58BB762D494949942F5F5E5988C4C3C383BE7DFBCA177D428837924F9634888C8C64DAB46900CC9C395326C51BA9F8F878BEFAEA2BAA55AB465050105F7CF1853287E8C081032C5EBCF8AD3F7BE9D2256EDCB89155A1EA4D72723273E6CCA1468D1AAC5DBB169D4E47972E5DF8F4D34F01B0B2B2523942612CA44111AF4A4C4C64F5EAD5B46EDD9A2A55AA307DFA746EDCB8819595153D7BF664D7AE5D5CB97245D9E15DF24608F12E3242BCC7BFFFFE4B9F3E7DD06834D8DBDB3366CC18B543121974E6CC19AA55ABC6BA75EB94D5A866CC98A16CCE387EFCF8B73621FBF7EF67C284095916AB3E44464652B76E5DDCDDDD79FAF429B56AD522222282F5EBD72B7F1F523488B492064500C4C4C4F0CD37DF50B66C59FAF4E9C3EEDDBBD1E9743468D080850B1772EBD62DD6AC59838D8D0DA6A6A692374288349111E21D525252E8D5AB1777EEDCA162C58A2C5FBE5C1E7D31629F7DF619EBD7AF274F9E3CCAB17CF9F229774EE2E3E3F9FAEBAFDFF8B35DBA7461F7EEDD2425256549AC99E9E6CD9BF4E8D1036B6B6BCE9E3D4BFEFCF999376F1EC78E1DA34D9B3680149B22FD246772AEA74F9FE2EFEFCF175F7C41EDDAB5F1F2F2E2C18307142A5488E1C38773FCF8718E1C39C2B061C35EDB5B4AF2460891163242BCC3E4C993F9FDF7DF31373767F5EAD5397613BFECCED6D696DEBD7B03B06DDB368282825E7B4D9E3C7968D9B2257BF7EECDEAF0322C2525052F2F2F6AD6AC49707030001D3A74E0D4A9538C193306737373E5B5523488F4929CC979626262707777A77CF9F20C1A3488FDFBF703D0B061437C7C7CF8E79F7F58B0600175EBD67DEB7B48DE0821D24296197E8B1D3B763067CE1C007EFAE92759D1C808A5A4A4101616464C4C0C952A55A273E7CEA98AF257797A7AB26BD72EEEDDBBC7A851A3B0B1B1A168D1A2A95ED3BC79730E1D3A848D8D4D5684FF4176EFDECDF0E1C3397DFA34F0627F81850B17D2BA75EB37BE5E8A06915E923339C3E3C78F59BD7A354B962CE1D8B163CAF1E2C58BD3AF5F3F5C5C5CA856AD5A9ADF4FF2460891163242BCC1EDDBB7E9DFBF3F5AAD966EDDBA3172E448B54312E9F4F7DF7FD3A0410356AC588156AB65E4C891D8D9D9919292F2C6D7172F5E9C9F7FFE1980D8D858BEFBEEBBD75E53A14205626363F51AF787BA75EB16BD7BF7A675EBD69C3E7D9ABC79F33267CE1C4E9C38F1D6E604A46810E9273993BDFDF1C71F0C1830803265CA3074E85065B53F1B1B1B828383F9E79F7F98376F5EBA9A1390BC1142A48D8C10FFA1D56A717676263636968A152BE2E7E7A77648229D626262E8D1A3074B972E2538381827272762636389888860DBB66D6FFD39272727DAB66D0BC08A152B080F0F4F753E3E3EDE6097C4D46834787A7A52BD7A75D6AC590380A3A32367CF9EE5871F7E78EB9DA397A46810E9253993FDDCBF7F1F4F4F4F6AD5AA45B366CD080808E0D9B3679429538609132670F1E24576EDDA85A3A3A3B2B0467A49DE0821D2421EF1FA8FF9F3E7131E1E8E999919AB56ADA260C1826A8724D2E1E9D3A7F4E9D387952B57D2B06143E0C5D2B9161616242525BDF6D8D67F797B7B53B76E5DE2E2E218346810870E1DA264C992C08B4D0DDF7517422DC78F1FC7CDCD8D83070F0250A54A15162C5840BB76EDD2FC1E523488F4929CC93E8E1C3982AFAF2F2B57AEE4D9B367C08B7FD7D6AD5BE3EAEA4AA74E9DDEFB25475A49DE0821D2421A94571C3E7C98891327022F36ACFBE28B2F548E48A4979F9F1F2D5AB4509A138062C58A111616C6A3478F68D6ACD93B7FBE62C58A787B7BD3BB776F6EDCB841EBD6AD59BB762D0909094447473377EE5C7DFF0A69F6E4C913264D9AC482050BD068345859593161C2047EF8E187747FBB294583482FC919E376FBF66D02020258BA7429172F5E548E57AC58918103073270E040CA962D9BE9D795BC1142A4853428FFDFD3A74FE9DBB72FC9C9C9346FDE9C71E3C6A91D92C880C0C04066CE9CF9DAF156AD5AA5F93D7AF5EAC5850B17983E7D3AA74F9FE6934F3EE1E38F3F66C3860D06B391E1D6AD5B193E7C38D7AE5D03A0458B16F8F8F850BD7AF50CBD9F140D22BD24678C8F56AB252A2A0A5F5F5F366DDAC4F3E7CF01B0B0B0E0ABAFBEC2D9D9992E5DBA902B572EBDC60092374288779306E5FF1B366C18E7CE9DA3489122AC5EBD5AAF03B4D09F53A74E291F80FF75E9D225162E5CC8C99327C99F3F3F6DDAB4C1CDCDED8D8F2E4C9E3C999E3D7BB26FDF3E8A172F4E9B366D52ED9FA2969B376F3272E448366CD800BC98DCFFD34F3FE1E4E4F4417BF448D120D24B72C678FCF3CF3F2C5DBA147F7F7FAE5FBFAE1CAF5AB52A2E2E2EF4EBD78F12254A64492C92374288B4900605D8B87123CB972F0760F1E2C5FCEF7FFF5339229151666666ECD8B123D5FC0B8D46C3CF3FFFCC942953484848508E6FDAB489E0E06076EEDCF9C6C9EF55AB56A56AD5AA5912F7FB68B55AFCFCFCF8FEFBEF898B8BC3C4C484BE7DFB327FFE7C8A172F9E29EF0F523488B4939C316CAFDE2DD9B871A3B282A1A5A5250E0E0EB8BABAD2A64D9B2CDF7C58F24608911639BE41B97DFB3683070F0660F0E0C174EFDE5DE588C487A857AF1E8B162DA265CB9674ECD8917DFBF6F1FDF7DF73E8D0A137BE3E3A3A1A0F0F0F66CC9891C591A6DD8913277075755526C157AB560D6F6FEF743DB6F63E523488F4929C314CB76EDD62E9D2A5F8F9F9A5BA5B52BB766D060F1E8C939393AA9B0E4BDE0821D222C78F102E2E2EDCBF7F9FCA952B337FFE7CB5C3111F68C08001A4A4A4D0B56B57CCCCCC68D5AA55AAE6A44E9D3AAC5EBD9AF3E7CFB370E142ACACAC58B870214F9F3E5531EA374B4C4C64DCB871346AD48883070F626969C99429533871E244A63627204583483FC919C3A1D56A090B0BA373E7CE54A85081C9932773FDFA75ACACAC70767666DFBE7D9C3C7992912347AADA9CBC8C15246F8410EF96A3EFA0F8F9F9B16DDB364C4D4D59BE7C39F9F3E7573B24F181060C18404848083B77EE4C75DCC2C282891327326EDC38CCCC5EA4FDC71F7F4C4A4A0ADF7CF30D7FFEF9A741ED10BF6FDF3E5C5C5C3877EE1C002D5BB6C4C7C727DD9BA2A595140D22BD2467D4F7EFBFFFB26CD932962C59C2D5AB5795E3356AD4C0CDCD0D676767D51B92FF92BC1142A4458E1D21AE5CB9C2B7DF7E0BC0F7DF7FFFDEE567857130353565DDBA750C1F3E9CE2C58B53A44811060C18C0B163C798346992D29CBC3464C810F2E5CB97EAC35D4DCF9E3DC3DDDD9D56AD5A71EEDC390A142880A7A7275151517A6B4E408A06917E9233EAD06AB5444444D0BD7B772A54A8C0840913B87AF52A969696383A3A121E1E4E4C4C0CA3468D32B8E604246F8410699323EFA068B55A060C18407C7C3C356BD664EAD4A96A87243251BE7CF958B060010B162C78EF6B2D2D2DA952A54A867745CE4C7BF7EEC5C5C5850B172E0060676787B7B737E5CA95D3FBB5A56810E9253993B5EEDCB9434040004B962CE1D2A54BCAF18F3FFE984183063170E0C04C593043DF246F84106991231B94DBB76F73F7EE5D2C2C2C58BD7AB5C1EC6D21D4F1F0E143EAD5ABA7EAF5BFFBEE3B020202D0E974142B560C2F2F2F7AF7EE9D653148D120D24BA3D1009233FAA4D3E9888A8AC2C7C787CD9B37939C9C0CBCF862A573E7CEB8B9B9D1B265CB2C5F892BA3743A1D3A9D0E90BC1142BC5B8E6C50CA9429C3912347D8BF7F3F75EBD6553B1CA1A23367CE90274F1E3EF9E41355AEBF71E346860D1BC6BFFFFE0B40CF9E3DF9F5D75FB3FC9B506950447ABDCC19D9332AF3DDBD7B57B95BF2F28E2ABCB85B3278F060FAF7EF6F14774BFEEBD53DAA64AC1142BC4B8E6C5000ACACACF8F2CB2FD50E43A4C1CB65332F5EBC48B56AD5183C78709A3F9CE3E3E369D3A60DFFFEFB2F919191AFED6B3269D224264C9890E51F96B1B1B18C193386C0C040004A952AC56FBFFD46972E5DB2348E97A44111E9253993F98E1C3982AFAF2F818181CA9E4D16161674ECD851B57D4B329334284288B4CAB10D8A300E5BB76EA54F9F3EC4C5C529C77EF9E517B66CD94293264DDEFBF3AB56AD529619F6F2F2E2B7DF7E53CEFDF6DB6F585A5AD2A74F9FCC0FFC1DD6AE5DCBB061C3B87FFF3E2626260C1A348879F3E651A850A12C8DE355526C8AF4929CC91CF7EEDD63F9F2E52C59B24459B50FE0A38F3E52EE96942C5952C508338F34284288B492064518ACBFFEFA8BF1E3C7131515C5C71F7F8CA7A727D3A64DE3DEBD7B74EAD48943870E51BE7CF977BE47DEBC7995FF5FB06041E0C573D0F3E7CF67F3E6CD848585E9F57778D5FDFBF7193A7428C1C1C10054AE5C195F5F5FDAB469936531BC8D149B22BD24673ECCDEBD7BF1F1F161FDFAF524252501606E6E8E8383036E6E6EB469D326DBFDDD4A832284482B19218441D268340C1D3A94B56BD7D2B061430A1428C0E4C993F1F4F4045E3C22D5A74F1F65C2E5DBF4E8D183CF3FFF1C333333AA56ADCAE2C58BF9ECB3CF387DFA34616161A91A187DDAB1630775EBD6253838181313135C5D5D3971E28441342720C5A6483FC999F47BFCF831BEBEBED4A95387962D5BB27AF56A929292285BB62C63C78EE5D2A54BAC5BB70E1B1B9B6CF9F7FA72610590B94B428877CB7E23A0C816C2C3C3A953A70E356AD448757CF8F0E1383B3B032F3633F4F7F74F755EA7D3B16EDD3AE5CF1616164446463263C60C76EDDAC5952B57F0F6F6C6DFDF3F4B9A93B8B838DCDCDCB0B3B3E3E6CD9B942E5D9A2D5BB6E0E3E343BE7CF9F47EFDB4926253A497E44CDA1D397204373737CA9429839B9B1B274F9EC4D4D4146B6B6B828383B976ED1AB367CFCE9225C5D5247750841069258F780983B467CF1EECECECDE78CECBCB8B9D3B7772E7CE1DDCDDDD717474A4408102C08B0665EAD4A9942D5B5699A392376F5E7EF8E1872C8BFDA5888808060E1CC88D1B3700707474C4DBDB9B22458A64792CEF23C5A6482F592EF6DD1E3F7ECCDAB56B59B46811274E9C508E97295306272727860E1DFADE4754B31B69508410692523843048B1B1B154AA54E98DE70A152AC4DCB9738117134C7FF9E517E59CA9A92913274E64FEFCF95912E79B242424E0EEEE4EDBB66DB971E306254A9460E3C68D0407071B647302D2A088F4939C79B397774BCA962D8B9B9B1B274E9C78E3DD929CD69C8034284288B4931142188CF8F878EEDEBDABFCF9E5C4D137717272A261C38600FCFCF3CFDCBB774F39D7BD7B778E1F3FCEAD5BB7F417EC5BECDFBF9F7AF5EA3167CE1CB45A2D8E8E8EC4C4C4D0A953A72C8F253DA4D814E92539F37FE2E2E2F0F5F5A57EFDFA346AD4085F5F5F9E3E7D4AE9D2A5193B762C972F5F263C3C1C474747CCCC72EE830BD2A00821D24A4608A1BAC78F1FD3A74F1F8A162D4A891225A85DBB36D7AF5FE7CA952B6FFD19131313A64F9F0EBC280EE6CC99A39C333535A57DFBF6ECD9B347DFA12B929393193B762CCD9A35E3FCF9F3142D5A94356BD6101C1C4CB162C5B22C8E8C926253A497E40C1C38708041830629734B8E1F3F4EAE5CB968DFBE3D5BB66CE1C68D1BCC9E3D9B0A152AA81DAA41900645089156324208D5F5EBD78F5AB56A3179F2642C2D2D89898921323292A3478FBEF3E76C6D6D69DAB429F0624F9397BBB103D4A8514399FBA16F67CE9CA171E3C6CC9D3B17AD564B870E1D3879F2243D7BF6CC92EB67062936457AE5D49C898B8BC3DBDB9BFAF5EBD3B87163FCFDFD79FAF42965CB9665D2A4495CBE7C99AD5BB7626F6F2F2B55FD8734284288B4921142A8EAF1E3C75CBB768DF1E3C73371E244828383950FAE8D1B37929C9CFCCE9FF7F0F0005ECCFB983C79B2723C212141EF1B1FEA743A162D5A44C3860D3976EC1879F3E6C5D7D797D0D0504A972EADD76B67B69785C3CBDDAB85789F9CD6A01C3E7C18575757CA962DCBD75F7FCDF1E3C7313535C5D6D6968D1B3772F5EA55A64D9B9623E796A49534284288B4921142A8CAD4D434D5FC11070707468D1A05A04C267D9756AD5A29AB7DF9F9F9B170E142E2E3E359BD7A356DDBB6D55BDC77EFDEA563C78E0C1B368C8484041A356AC4D1A347193C78B0DEAEA94F2FF7277875896621DE25273428898989AC58B182468D1AF1E9A79FB264C9129E3C7942A952A5183B762C172E5C60FBF6ED74EAD42947CF2D492B69508410692523845055FEFCF92953A60CBFFFFEBB72CCC3C3832A55AA00306BD62CCE9D3BF7CEF7F0F3F35326CC8F183182D2A54B336CD8302A56ACA89798B76EDD4AEDDAB5090D0D2557AE5C4C9830813FFFFC93AA55ABEAE57AFAA6D3E994C221202080274F9EA81C913006D9B9413971E20443860CA1448912F4EBD78F23478E606A6ACA575F7DC5FAF5EBB97EFD3AB367CFA672E5CA6A876A54A4411142A4958C104275E3C68D5326BC03E4C993071F1F1F4C4C4C484C4CC4D5D5F59D3BC6972E5D9ABFFEFA8BB0B030020303397DFA34FDFBF7CFF438939393193D7A340E0E0EC4C6C652A1420576EFDE8D878707E6E6E6997EBDACB261C306E5FF3F7CF8106F6F6F15A311C622BB3528494949AC5AB58AA64D9B52AF5E3D7C7C7C888F8FA764C992B8BBBB73E1C20576EEDC49972E5D8CFABF773549832284482B192184EA3A76EC485C5C1C6BD7AE558EB56EDD9A81030702B077EF5E962C59F2CEF7303333A36DDBB6F4EDDB572FCF805FBE7C9966CD9AE1E9E9894EA7A377EFDE9C387182E6CD9B67FAB5B2924EA763DAB469A98EFDF4D34F3C7BF64CA58884B1C82E0DCA952B57707777A75CB972F4EDDB9734602DC100002000494441543FFFFC131313135AB76E4D707030D7AF5F67D6AC5972B7241348832284482B19214496BA7DFB36D1D1D11C397284C4C444E0C592C18B172F56365F7C69DEBC79942A550A801F7EF8819B376F6679BC009B366DA251A3461C3A74082B2B2B3C3D3D59B56A15050B1654259ECCB47EFD7AFEFEFBEF54C7EEDCB9237751C47B197383A2D56A898888A07BF7EE54AD5A953973E670F7EE5D0A142880ABAB2B7FFFFD37919191383A3A626161A176B8D98634284288B4921142648943870ED1AA552BCA9429438B162D68D4A811C58A1563C89021DCBE7D9B860D1B12151595EA670A172ECC82050B8017AB7D0D1D3A344B634E4A4A62D4A85174EEDC99870F1F52BD7A750E1C38A04CE237763A9D2ED5A375AF9A376F9EDC4511EF648C0DCAA3478FF0F2F2A24A952AD8D8D8101212424A4A0A356AD4C0D3D3935BB76EE1E3E343EDDAB5D50E355B920645089156324208BD5BBD7A354E4E4E74EAD489C0C0405C5C5CC893270F4F9F3EC5C7C787FAF5EBF3D75F7FBDF18E44B76EDDE8D8B123005BB66C49F518983E5DB87081C68D1BF3EBAFBF023060C0008E1C39429D3A75B2E4FA59212424E4B5BB272FDDBE7DFBBD8FD5899CCD981A943FFFFC93BE7DFB52AA5429BEF9E61BAE5CB9829595154E4E4EECDFBF9FD3A74F336AD428F2E6CDAB76A8D99A3428428834D309A147478F1ED5D5AB574FF7E0C18354C7CF9C39A3FBE4934F74800ED01529524477EEDCB937BEC7AD5BB774850A15D201BA92254BBEF65E992D343454B95EEEDCB975BEBEBE7ABD9E1A341A4DAABFFF37FDAF54A952BA67CF9EA91DAA30502E2E2E3A40F7EDB7DFAA1DCA1B252424E8962F5FAEAB57AF5EAABCFEE8A38F74B367CFD6C5C6C6AA1D62960A0C0C54FD778E898951FE1D8410E25DE42B0CA1373A9D8E7EFDFA3177EE5C0A172E9CEA5CF5EAD5090F0F57269E3E78F0804E9D3AF1FCF9F3D7DEA774E9D2CC9C391378313FE2FBEFBFD74BBC1A8D86F1E3C7E3E0E0C0A3478FA855AB9651EF6DF22EC1C1C19C3C79F29DAFB97DFB367E7E7E5914913036867A07E5F4E9D38C18318252A54AD1AF5F3F8E1F3F4EAE5CB9B0B7B767FBF6ED9C3F7F9EB163C752BC7871B543CD521E1E1E444747BFF7754949493469D284458B1691929292A931186ACE08210C8F8C12426FA2A2A2888D8DA54D9B366F3C5FB264498283839549A867CE9C79EB63456E6E6EB46CD9128065CB96111F1F9FA9B1DEBF7F1F3B3B3B66CD9A854EA7A367CF9E1C387080EAD5AB67EA750C8146A3796DE5AEB799356B96EC2E2FDEC8908A4D8D4643686828363636D4AE5D9B850B17F2F8F1634A9428A16CA8B865CB166C6D6D0D225E3568341A929393DFFB3A4B4B4BFCFDFD397CF8300D1B3664EFDEBD99168321E58C10C2B0C92821F4262828882A55AABCF3C3A861C3864C993245F9F39C3973DEB8E789A9A929010101142A5488BA75EB66EAB3E2478F1EA551A346ECDAB50B33333366CF9ECD9A356BB2EDF3E84141419C3973264DAFFDF7DF7FF1F7F7D77344C2181942B1F9EFBFFF3267CE1C2A55AA84838303111111E8743A1A366C888F8F0F57AF5E65F6ECD954AA5449B518B3CAC3870F993061028181815CBD7AF5B5F3262626697EAF1A356AE0EFEFCFF2E5CB19356A144B972ECD94180D21678410C6C14CED0044F675F0E041CA9429F3DED78D193386E5CB9773FEFC79AE5FBFCEE1C387F9F4D34F5F7B5DC58A15B97CF93279F3E6CDB40FB8254B963062C408929292285DBA34C1C1C1346BD62C53DEDB1069341A3C3C3CD2F53373E6CCC1C5C5054B4B4B3D45258C919AC5667474349E9E9E6CD9B245790C297FFEFCF4E9D387AFBFFE3A5B2D669156DBB66D531E85052857AE1C2D5BB6A479F3E6B468D102131393776E78FB26F5EAD5233A3A1A5B5B5BCA962D4BBB76ED3E2846695084106925A384D09B0B172E70EDDAB5F7BECEC2C28279F3E6297F8E8C8C7CEB6B0B172E9C29FB12A4A4A4E0EEEE8EABAB2B494949346BD68C23478E64EBE60460D5AA559C3D7B365D3F73E3C60D962D5BA6A78884B1CAEA62333939999090109A3469428B162DD8B0610329292954AB568DD9B36773EDDA35162F5E9C239B13001B1B9B548FA4DEB87183952B57E2E6E6468D1A35387FFE3CBEBEBE2C5AB488D3A74FA7F97DF3E5CB4740400063C78E45A3D17C508CD2A00821D24AEEA008BD494E4EE6CA952B242727BFB7A9B0B7B7A75AB56A9C3B778E0B172EE835AEFBF7EFD3BD7B7765DF95E1C387F3F3CF3F636E6EAED7EBAA4DA3D1A4FA86353D66CE9CC9C0810365D33AA1C8AA62333636161F1F1F162D5AC4EDDBB701C8952B170E0E0E8C1A354A999B96D3952C599253A74E71F0E041A2A3A3D9BB772FFBF6EDE3F1E3C7CA6BF6ECD9C39E3D7B002851A2042D5BB6A465CB96B46AD58A9A356BBEF531B08F3EFA884A952A71FEFC796AD4A891E118A5411142A4958C12426FCCCCCC484C4C64CB962DEF7DAD898909AEAEAEC08BE7CAF5E5FCF9F3346DDA94A8A828CCCCCC58B060010B162CC8F6CD0940606020E7CE9DCBD0CFDEB87183808080CC0D4818B597C5667AE636A4C7B973E718356A14152B5664F2E4C9DCBE7D9BFCF9F3E3EAEA4A4C4C0C1B366C90E6E43F72E5CA4593264DF8E1871FD8BA752BF7EFDFE7E8D1A3787A7A52B87061CCCCFEEF3BC9D8D858424242183E7C38B56BD7A664C99274EBD68D050B1670EAD4A9D71E07CB9D3B37F7EFDFFFA0F8A4411142A495DC41117A53B97265CE9C3983B7B737DDBA757BEFEB6D6C6C00F4F62DFD8E1D3BE8D5AB178F1F3FA668D1A2848484F0E5975FEAE55A8646A3D1306BD6AC0F7A8F193366D0BF7F7FB98B2200FD149B5AAD96A8A828BCBCBCD8B66D9B522457AE5C19575757DCDCDC2854A850A65D2FBBCB952B17F5EBD7A77EFDFA787B7BE3E5E5C5279F7CC2EFBFFFCE9E3D7B888E8E569A8EBB77EFB27EFD7AD6AF5F0F40B162C568D4A811850B17E6CE9D3BFCF1C71F2C5EBCF883E2910645089156D2A008BDA95DBB3667CE9C21323292F0F070A501799BAA55AB922B572EBD1420B367CF66C2840968B55AEAD6ADCBE6CD9BA950A142A65FC750BD5C84E0435CBF7E9D152B56E0E2E29249510963F6723E4266149BF1F1F12C5BB68C050B1670F1E245E578EBD6AD19356A141D3A7490A2F60399989860626242BD7AF5A857AF1EA3468D42ABD572EAD4A9540DCBDDBB7701B877EF1E616161CACF4F9B36ED83C7666950841069250D8AC8B0F0F0707C7D7D898989A15EBD7ACC9E3D9BF2E5CB2BE73B76EC48484808F062A5AEC3870FBFF3512A737373743A1D0D1A34C8B41853525218316204DEDEDE00B46FDF9ED5AB5753A040814CBB86A17BFEFC393366CCC894F7F2F0F0C0D9D959EEA208A5D8CC952B5786DFE3CA952BF8F8F8E0EBEBCBC3870F811777507BF4E8C198316372EC84777D78D3A378A6A6A6D4A953873A75EA3062C408743A1DA74F9F263A3A9A63C78E11131343C99225E9D9B3278E8E8E1F1C8334284288B4920645A49B46A3C1DDDD9D13274E306EDC388E1E3DCA983163387EFC38478F1EC5CACA0A7831F1BD60C1823C7EFC98BFFFFE1B0F0F0F7EFCF1C7B7BEEF83070FD06AB599F65CF9A3478FE8D6AD9BB22AD8C4891399366D9ADE9E9937540101015CBE7C3953DEEBDAB56BAC5AB58A01030664CAFB09E3F521C5E6DEBD7BF1F2F262F3E6CDCA9D9852A54A3174E850DCDCDC2851A244A6C62A5E6CC0F8EA1C9437313131A156AD5AD4AA554B2F3148832284482B192544BA4D9D3A95B8B83876EEDCC9975F7E49686828F06227F8FDFBF72BAF2B50A00063C78E55FE3C73E64CA2A3A3DFFABEE1E1E13469D284BA75EB7E708C57AE5CA169D3A644464662666686B7B7F7FF63EFBEA3A2BABEB7813F14292A622F882056BED8B087A8A0C4820296D80B8A5DB160EC05BBC49A88624513150B88C62810158C6289622C892808D85150014511E9E5BE7FF8323F096D66986118E6F9ACE58ACCBD73CF361ECFEC3DE7DE73B076ED5A952B4E323232A45EB9AB30AEAEAEA2BD274875499A6C7EBD4CB09595154E9D3A85ECEC6CB46DDB167BF7EEC5F3E7CFB17CF972162772B275EB5674EFDE5DA131B04021227171942089DCBC79133E3E3E7073731325FBF5EBD707F0E5560F4343C33CE7CF993347547064656561D0A04105EE629E959585AD5BB71639C322AEBFFFFE1B16161678F8F021AA55AB86C0C0404C9D3AB5C4D75546070E1C287057E99278FAF4298E1E3D2AD36B92F21137D98C8B8BC3C68D1BD1B871630C1B360C376FDE84BABA3AECECEC70E1C205FCF3CF3F9832658A68E695E4C3CACA0A75EBD655680C2C5088485C1C2548229B376FC6983163A0ABAB2B7A6DE3C68D707474C4810307D0B469D33CE7EBEAEAC2CFCF4FB4A3FCFBF7EFD1A54B171C3D7A54746BC7A74F9FE0E8E8082B2BAB621FA42FCE6FBFFD861E3D7A203636168D1A35C2F5EBD75566A5AEFFCACCCCC4860D1BE472EDB56BD7721645C515976C86858561C28409303232C2E2C58B111D1D0D7D7D7DCC9B370F4F9E3C819F9F1F7AF6EC599A219382C9726105222ADF384A90D8DEBF7F0F5F5F5F74E9D225CFEB8686863870E0001C1C1C0A7C5F83060D70F3E64DD12EED1F3E7CC098316350B76E5DB469D30675EBD645C3860DB169D3A612C5B773E74E0C1B360CA9A9A9E8DCB9336EDCB851A24DC594DDFEFDFB653E7B92EBE9D3A7F0F2F292CBB549391456A0FCF5D75FB0B7B747AB56AD70E0C001A4A7A7A371E3C6D8B061035EBC78812D5BB6C0C4C4441121AB3C7F7F7FF4EAD50B5656560AD9D748160B2B10916A60814262BB75EB16B2B2B250B9726589DFDBA041035CBD7A15FEFEFE183F7E3CBA74E982962D5BA257AF5EB87DFB36D6AD5B27F5F321822060D9B26598397326727272F0FDF7DF2328280875EAD491EA7AE5417A7A7A89F73D29CEBA75EB44DF8892EAF9BA40C9CECE868F8F0F3A76EC886EDDBAC1DFDF1F8220C0CACA0ABEBEBE78F4E811162D5AC43D4C14C8D7D7170B172E84A6A626AE5EBD8A091326E0F1E3C7A2E3D1D1D17074744493264D60666686A953A7E2DEBD7B328D81B7781191B8B88A17892D2C2C0C00909C9C2CD1FB5EBD7A85C0C0404C9C3811B6B6B6B0B5B595594CD9D9D9707272828787070060C28409D8BB776FB1ABD59477FBF7EFC7AB57AFE4DAC6A3478FE0EDED8DD1A347CBB51D2A9B7293CDDBB76FC3CCCC4CB4CF8EBABA3AFAF5EB87A54B97C2C2C2429121D257962E5D8A13274E401004DCBE7D1B292929D0D6D606F0656CB7B2B2CAB3537C787838F6EFDF8F79F3E661C3860D32292A58A01091B8384A90D8525353017C49482491949484FDFBF7CB3C9EF4F4740C1F3E5C549C2C5AB408BFFCF28BCA172769696912CD9EFC77E64A92992CCEA2A8A6F8F878D1D2D5870F1FC6A3478FA0ADAD0D0707073C7CF8107E7E7E2C4ECA9084840454A952052D5AB440CB962DF1F2E54BBC7AF50A46464610040163C78E1515270D1A34C08E1D3BE0E9E98909132660DBB66D70767696491C2C5088485C1C25486C82200000CE9E3D2BD1FBAA54A922FA609295848404585B5BE3B7DF7E838686063C3C3CE4F640B8B2F1F0F0404C4C4CB1E755AB560D6E6E6EE8D6AD5B9ED7870D1B06373737B136B38C8888106DC649E5DFA3478F3075EA54181919212A2A0A00A0A7A787356BD6202626069E9E9E68DEBCB982A3A4FF7AF6EC599E054C2A56AC881A356A00001E3E7C887FFEF907C09767430203033163C60C38383860DFBE7DF8EBAFBF70ECD8315CBA74A9C471B040212271719420B1191B1B0300AE5CB982070F1E88FDBEA4A424D1AD04B2101B1B8B1E3D7AE0C68D1BD0D6D686B7B737264F9E2CB3EB2BB3B4B4B462171B50535383838303222323E1ECEC9C6FC6A442850A70767646787878A10B1F7C6DCD9A35322F40A96C090909C1D8B163616666060F0F0FA4A5A58996055EBF7E3D962F5F2E4A78A9ECD1D2D212CD80FFD7D5AB5745BFEFD5AB174C4D4DF31CEFD8B12376EEDC59E2454C00162844243E8E1224B6AF3FB824B985E8F9F3E768D2A4894C6278F1E205BA76ED8AFBF7EFA36AD5AAF8F3CF3F3164C810995CBB3CD8B3674F91B3279D3B77C6AD5BB7E0E9E9895AB56A01F8BF99B15CB9058B8181013C3D3D11181858E4B7E2E1E1E19C4529A72E5FBE0C1B1B1B989B9BE3F0E1C3C8CECE868585054E9D3A85B66DDB0200F72F5102464646F8F7DF7F0B3CF67581D2A74F9F02CF193E7C3822232391989858A23858A01091B8384A90D83A74E8204A6ABDBDBD71E3C60DB1DE17141494EF362269444646C2D2D2124F9E3C41EDDAB5111414245ABA98BECC9E6CDEBCB9C063D5AB57879B9B1B6EDCB8810E1D3AE439F6DFD98FFFCEA8F4EAD50B0F1E3C809B9B5BA12BB87116A5FC1004017E7E7EF8F6DB6FD1A3470F0404040000BA74E9025F5F5FDCB8710383060D62B2A944AA56AD0A030303F8F8F8E4793D333313172F5E14FDFCCD37DF14F87E353535585858E0C99327258A837D8688C4C55182C4A6A1A181C1830703F892C44C9F3E1DE9E9E945BE272B2B0BA74E9DC2C081034BD476585818ACADADF1EAD52BD4AB570F172F5E84B9B97989AE59DEECDAB50BAF5FBFCEF39AA6A62666CD9A85A74F9FC2D9D9B9C0C4E0BF332805C9BDED2B3434B4C0BFCB870F1FE2D4A953D2074F0A9793938313274EA055AB56E8DFBF3F828383453BBEFFFDF7DFA2FD4DBE3E1F60B2A92C962E5D8A89132762F7EEDDC8CACA82200858BD7A35E2E3E30100B56AD5CAF7E5C5D70C0C0CF28D2F92629F212271719420892C5AB448F43CC9FDFBF7B164C99222CFDFBD7B376C6D6D51AD5A35A9DBBC73E70EACACACF0FAF56B346CD810D7AE5D43CB962DA5BE5E79949C9C9CEF1EF16EDDBAE1CE9D3BD8BE7D7B91FB4F14768B57418C8D8DF1FBEFBFC3DFDF1F8D1B37CE736CEDDAB562153B54B6A4A7A7C3D3D313A6A6A618366C18C2C2C2A0A5A505070707848585C1CFCF0F9D3A75CAF73E269BCAA54F9F3E983D7B369C9C9C50A54A15D4AA550BAEAEAEA2E33366CC2872054459FCDB669F21227171942089346CD810F3E7CF17FDECE6E68603070E14786E4C4C0C76ECD801171717A9DBBB7AF52A7AF4E881F7EFDFC3CCCC0CD7AF5FCF9718D397D993D8D8580040BD7AF570E8D0215CB972056DDAB429F6BDFFBD354B9CE4C1D6D6160F1F3EC4860D1B44CF20DCBF7F1FA74F9F96227A5284A4A4246CDCB81146464618376E1C1E3F7E8CCA952B63EEDCB978F6EC99A868290C934DE5E3EAEA8A23478EA04E9D3A79F63C193A74689E2F9B323232F0E2C58B3C45C9A3478F440BA5488B7D8688C4261049282B2B4BB0B7B717000800040D0D0D61E5CA9542565696E89C376FDE081D3B76142E5EBC28753B41414142A54A95040042FBF6ED85F8F87859845FEE7CFEFC59A85DBBB6A0A9A929CC9E3D5B484C4C94E8FD9D3B7716FD5D0210264C9820D1FB9F3E7D2AD8DADA0A000473737321272747A2F753E9FAF0E183B07AF56AA17AF5EAA2BFF39A356B0AAB57AF16DEBF7F2FF675DAB4692300108E1D3B26C768491EB2B2B284B0B030C1D7D757080F0FCF77BC7BF7EE0200C1D2D252484B4B13DEBD7B27346CD850C8CCCC2C51BB070F1E1400081D3B762CD17588A8FC53ED1DED482A1A1A1AA2A57D8F1D3B86ECEC6CAC5EBD1A1E1E1EB0B3B343666626020202B073E74E585B5B4BD546505010ECEDED919C9C8C4E9D3A212020A0C8DB945499BBBB3BCCCCCCE0EEEE2ED5AD6FC53D245F9C468D1AC1DFDF1F7E7E7E983D7B367C7D7D3160C00089E320F97AF7EE1DDCDCDCE0EEEE8E4F9F3E01F832DB367FFE7C4C9D3A15952A5592E87AFC365C79696868C0CCCC0C666666051E0F0D0D05F06506FBB7DF7E43505010C68D1B57E24D70D96788485C1C25482A152B56C4D1A34711101080FEFDFBA36AD5AA78F3E60DCE9E3D0B2D2D2D04070763D0A041525DFBEAD5ABE8DFBF3F929393D1BE7D7B9C3B778EC54921044140E7CE9D111414A4F0E772ECEDED11161686CCCC4C85C64179C5C7C763D5AA5568D2A4095C5D5DF1E9D3273468D0006E6E6E78FAF429E6CE9D2B71710230D92CCFE6CE9D2BFAA2C2C9C909B1B1B158BA746989AFCB3E4344E2E20C0A9548EFDEBDD1BB776F005F926549BF7DFFAFAB57AFC2D6D6169F3F7F46FBF6ED71E1C285123D605FDEA9A9A9A1478F1E25BA8620C143F2C5A958B122F7A52923626363B175EB56B8BBBB23252505C09767C8E6CC9983A953A79678FF12269BE5D792254BD0A74F1FDCBB770F8D1B3786A5A56589C776807D8688C4C7028564A6A41F607FFEF927FAF7EF8FD4D454585858E0FCF9F3A852A58A8CA2A3C294F4162F2A5B9E3F7F8E0D1B36E0E0C183C8C8C80000346FDE1C4B972EC5A851A34A7C9B4E2E269BE55BBB76EDD0AE5D3B995E937D8688C4C50285CA84EBD7AF63E0C081484D4DC5B7DF7E8B73E7CEB1382925B29C4121C579F9F2257EFAE927ECDDBB57B43F518B162DB070E1428C1E3D1A1A1A1A326D8FC926498A7D8688C4C55142459D3E7D1AD7AF5F5774180080E0E060F4EDDB17C9C9C99C395100CEA028B7972F5F62DAB46968DAB429B66FDF8EF4F474B46DDB16A74E9DC283070F3076EC589917270093CDF2CCC7C707CF9F3F97F975D96788485C1C255490878707BEFFFE7BF8FAFA2A3A14848484C0CECE0E49494930373787BFBF3FF4F4F4141D964AE10C8A728A8E8E86B3B3339A376F8EBD7BF7222323032D5BB6848F8F0FEEDEBD8B418306C9F5EF92C966F975FFFE7D585959C1DEDE1ED7AE5D93D975D96788485C1C25548C979717A64F9F0E4B4B4BAC5EBD5AA1B13C78F0003D7BF6444242025AB56A853FFFFC13D5AB5757684CAA88058A72898B8BC3E2C58B45332669696968D1A2050E1D3A849090100C1D3AB454FE0E996C965FEBD6ADC38B172F3063C60C383B3B63D6AC59C8CECE2EF175D96788485C7C064585040606C2D1D111AD5BB7C6E9D3A74BBC8A4F493C7EFC187DFAF4C1BB77EFD0B46953040404A0468D1A0A8B4795B140510E717171F8F9E79FB17DFB76A4A6A60290EF3326C561B2A97C32333371E6CC1984848440575717262626E8D4A9131A376E9CEF5C757575D8D8D8A057AF5E98356B16E6CE9D8B6DDBB695A87DF6192212170B141511141484010306C0C4C444E19B1EBE78F102D6D6D678F3E60D1A356A844B972EA15EBD7A0A8B47D5B14029DB626363B161C306ECDDBB374F61B262C50A0C19324461C91E934DE5F2F6ED5BF4EAD54BB409E3D71A376E8C7EFDFA61C48811B0B0B0C8330668686860C78E1DB0B2B2425454148C8D8DA58E817D8688C4C5514205DCBA750B03060C40FDFAF571E9D225D4AE5DBBC0F3D2D3D3F1C71F7FC83596B8B838F4E9D307D1D1D168D0A0012E5EBC08434343B9B649456381225F6FDEBC41505050BEFFCFC5F9F0E103962E5D8AC68D1BC3CDCD0DA9A9A9F8DFFFFE072F2F2FDCBF7F1FC3860D5368A2C76453B9CC983103A1A1A1505757CFB731E7D3A74FE1EEEE8E2E5DBAC0C4C4040B172EC4BFFFFE2B3AAEAEAE8E2E5DBAE0DEBD7B258A817D8688C4C5199472EEC18307E8DBB72FAA54A9820B172EC0C0C0A0C0F3D2D2D260676787AB57AF223A3ABAD022A624929292D0AF5F3F3C7AF408356BD6446060201A366C28F37648325CC54B363E7CF880B0B0303C7CF850F4DF070F1E2036361663C78E157B43CDCF9F3FC3CDCD0D3FFDF4133E7EFC080068D6AC1956AE5C891123469499E48EC9A6F2F8F4E913FCFDFDB173E74E4C9830013A3A3A888F8F476464242E5FBE8C808000DCBC7913595959888A8AC2E6CD9BB179F366346FDE1CDF7EFB2DAA56AD8AA3478F62D8B061258A837D8688C4C502A51C7BF2E409FAF4E903757575040606C2C4C4A4C0F33233333174E8505CBC78113B76EC904B7192919181214386E0EEDDBBA858B1227C7D7D616A6A2AF37648729C41914C545414C2C3C3111A1A8A888808D17F1313130B3CBF42850A58B97265B1D7CDC8C8C0C18307B172E54ABC7DFB1600D0A04103B8B8B860C2840932DB605156721F9A66B259F6BD78F1029D3A7582939393E8B55AB56AA156AD5AE8DAB52B5C5C5C101F1F8F13274EC0CBCB0BD7AF5F872008888C8C4464642400C0C6C6066DDBB62D511C2C5088485C65EB138F6426262606BD7BF7467272322E5EBC083333B302CFCBC9C9C1B871E3E0EFEF8F75EBD661C68C19328F253B3B1B63C68C41606020B4B4B470EAD429585858C8BC1D920E0B94FC727272F0E2C50B848787232C2C2CCF7F3F7FFE2CD1B5264E9C88468D1A157A3C3333135E5E5E58B56A9568EF899A356B62FEFCF970767656E8621645C94D364BFBE17C929C969616AA55AB56E439B56AD5829393139C9C9C101515051F1F1F040606222B2B0BD6D6D658B0604189C706162844242E1628E5D0BB77EFD0BB776FBC7DFB16E7CE9D43870E1D0A3C4F1004383939C1CBCB0BCECECE58B66C99CC63110401D3A74FC7891327A0AEAE8EC3870FA34F9F3E326FA72C4B4C4C444E4E0ED4D5D5A1AFAFAFE870F251F502E5F5EBD7796ECB0A0B0B43484888C48548417474740AFD7795939383DF7EFB0DCB962DC3E3C78F0100D5AB5717AD9854D6372B65B2A93C8C8D8DF1E4C913088220D6BF6F6363632C58B0000B162C90691CEC3344242E1628E5CCA74F9F60636383C78F1FE3F7DF7F87959555A1E72E5EBC187BF7EE85A3A323B66EDD2A977856AF5E8D7DFBF6010076EEDC59E27B989541585818F6EDDB879B376FE2C18307484949111D53575747D3A64DD1B163470C1D3A14FDFAF553F8AD3BAA50A0646565E1D9B367796ECB0A0F0F47444404D2D2D2E4D6EE8C19330A5C04E2F4E9D37071714158581800404F4F0F3FFCF003E6CE9D5B268BD88230D9541EBABABA303535C5E5CB97C57E164A1E785B2011898B054A39929292027B7B7BDCBB770F478F1E85ADAD6DA1E7BABABA62D3A64D183C7830F6EFDF2F97A4F4C08103A2CD2057AF5E8D69D3A6C9BC8DB2E6D8B163707474446666262A54A880254B96A059B366D0D2D242727232AE5CB98263C78E21323212478E1C41EBD6AD71E8D021989B9B2B2C664957972ACB323333F1F8F1633C7CF850F42BB710C9C8C828D558F4F4F4B068D1A23CAF5DBF7E1D0B172EC48D1B37007C491C9D9C9CB078F162D4AC59B354E32B291628CA65E5CA95183F7E3CAE5DBB966F15AFD2923BD6F0B640222A9640E5427A7ABAD0B76F5F414D4D4DF0F0F028F2DC9D3B770A0084DEBD7B0BE9E9E9728927202040A850A1820040983871A25CDA286B323333057D7D7D0180E8D7C68D1BF39D77E3C60D41474747748EBEBEBEF0E0C1030544FC45A3468DF2C43C77EE5C85C522AD57AF5E0923468C10F5B9B2F06BF9F2E5A2F8C2C2C284FEFDFB8B8E696A6A0A53A64C1162626214F87FAD642A56AC2800106EDFBEADE850484CFBF6ED136C6C6C84C4C44485B4EFE2E2220010468D1AA590F6894879F0ABAF72203B3B1B0E0E0E3877EE1C366DDA84C99327177A11C0A12E0000200049444154EE912347306BD62CF4E8D10367CE9C81969696CCE3090D0DC5F0E1C3919999091B1B1BECD9B347E66D94456FDFBECDB792D3FDFBF7F39D6761618159B366897E4E4C4CCCB3BA4E6913CAC12D5E868686F0F2F2C2850B173078F06085DF3657BD7A75CC9B370F313131983A752ADAB469035F5F5F0040CF9E3DF1CF3FFF60EFDEBD852EFBAD0C3883A27C264D9A84418306C1D2D2B2C0B149DED86788485C1C25949C2008983A752A7C7C7CB06AD52ACC9F3FBFD073CF9C3983F1E3C7A343870E3873E68C5C56078A898941BF7EFDF0F1E347B46CD912DEDEDE0A4F164B8B818141BEE70D3A77EE5CE0B9DDBB77CFF3F3B56BD710151525AFD08A541E0A945C5656563879F2249E3D7B86254B9628ECB6296767676CDDBA154D9B3685878707B2B2B260616181AB57AFE2C2850B68D5AA9542E29225269BCA4510046CD9B2055BB66C41484808DAB56B8751A346C1D3D313AF5EBD2A9518D86788485CAA91399663F3E7CFC72FBFFC8259B36615B9D7C2C58B173162C408989A9AE2ECD9B3D0D3D393792C898989B0B1B1C1AB57AF60646484808000A579E05716D4D5D571E6CC19CC9D3B17D1D1D1F8FEFBEF0B9D192968D9D9C8C848181B1B177AFD9090109C3871020F1F3E44565616EAD5AB074B4B4B0C1A3408152B56943AEEF254A0E46AD0A0017EFCF147AC58B1025E5E5E707777CFB333B63CE9E9E9C1CDCD0D1F3E7C0000B46CD912EBD7AF879D9D5DA9B45F5A986C2A97E5CB97C3D5D555F473767636BCBCBCE0E5E5050068DCB831ACACAC44BF8A1A8BA4C53E4344E26281A2C45C5C5CF0F3CF3F63DCB871D8B66D5BA1E7DDBC791303070E44FDFAF5111818881A356AC83C96ACAC2C0C1F3E1CA1A1A1A85AB52AFEF8E30FA5BE7D455AEDDAB5C3E5CB978B3DAFA002313939B9C073D3D3D3E1E4E484DBB76F63D2A449E8DAB52B12131371FAF469383838A066CD9AD8B56B17860C192255CCE5B140C9A5A3A383F1E3C763FCF8F1B87BF72EB66DDB066F6F6F646666CAADCDA4A424005F8AA4356BD6C0C1C1A15C3E14CC645379A4A7A763EBD6AD9832650A1A356A84D8D858DCBA750BB76FDF162D1EF1F4E9533C7DFA14BFFEFA2B802F4B0D5B5959A1478F1EE8DEBD3B1A366C58E238D86788485C2C5094D4B66DDBE0EAEA8A41830615B90AD7FDFBF7616B6B0B7D7D7D5CB87001F5EAD5934B3CF3E6CD434040002A54A88093274FA265CB96726947D9242525E1EFBFFF464444049E3D7B86B8B8387CF8F001717171625F63D2A449D0D0D0C09D3B77F23C33347CF870D8DADAC2C1C101C3870FC79123473072E44889632CCF05CAD7DAB76F0F4F4F4FAC5FBF1E7BF6EC81878787447F0FE2AA5EBD3A962C598299336796D94D166581C9A6F2888E8E46D7AE5DB177EFDE3CAFA7A6A62238381857AE5CC1E5CB9771EBD62DD1B2DB515151F0F4F484A7A72700A053A74E080C0C2CD1AC38FB0C11894D810FE8939402030305353535A16FDFBE45AEC215111121D4AE5D5BA85DBBB610111121B778F6ECD9235A9D68D7AE5D726B4759C4C5C5096E6E6E42C78E1D050D0D0DD1FF9B060D1A0883070F16E6CF9F2FAC5CB932DFAA4FA74E9DCA77AD5BB76E09D5AB5717A2A3A30B6D6FF0E0C10200A17AF5EA427272B2C4F11A1A1AE68963F1E2C5125F4319A5A7A70B3E3E3EC2B7DF7E2BB395BB6C6C6C8484840445FFD1E42E3B3B5BF4670E0F0F577438548C8C8C0CA179F3E6C2AB57AF8A3C2F353555080A0A1256AE5C2974EFDE3DCF6A8300843367CE94288E3973E60800842953A694E83A4454FEF16B0C2554A74E1D2C5CB810A74E9D2A7415AEA8A828F4EAD50B19191908080840F3E6CDE512CBB56BD7307BF66C00C0CC9933317DFA74B9B4A30C727272E0EEEE8EC68D1B63CE9C39B87DFB36343434306DDA34848484E0E5CB973879F224366FDE5CE44A6B5F3B7FFE3C121212606A6A8A67CF9E15788EBDBD3D0020212101972E5D92386E41456650FE4B4B4B0B43870EC5F5EBD7111C1C5CE4BE41E268D4A811FCFCFC50AD5A3519455876E57E130EF0DB706550A14205AC5FBF1E5DBB7685BBBB7BBED50673E9E8E8A07BF7EE58B56A15828282F0F1E3475CB972059B366DC29C3973F22DEE2129CEA01091B8788B97126ADDBA355AB76E5DE8F1B8B838D8D8D8E0FDFBF7387FFEBCDC36017CFEFC39060F1E8C8C8C0CF4EAD54B6EBBD12B8BF1E3C78B6E8700BE1492BEBEBEE8D4A993D4D7CC5D01EDF3E7CF88898929F0E1FAAF5F93C56A3CAA52A07C2D2323A3C4CBAEFEF8E38F2AB3621D0B14E53368D020989999E1E79F7F86A9A929FEF7BFFFC1D6D6163367CE84B6B67681EFD1D6D686A5A5252C2D2D6512030B142212976A7C9AAA90DC95B49E3D7B86D3A74FA35BB76E726BC7D6D616F1F1F168DEBC398E1F3FAE32C95941FCFDFDF3142700B067CF9E12152700E0E4E484F8F878181A1AA26BD7AE059E131D1D2DFA7DEDDAB5256E43556750802F8B3BAC5DBB16AEAEAEC8CECE96FA3A6DDAB4C1D0A143651859D9C6024539356FDE1C7BF7EE85BBBB3B2E5FBE8CEBD7AF233939B9D00245D658A01091B85437A32C8752525260676787FBF7EFC3CBCB0B7DFBF6954B3B3939391833660CC2C3C351AD5A35F8FAFAAAC46D2D453975EA549E9F2B55AA84FEFDFB177AFEA74F9FC4BAAEBEBE3E7EFEF9E722CF090A0A129D6B6D6D2DD675BFA6AA05CACB972F3166CC185CBB76ADC4D75AB76E9D4A255D2C50949B9696167AF7EE8DDEBD7B976ABB2C5088485C2C50CA91912347E2C68D1B3870E0805CBFCD5DBD7A35FCFDFDA1A1A1016F6F6F346BD64C6E6D298BCF9F3FE7F9B96AD5AA457E08CB6A4F8E9898181C3E7C18C0977D0EA4291455B1403971E204A64C99828F1F3FE63B666C6C8C3A75EAE0D6AD5B625DCBC2C2A2DCED71521C1628CAEDE5CB973873E60CC2C2C290949484BA75EBA2499326B0B3B34383060DE4D62E0B142212170B9472445B5B1B070F1E84838383DCDA3873E60CD6AE5D0BE0CB3DF7A5FD0D5C59D5BE7D7B9C387142F4734C4C0CEEDDBB57E0F33F292929D8B87123EAD5AB87376FDE885E4F4F4F97A84D41103069D224A4A5A561D4A851F8E1871FA48A5D950A94D4D4542C5EBC18DBB76F2FF0F8800103D0AA552B6CDCB851EC6BAE5BB74E56E1290D1628CA292323030B162CC0EEDDBB0BDC0B68C68C19B0B4B484ABAB2BBA74E922F3F659A01091B8384A94233E3E3E722D4E1E3D7A8471E3C64110047CFFFDF758B06081DCDA52364E4E4E303535CDF3DAD0A14371FBF6ED3CAF050707A367CF9ED0D6D6C6FAF5EBF31C5BB97225366DDA84C3870F232A2AAAD8365D5C5C70FEFC798C1B370E070F1E94D9877E792D50C2C2C2D0B973E7028B135D5D5D4C9E3C190F1E3CC0BA75EBC4DEC8F1BBEFBE93EAB63A65C70245F964676763F0E0C1D8BE7D7BA1FD5B10045CB972055DBB76C5B871E3909A9A2AD31858A01091B8384A90589292923068D020242626A255AB56F0F4F42CB789AC34F4F4F4F0D75F7F61C28409A850A10200E0C99327F8E69B6FD0A2450BD8D8D8A051A346E8D2A50B8C8C8C70E9D2250C1B362CCF83EF8F1E3DC2A2458B3076EC582C5DBAB4C8F65C5D5DB161C306AC5FBF1E070F1E14B5298DFFCEA094378220C0C3C3031D3B76C483070FF21D6FD2A409DAB76F8F7DFBF6E1D9B367A85AB52A468D1A25D6B5736713550D0B14E5F3EBAFBFC2DFDF1FD6D6D6387AF4286EDEBC89E0E060FCF6DB6F70717141EFDEBDF36C2CEAE9E9892E5DBA203636566631B040212271F1162F2A962008183B762C1E3E7C886AD5AAE1F7DF7F47A54A95141D569953A3460DFCF2CB2FD8BC79332E5CB880909010C4C6C622212101DADADA707070C0C89123F3CCB45CBD7A15376FDEC483070FF0E1C307005F96162EEA5BF98D1B3762D3A64D3875EA14060C1850E2B8CBF32D5E717171183F7E3CCE9E3D9BEF989A9A1A5AB76E8DB0B0303C79F204EAEAEA98346912D6AD5B87870F1FE2D8B163455EBB7FFFFEB0B0B09057E8651A0B14E5E3EEEE8ECD9B3763FEFCF9F98E7DFFFDF70080E4E4645CB870011E1E1E387FFE3CFEFDF75FD8D9D921282808952B572E710C2C5088485C2C50A8589B366DC2E9D3A7A1AEAE8E23478EA071E3C68A0EA94CAB5EBD3A860F1F8EE1C387177BAE9A9A1A2C2C2CC44E7457AE5C092F2F2FDCB973074D9B36CD73ECC8912330303090F896A3F25AA05CBA74090E0E0E78FDFA75BE637A7A7A5057574748480800A053A74ED8BE7D3B3A77EE0CA0F8E59AD5D4D4B07AF56AD907AD2458A02897C4C44424252561DEBC79459E57A952250C1C381003070E44686828A64F9F8EBFFEFA0B3367CEC4C183074B1C070B14221217470905C9DD75BC49932650535383999959B1DFD82AC2B56BD7E0E2E2020058B56A15FAF5EBA7E08854978B8B0B2E5DBA84E0E0E07CC509001C3F7E5CAA0FFEF256A064656561D5AA55E8D5AB5781C549E5CA9591949484C4C4443468D000DEDEDEB879F3A6A838018A2F50468C1821B70D5095010B14E59290908066CD9A49F46FBB65CB96080A0AC2F4E9D3E1E9E989AB57AF96380E162844242E8E120A90BB8FC8A14387D0BC7973686969213C3C1CA3478F16150365417C7C3C468E1C89ACAC2C7CF7DD77C53E1741F2B364C9123C7DFA14172E5C408D1A35F21CFBF4E91342434371F9F26598999995B82D652E505EBC78014B4B4BAC5EBD3A4F120D7C498AD4D4D4F0F9F367E8EAEA62D1A24578F8F021860F1F9EEFCF5CBD7AF5429FEBD1D0D0C08A152BE4F66750062C50944B9D3A75F0F2E54B89DFA7A9A9891D3B7660E0C081D8B4695389E360814244E2E228A1003FFEF823AA54A9825BB76EE18F3FFEC0DDBB77616C6C0CE0CBC3CF478E1C5170845F3E481C1C1C1013130343434378797941434343D161A9241717176CD8B001DEDEDED0D5D5859A9A5A9E5FFAFAFA68D5AA15747474547A27F913274EA06DDBB6080E0ECE774C5D5D1D393939100401767676080B0BC3860D1B0ABDAF5E4D4D0D356BD62CF098A3A363BE15DB540D0B14E552B16245A4A5A5E55B55501CEAEAEAD8B97327AE5EBD8AF8F8F812C591DB6F94758C21A2D2C34F9652F6F1E34778797961FBF6EDA20FF6962D5BE2ECD9B3A858B12200C0D9D959A62BA74863EDDAB508080880A6A6268E1D3B865AB56A29341E55B567CF1EB8BABA8A75AEB4B327CA5EA0242525C1C1C101C3860D2B70E345E04B62D4A85123F8FBFBC3CFCF0F262626C55EB7A0624F4B4B0BCB962D2B71CCCA8E058AF219397224A64F9F2EF17E4B0050AF5E3DD8D9D9899ED99216675088485C7C48BE949D3B770E43870E859696569ED7CDCCCCB065CB1638393921212101B367CFC6F1E3C71512635050509ECD18BB75EBA6903808B0B6B6C6850B17C43AB76EDDBA52B5A1CC05CADF7FFF8D51A346E1D9B367859EA3ABAB8B850B1762F1E2C57996512D4E9D3A75F2BD3675EA54B18A9BF28E058AF2993C7932B66EDD0A4747471C387040A27F0B00D0A2450BA96E13FB1A0B142212170B9452161C1C8CFEFDFB17786CDAB469F0F1F1C1E5CB97E1E3E3833163C6C0DEDEBE54E38B8B8BC3A851A3909D9D0D7B7BFB0297A4A4D2D3AC5933346BD6AC54DB548602252727079B366DC28A152B8ADC54D1CECE0EDBB66D43A3468D246EE3BF3328952A55E27358FF1F0B14E563626282C58B1763D5AA5578FEFC397C7C7C60646424F6FB5FBE7C59E2151C59A01091B8384A94B28F1F3F167ABB949A9A1A3C3C3CA0ABAB0BE0CBEEE49F3E7D2AB5D8044180A3A323DEBE7D0B2323231C3A74482992552A19659B41898D8D85ADAD2D962C59526871D2B06143F8FAFAC2CFCF4FAAE204C85FA0CC9E3D5BEA59AAF286058A725AB26409ACADADF1F7DF7FA359B3669832650AFEFDF7DF62DFF7ECD9331C3B760CEDDBB72F51FB2C5088485C1C25E4ECF5EBD7D8B16307D6AF5F8F1B376EA04A952A85DE270F004D9B36C5AA55AB0000D1D1D1A5FA8DEDD6AD5B71EEDC39A8ABABE3E0C183A856AD5AA9B54D8AA34C054A606020CCCDCD71FEFCF9028F6B6A6A62F6ECD978F0E04189671FBF2E50F4F5F5399BF8151628CA494B4B0BBFFFFE3B3A74E880F4F474ECDBB70FEDDAB58389890966CE9C8923478E202222022929290080F7EFDFC3D3D313DDBB7787B9B97981CB9B4B82050A11898BB778C951505010468F1E8D77EFDE89BEE9AD5DBB369A376F0E2B2BAB42DF3777EE5CF8F8F8E0EEDDBBD8BD7B37468D1A856FBFFD56AEB1FEFBEFBFA26268F9F2E5E8D1A3875CDBA3B243190A94B4B4342C5AB408EEEEEEF9E2CDD5A3470F787878A04993263269F3EB0265FEFCF9A85EBDBA4CAE5B1EB040515E55AA54C1D5AB573165CA14D18A912F5EBCC0CE9D3BB173E74ED1799A9A9AC8CACA02F065EF207F7FFF12B7CD028588C4C551424E044180B3B3336EDDBA8567CF9E89A6C6E3E2E270EEDCB922DFABA9A989FDFBF743535313393939983C79B2542BAF882B393919A3468D427A7A3ABA76ED8AE5CB97CBAD2D2AFBCA5A81121111010B0B0B6CDFBEBDC0E2444F4F0F070F1EC4A54B9764569C00FF57A0D4AC5913CECECE32BB6E79909D9D2DFA3D934DE5A3ABAB8BC3870FC3D7D7B7D0D5FF728B93FAF5EBE3DCB97368DDBA7589DBCDED375CB29E888AC34F163979FFFE3DD4D5D5616868084343439C3D7B1686868600804B972E15B9EA1000989B9B63C182050080870F1F62FDFAF5728B75F6ECD988888840D5AA5571F8F0617E78A898B23C83E2E9E9890E1D3AE0DEBD7B051EB7B5B5C5F3E7CF316EDC3899B79DBB8AD7D2A54BA1A7A727F3EB2BB3DC6FC2395628377B7B7BDCBF7F1F41414198356B16BA76ED8A860D1BA2499326B0B1B181BBBB3B222323D1B56B5799B4C719142212176FF19293EAD5AB233E3E1E494949D0D3D343EDDAB5B167CF1ED8D9D9213D3D1D53A74E4560606091C9E08A152BF0DB6FBFE1D1A34758BF7E3D860D1B26939DC2BF76F2E449FCFAEBAF00000F0F0F346CD850A6D7279246626222A64D9B066F6FEF028F57AD5A15274F9EC477DF7D27B7186AD7AE0D0303034C9B364D6E6D282B269AE587868606BA77EF8EEEDDBBCBBD2DF61B221217470939515757C7C0810371E0C001D16BB6B6B61833660C00E0CF3FFFC4A143878ABC868E8E0EF6EDDB0735353564646460F2E4C979EEFD2EA9B76FDF62FAF4E9008089132762E8D0A132BB36298FB2368372F3E64DB46DDBB6C0E2444D4D0DC3870F475C5C9C5C8B13E04B81B272E54AD1AA7AF47F98682AAFA74F9FE2EEDDBB484B4B2BF2BCD0D0507CF8F041A66DB3DF1091B8384AC8D1E2C58BB171E346BC7FFF5EF49A9B9B9BE8DEF679F3E615BB63BCA5A525A64E9D0A00B871E30676EFDE2DB3F8264F9E8C77EFDEA151A346D8BA75ABCCAE4BCA4D51054A56561656AE5C89AE5DBBE2F9F3E7F98E57AB560D57AE5C81B7B7372A54A820F7787474743061C204B9B7A38C98682A9FACAC2C8C1933064D9A3441870E1D606A6A8A274F9E147A7E444404CCCDCD11161626B318D86F88485C1C25E4A84183061832648868D96000A851A3067EFEF9670040424282580FDF6ED8B001F5EBD707F0651DFB57AF5E9538B67DFBF6C1DFDF1FEAEAEAF8F5D75F798FBD0A2B0B33282F5FBE84B5B535D6AC5993E701EC5C767676888B8B43B76EDD4A352E4D4DDE055B10269ACAC7C3C303999999A2E5B7A3A2A2B065CB9642CF1F32640876ECD881FEFDFBE3EDDBB7328981FD8688C4C55142CE5C5D5DF30DC6A3478F46DFBE7D0100C78F1F87AFAF6F91D7D0D7D7C7AE5DBB00004949499831634689627AFEFC39E6CD9B07E0CB2C4E514B1E93EA29ED02E5D4A95368DBB62DAE5DBB96EF58A54A95E0EFEF0F3F3F3F160B6508134DE5B36BD72EB8BBBB63FAF4E9A858B122802FCF7215C5DEDE1E3FFCF083CC9EC362BF212271719490B3CA952B63DBB66DF95EDFB3670F2A57AE0C0098366D5AB1F7FAF6EFDF1FC3870F0700F8F9F9C1C7C747AA78727272307EFC78242525C1CCCC0C6BD6AC91EA3A547E286A0625353515CECECE183C7830121212F21DEFD2A50B5EBE7C095B5BDB528987C4C74453B964646440474707B56BD746DFBE7DF1F0E143F8FBFB63EDDAB5C5BE77E6CC99484848C0A54B974A1C07FB0D11898BA3848218191961DDBA750080376FDE60F1E2C5C5BE67DBB66DA851A306802F4B031794D415E7D8B163B872E50AB4B4B470F4E851E8E8E8487C0D2A5F1451A0848585A153A74ED8BE7D7BBE639A9A9AD8B87123FEFAEB2F6E8E584631D1542E1F3F7ECCF3DC96B1B1316C6D6DC57E966BF5EAD5A25B934B82FD8688C4C551428166CE9C89CE9D3B03F8F24CC85F7FFD55E4F975EAD4117D48C4C6C64A35FB316AD4286CD9B2053FFEF823CCCDCD250F9ACA3D791628822060DBB66D68DFBE3D424343F31D373131C13FFFFC83850B17CA2D062A39269ACAA556AD5A78FAF46981CF7789A37BF7EE78F4E8119293934B1407FB0D11898BA3840269686860DFBE7DD0D2D2822008983A756A813B657F6DECD8B1E8D3A70F0014BB237D41D4D5D5316FDE3CD1332844A53583121F1F8FFEFDFB63CE9C39484F4FCF777CC28409080B0B43AB56ADE4D23EC90E134DE5A2A6A686C68D1BE3C8912352BFBF43870EF8FBEFBF4B1407FB0D11898BA38482B56AD50A2E2E2E00BE2CEBF8E9D3A762DFB36FDF3E58595989755B1891A4E451A05CBC7811E6E6E6F0F7F7CF77AC5AB56AF0F3F3C32FBFFCC23D479404134DE5E3E0E08065CB96E1F5EBD752BDDFDCDC1CD1D1D1258A81FD8688C4C56571CA80DCA5831B366C087D7DFD62CF6FD0A0012E5FBE2CFFC04825C87306252B2B0BEBD6ADC3DAB56B0BDC64B47BF7EE387AF4280C0C0C64D626C91F134DE53366CC18B8BABAA277EFDE080C0C94F8DF9CAEAE2E1213134B1403FB0D11898BA34419A0A9A9090F0F0F2C5DBA54D1A110C9AC4079F1E2052C2D2DB17AF5EA7CC58986860656AE5C898B172FB23851424C34954F952A55B06DDB36848585A175EBD6387AF468815F1A1426343454B4C9B0B4D86F88485C1C2588280F591428274E9C40DBB66D111C1C9CEF98B1B131AE5DBB8655AB56315151524C3495D3902143B060C102BC7FFF1E63C68C41F3E6CDE1E6E686972F5F16F9BE3B77EEE0F0E1C3E8DAB56B89DA67BF212271F1162F221527CB5BBC929292E0E4E454E8C3B843870E85878747B11BC451D9C64453796DDCB811C9C9C9D8B56B179E3C79821F7EF8013FFCF003DAB46983AE5DBBA26DDBB668D2A4092A56AC88989818FCF1C71F387CF830FAF5EB87FAF5EB97A86DF61B2212170B1422CA43DA02E5F6EDDB18356A149E3C7992EF989E9E1E76EDDA853163C694343C2A0398682A2F353535ECDCB9136DDBB685B3B333525252000021212108090929F03D8686867077772F71DBEC3744242E8E12445422B97B9B74E9D2A5C0E2A463C78EF8E79F7F589C94234C3495DFA44993F0F8F1634C9A34A9C80D7BADADADF1D75F7F9578F60460BF2122F171068548C595E416AFD8D858383A3AE2FCF9F3F98EA9A9A961D6AC59D8BC7933B4B4B44A1C6751DEBC7983BB77EFE2FEFDFB484C4CC4C78F1F51A54A1554A95205A6A6A6E8D4A9138C8D8DE51A832A61A2593E18181860DFBE7DF8F9E79FF1C71F7FE09F7FFE417474B468DF145B5B5BD166C2B2C07E4344E26281424479885BA004060662ECD8B1888D8DCD77AC4E9D3A3878F0206C6C6C641D5E1E6FDEBCC1B469D3E0EFEF8F9C9C1CE8E8E8C0C8C8087A7A7A78FBF62D62626244E75A585860C58A15728F491530D12C5FF4F4F43062C4088C183142AEEDB0DF1091B8384A10A938496750D2D2D2E0ECEC0C1B1B9B028B93DEBD7BE3DEBD7B722F04727272606F6F0F5F5F5FE4E4E440575717F7EEDD43646424EEDCB983E8E868444444A067CF9E0080E0E060F4EDDB1773E7CECDF76726C930D12469B0DF1091B8384A10511E451528111111F8E69B6FB07DFBF67C49BE8E8E0EDCDCDC70FEFC79D4AD5B57DE61E2F1E3C7B87BF7AEE8E7D4D4541C3C7830CF39CD9B37879F9F1F9A356B267A6DEBD6ADD8B76F9FDCE32BCF98689234D86F88485C1C2588288FC20A144F4F4FB46FDFBEC0957E4C4D4D111C1C0C67676799EE445F940A152AE47B4D5B5B3BDF6B3A3A3A983469529ED75C5D5D398B52024C34491AEC3744242E8E12442AAEB85BBC1213133172E4488C1B374EB424E9D71C1C1C70E7CE1D989B9BCB35CEFF6AD4A811860C1922FAB956AD5A183F7E7C81E79A9A9AE6F9F9E5CB9778FAF4A9D86D252525213A3A5ABA40CB21269A240DF61B221217470922CAE3EB02E5E6CD9B30373787B7B777BEF3F4F5F5E1E5E5054F4F4F54AA54A9344314F1F1F1414040008E1E3D8A8888884257EA323434CCF75A41CFCFFC97200808080840EBD6AD3179F2E412C75B5E30D12469B0DF1091B8B88A1711E5A1A6A686ECEC6CAC5DBB166BD7AE1525155FFBE69B6F70ECD8319898982820C2FFA3A6A686DEBD7B17782C212101F1F1F1F8F0E103EEDDBB97EF78417F2E00F8F7DF7FE1EDED8DE8E868DCB8710369696978FBF6ADC2FFAC6509134D9206FB0D11898B050A11E5919090801E3D7AE0DAB56BF98E696868C0C5C505CB972F8786868602A22B585A5A1ACE9F3F8F2B57AEE0E6CD9B888C8CC4870F1F44C72599E1D1D0D040FDFAF5D1BE7D7B6CDAB4095E5E5E58B060813CC2565A4C34491AEC3744242E1628442AEEBFCFA02C5BB60CC9C9C9F9CE333232C2912347D0AD5BB7D20AAD581F3E7CC0AA55ABE0E9E9898F1F3F02007475753160C000F4EBD70FEDDBB7878989091E3D7A24F63332AD5BB746EBD6ADE519B6D263A249D260BF212271B140215271BABABA48494981BEBE3E1213130B2C4E860E1D0A0F0F0F54AD5A55011116ECE2C58B183D7A749E6749C68E1D8B4D9B36A14E9D3A0A8CACFC63A249D2C8CECE06C07E4344C5E32841A4E2729FAD286866445757176E6E6EF0F1F12953C5C993274FD0BF7FFF3CC5C9AC59B370E8D0211627A580050A4923B7DF94A5DB4389A86CE20C0A918ACBFD56F38F3FFEC8F37A8B162DE0E5E58556AD5A2922AC226DDBB62DCF92C7BABABAD8B06143A1E7E7FE194936F84D384983852D11898B050A910A8B8F8FC7CB972F017C791665E4C891080D0D85858505DCDCDCA0ABABABE0080B76FFFEFD3C3F9B9A9AA262C58A859ECF3D4C648BDF84933458A01091B858A010A9A8EBD7AF63D8B061A2998889132762FFFEFD4849492932D92F0B6AD5AA95E7E7989818088250E82EF6274F9E2C8DB05406134D9206FB0D11898BA304910ADAB76F1FACADADF1FAF56B686A7EF99E62C080010050E68B1300183D7A749E9FE3E2E2B075EBD602CFFDF5D75F71EAD4298C1A352ACFEBC1C1C1F9563023F130D1545E191919983871229E3C7952E0713F3F3FAC5EBD5A2E6DB3DF1091B8384A10A990ACAC2CCC98310353A64C41464606ACADAD6160600040B9928641830661EDDAB5796E319A3F7F3E468E1C89DF7EFB0DC1C1C1F8E5975F6065C6D044C9000013B949444154650567676778797961D2A44979AEB168D122E8EBEBC3D4D414070E1C28ED3F825263A2A9BCA2A3A3F1EBAFBFE2FAF5EB051E3F7DFA34F6ECD92397B6D96F88485C1C258854444242026C6C6CB06BD72E00C094295370FEFC79D16D51CA9634B8B8B8E0FEFDFB98356B169A366D0A00F0F6F6C6902143F0EDB7DF8A5EBF73E70EECEDEDD1A3470F9C3A750AD6D6D6A853A70EB4B5B591949484E8E868D11E2A241E269ACA2B333313C0979994C28EE79E236BEC3744242E3E8342A4022223233160C000444646425353135BB76EC5CC9933012877D260666686EDDBB70300525252F0EEDD3B242424A062C58A30313141850A15F29C3F68D0200C1A344811A1962BCADC67545D61CF697D4D1EB73EE6F61980FD86888AC70285A89C3B7BF62C468D1A85C4C444D4A85103274E9C408F1E3D44C7CB4BB259B16245181919C1C8C848D1A1947BE5A5CFA8B2C28A10710A1869B0402122497094202AC7B66CD9027B7B7B242626A24D9B36B87BF76E9EE20460B24992639F515EC515206A6A6A9C41212285E32841540E65656561DAB46958B060017272723078F0605CBF7E1DC6C6C6F9CE65B259B4DC64EDEB044BD5B1CF28AFDC02A5A82284050A11291A6FF1222A673E7FFE8C1123468876869F3D7B36B66EDD5A6852C06433AF94941484878723272707AF5FBF16EDA172EFDE3D787A7AA2499326D0D6D686818101EAD5ABA7E06815837D46F9F1162F222ACB58A0109523313131B0B7B7C7BFFFFE0B4D4D4D6CDBB60D4E4E4E45BE87C9665E515151983A752AAA55AB0600A852A50A860C1982A4A4241C3E7C18C0972270E2C489F9962E5615EC33CA8B0FC9139132608142544E848484C0CECE0ED1D1D1A85CB9328E1F3F8E7EFDFA15FB3E269B79FDEF7FFFC39D3B77141D4699C63EA3FC3883424465190B14A272E0ECD9B318366C18929393616C6C0C7F7F7FB46CD952ACF732D92449E526B7EC33CA870FC9139132E02841A4E40E1D3A84810307223939191D3A74C0CD9B37C52E4E0016282439F619E5278F22A4282C508848121C258894D8B66DDB3061C204646666E2BBEFBEC3C58B1751B76E5D89AEC1649324C53EA3BC38834244CA80A30491121204010B172EC49C3973909393833163C6E0DCB973A852A58AC4D762B24992629F517E9C4121A2B28CCFA01029998C8C0C383A3AC2CBCB0B40F1CB081787C926498A7D46797106858894010B142225929C9C8C418306E1C2850B505353C3962D5B3077EEDC125D93C926498A7D467915B751230B14222A0B58A0102989C4C444D8DADAE2FAF5EBD0D4D4C4DEBD7B3161C284125F97C926498A7D46F9F1162F222ACB58A0102981848404F4EDDB17B76EDD82B6B6368E1F3F8E010306C8E4DA4C364952EC33CA8BB77811913260814254C6BD7DFB16BD7AF5426868282A55AA84D3A74FA367CF9E32B9B62008DCD38224C60245F971068588CA3216284465D88B172FD0AB572F3C79F204D5AA55C3D9B367F1CD37DFC8ECFA4C1A481A2C5094176750884819B040212AA3C2C3C3D1B3674FBC7EFD1A75EBD6456060205AB56A25D3369834903458A028BFA21E9297078E354424091628446550444404BEFBEE3BBC79F306464646B870E1029A356B26F3769834903458A0282F710A10CEA01091A2B140212A63424343F1DD77DF212E2E0E8D1B37C6A54B976064642497B69834903458A0283FCEA0105159C65182A80C090F0F47AF5EBD10171787860D1BE2CF3FFF945B7102306920E9B040515EC5ED8352DC316971AC2122497094202A23C2C3C3616D6D8DB76FDFA269D3A6B876ED1A1A366C28D7369934903458A028AFE2FECEE4F5779A9D9D2DD7EB1351F9C29182A80C08090981A5A5A5A838090A0A82A1A1A1DCDB658142D26081A2BCAA57AF8E4A952AC1D8D8B8C0E3C6C6C672F96224B7CF686868C8FCDA4454FEF0191422057BF0E0017AF6EC8977EFDEA159B366080A0A82818141A9B4CD0285A4C16FC39597B6B636DEBF7F0F6D6DED028F2F58B00073E6CC9179BB2C6A8948121C29881428323212BD7AF5C2BB77EFD0BC79F3522D4E001628241D269BCAADB0E22457850A1564DE26FB0C11498223059182BC7CF9127DFAF4416C6C2C8C8C8C10101050AAC509C00285A4C3DB7548522C508848121C298814203A3A1ADDBB77475454140C0D0D71F9F2E542EF0997271628240D269B2429F619229204470AA25216171787DEBD7BE3F9F3E7A85DBB362E5CB80013131385C4C20285A491DB6FE4B56706953F2C508848121C29884AD1BB77EF606D6D8DF0F070D4AC5913972E5D82A9A9A9C2E2C97DD81960E240E263B24992629F21224970A4202A25292929E8DFBF3FC2C2C2A0AFAF8FF3E7CFA3458B160A8DE9EB19143E4F40E262B24992629F21224970A4202A05E9E9E91830600082838351A952259C3F7F1EEDDBB7577458BCC58BA4C2649324C53E434492E048412467393939183B762CFEFCF34F54A85001274E9CC037DF7CA3E8B000B04021E930D92449B1CF109124385210C9D90F3FFC001F1F1FA8ABABC3D3D3137DFBF6557448222C50481A4C364952EC334424098E144472E4E2E282EDDBB703007EFAE9278C183142C111E5C50285A4C1649324C53E434492E048412427EEEEEE7075750500AC5CB91273E6CC517044F9B140216930D92449B1CF109124385210C9819F9F1F7EF8E10700C0B469D3B06AD52AC50654081628240D269B2429F619229204470A2219BB7DFB36468E1C89ECEC6CD8D9D961C78E1D8A0EA9504C1A481AEC372429F619229204470A22197AF6EC19ECECEC909C9C8C8E1D3BC2DBDBBB4CEF2FC2A481A4C17E5336454646C2DBDB5BD16114887D868824C191824846DEBF7F8FBE7DFB222E2E0E8D1A3582BFBF3F2A55AAA4E8B08AC4A481A4C17E5336AD59B3064E4E4E888A8A527428F9B0CF109124385210C9406A6A2AFAF7EF8F478F1EA1468D1A3877EE1C6AD7AEADE8B08AC5A481A4C17E5336BD7AF50A43870EC5FDFBF7151D4A3EEC334424098E144425240802C68E1D8B1B376E405757177E7E7E68D6AC99A2C3120B93069206FB4DD9F4F1E347181818E0FDFBF7459E979393835EBD7AE1D8B16312B791999989254B96A071E3C668DEBC3966CC988177EFDE15FB3EF619229204470AA2125AB162054E9E3C097575751C3D7A141616168A0E496C4C1A481AEC3765939A9A1AD2D2D28A7DEEEDF1E3C7484848C0CE9D3B256E63D9B265D8B061039E3D7B86478F1E61D7AE5D68D1A2052223238B7C1FFB0C114982230551099C387142B4D7C98F3FFE88418306293822C930692069B0DF944D75EBD6C5810307D0B265CB22CF7BFFFE3D3A76EC88C4C44489AEFFF9F367ECDEBD1B0050A142051C387000D7AE5D83959515A64F9F5EE47BD9678848129A8A0E804859DDBD7B178E8E8E1004010E0E0E58B46891A243921893069206FB4DD9316DDA34444545415D5D1DB76FDF46DBB66DD1B66DDB22DF939C9C0C4D4D4D64656549D4D6891327F0F9F36700C0A44993E0E8E80800B0B0B040D3A64DF1E9D32754A952A5C0F7B2CF10912458A01049E1F5EBD718306000525252606161817DFBF6293A24A930692069B0DF941DEBD6ADC3EDDBB7A1A1A18191234762DCB871B872E50AACACAC0A7D4FE5CA95F1F1E3476466664AD4D6C1830745BFFF7AC64443430375EAD441767676A1EF659F21224970A42092506A6A2A060E1C88989818181919E1F7DF7F87B6B6B6A2C3920A93069206FB4DD951B3664DF4EDDB17BD7BF7C688112350B76E5D0C1D3A1421212185BEA765CB96080C0C848E8E8ED8ED3C7BF60CD7AE5D030074ECD811AD5AB5121D4B4F4F47424202AA55AB56E8FBD9678848121C2988242008021C1D1D71FBF66D54AE5C19BEBEBEA853A78EA2C3921A93069206FB4DD9A4A9A989254B96203E3E1EDDBA75C3EEDDBB919E9E9EEFBC9C9C1CA8A9A949B4A0C7A143872008020060E2C489798E1D3B760C36363645BE9F7D868824C15BBC8824B069D326F8F8F8404D4D0D9E9E9E68D3A68DA2432A11260D240DF69BB26BDAB469F0F2F2C28D1B37E0E4E484D5AB5763CC983168D9B225F4F4F4101A1A8A5F7EF905717171888B8B13EB9AD9D9D93870E00000A062C58A18316284E8584A4A0A366EDC888B172F16790DF6192292040B142231FDF9E79F58B66C19802F4B0B2BDB8A5D0561D240D260BF29BB34353571E2C409585A5AE2E9D3A7888D8DC54F3FFD94EFBCAE5DBB22222202C78E1DC3A851A38ABCE6F9F3E7F1EAD52B00C0B061C3A0AFAF2F3AA6ADAD8D73E7CEA17EFDFA455E837D868824C19182480C51515118397224B2B3B3616F6F8F152B56283A249960D240D260BF29DB0C0C0C70FDFA75F4ECD9B3C0E32D5AB4C0F1E3C7E1E3E383993367222020A0C8EB6DDEBC59F4FB69D3A6E539A6A1A1011313936263629F21224970A4202A466A6A2A060F1E8C77EFDEA159B366F0F4F42C371FB24C1A481AEC37655F9D3A7570E1C2059C3D7B160E0E0EF8E69B6FF0DD77DF61CB962DF8FBEFBF61606000737373ECDEBD1B03070EC48F3FFE58E0F32A070F1EC4952B570000EDDAB543E7CE9DA58A2777852FF6192212076FF1222AC6F4E9D371F7EE5D54AE5C19A74E9D42D5AA55151D92CC30D12469B0DF288FBE7DFBA26FDFBE851E1F3E7C38D4D5D5317EFC78ECDCB913B367CF86959515B4B5B571F2E449D1EC899A9A1AD6AD5B27751CB97DA6B85DEE89880016284445DAB66D1B0E1D3A043535351C3A74082D5AB450744832C54493A4C17E53BE0C1D3A142D5AB480939313162F5E9CEFB8BABA3AB66CD95264A1531CF6192292040B14A242DCBC79130B162C00002C59B204DF7FFFBD8223923D260D240DDEAE53FE989999E1F2E5CBF8E79F7FE0E9E9895BB76E21393919AD5BB7C6CC9933A5BEB52B17C71A2292040B14A2027CF8F00123478E44666626BA77EF8E356BD6283A24B960D240D2E0ED3AE557BB76EDD0AE5D3B995F97630D1149822305D17F088280F1E3C7E3C58B17A853A70E8E1E3D5A6E1331260D240DF61B9214FB0C1149822305D17F6CD8B00167CE9C81BABA3A8E1C3902030303458724374C1A481AEC372429F619229204470AA2AF5CBD7A55B4C7C99A356B0ADD47A0BC60D240D260BF2149B1CF109124385210FD7FF1F1F118397224B2B2B260636383254B96283A24B963D240D260BF2149B1CF109124385210E1FF9E3B79FDFA350C0D0D71F8F06195F82065D240D260BF2149B1CF10912438521001D8BE7D3BFEF8E30FA8ABABE3D0A143A859B3A6A2432A154C1A481AEC372429F619229204470A5279A1A1A1A2DBB9962D5B066B6B6B0547547A98349034D86F4852EC334424098E14A4D2525252306CD830A4A6A6A253A74E58BE7CB9A2432A554C1A481AEC372429F619229204470A5269CECECE080F0F87BEBE3E8E1F3F8E0A152A283AA452C51DC1491A4C364952822000609F2122F170A4209575F2E449ECDFBF1F00B077EF5E346CD850B101290077042769B0402149B1CF10912434151D009122BC79F306D3A64D03004C983001C3870F5770448AC1A481A4C16FC34952D3A74FC7C0810351B56A55458742444A80050AA91C41103079F264BC7FFF1E2626267073735374480AC30285A4C15B03495206060630303050741844A424F8E9422A67EFDEBDA225850F1E3C083D3D3D4587A4302C50481AEC374444244FFC742195F2FCF9732C5CB81000B070E142585A5A2A3822C562A249D260BF21222279E2A70BA98C9C9C1C383A3A2229290966666658B972A5A2435238269A240DF61B222292277EBA90CAD8B46913AE5EBD0A2D2D2D1C3B760C3A3A3A8A0E49E1986892A472FB0CC07E434444F2C187E449653468D00055AB56C5A2458BD0A64D1B45875326B0402149B140212222796381422A63F4E8D1B0B6B646EDDAB5151D4A99C1028524C502858888E48D050AA9947AF5EA293A843285050A498A050A1111C91B3F5D8854180B1492140B14222292377EBA10A9301628242916284444246FFC742152612C5048522C50888848DEF8E942A4C258A090A458A0101191BCF1D3854885098200808926898F050A1111C91B3F5D885418675048522C50888848DEF8E942A4C258A090A458A0101191BCF1D3854885B1402149B14021222279E3A70B910A638142926281424444F2C64F172215C6028524C502858888E48D9F2E442A8C050A492A3B3B5BF47B0D0D0D0546424444E515B3122215C6028524C51914222292377EBA10A9301628242916284444246FFC742152612C5048522C50888848DEF8E942A4C258A090A458A0101191BCF1D3854885B1402149B14021222279E3A70B910A63814292CAED336A6A6A505353537034FFAF5D3B38552008A228DA1F0CC00CC4A03448433307991FC32CA42FD63911D4A2C1777100F84556090C265038CB9B01E0DBFCC2C060C626677933007CDB65F701C03EC62667DD6EB7F57ABDBC1900BE46A0C0600285B3AED7EB7A3C1EBBCF00E087592530984001006AAC1218ECF3F9ACB5040A00D06195C060FE4101006AAC12184CA000003556090C265000801AAB0406132800408D550283091400A0C62A81C1040A00506395C060020500A8B14A6030810200D4582530984001006AAC12184CA000003556090C265000801AAB0406132800408D550283091400A0C62A81C1040A00506395C060020500A8B14A6030810200D4582530984001006AAC12184CA000003556090C265000801AAB0406132800408D550283091400A0C62A81C1040A00506395C060020500A8B14A6030810200D4582530984001006AAC12184CA000003597DD0700FB3C9FCFF57EBFD7FD7EDF7D0A00C05A6BADBFE3388EDD47000000ACE5132F00002044A00000001902050000C81028000040864001000032040A00009021500000800C8102000064081400002043A00000001902050000C81028000040864001000032040A00009021500000800C8102000064081400002043A00000001902050000C81028000040864001000032040A00009021500000800C8102000064081400002043A00000001902050000C81028000040864001000032040A000090F10FD5BBBF9F5D32F9180000000049454E44AE426082>|Screenshot
      from 2022-08-14 06-02-11.png>|0.4par|||>
    </cell>|<\cell>
      <\math>
        <with|font-series|bold|a><rsub|i>=<pdv||\<xi\><rsub|i>>*<with|font-series|bold|x>

        <with|font-series|bold|a><rsup|i>=\<nabla\><rsub|<with|font-series|bold|x>>
        \<xi\><rsup|i>=J<rsup|-1>*<around*|(|<with|font-series|bold|a><rsub|j>\<times\><with|font-series|bold|a><rsub|k>|)>
      </math>

      <math|J=<with|font-series|bold|a><rsub|1>\<cdot\><around*|(|<with|font-series|bold|a><rsub|2>\<times\><with|font-series|bold|a><rsub|3>|)>>
    </cell>>|<row|<\cell>
      Covariant and contravariant coordinate vectors in relation to the
      coordinate lines
    </cell>|<\cell>
      \;
    </cell>|<\cell>
      \;
    </cell>>>>>

    <\equation*>
      <with|font-series|bold|u><rsub|t>+\<nabla\><rsub|<with|font-series|bold|x>>\<cdot\><with|font-series|bold|f>=0\<longrightarrow\><wide|<with|font-series|bold|u>|~><rsub|t>+\<nabla\><rsub|<with|font-series|bold|\<xi\>>>\<cdot\><wide|<with|font-series|bold|f>|~>=0,
    </equation*>

    where

    <\equation*>
      <tabular*|<tformat|<cwith|1|1|3|3|cell-halign|l>|<table|<row|<cell|<wide|<with|font-series|bold|u>|~>>|<cell|=>|<cell|J*<vQ>,>>|<row|<cell|<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsup|i>>|<cell|=>|<cell|J*<with|font-series|bold|a><rsup|i>\<cdot\><with|font-series|bold|f>=<big|sum><rsub|n=1><rsup|3>J*a<rsub|n><rsup|i>*f<rsub|n>.>>>>>
    </equation*>

    \;
  </hidden>|<\hidden>
    <tit|Flux Reconstruction for the transformed PDE>

    \;

    \;

    \;

    \;

    \;

    <\with|font-base-size|10>
      <\equation*>
        <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<dv|<with|font-series|bold|u><rsub|e,<with|font-series|bold|p>><rsup|\<delta\>>|t>**+<frac|1|J>*\<nabla\><rsub|<with|font-series|bold|\<xi\>>><rsup|N>\<cdot\><wide|<with|font-series|bold|f>|~><rsub|e><around*|(|<with|font-series|bold|\<xi\>><rsub|<with|font-series|bold|p>>|)>>>|<row|<cell|<space|1em><tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|+<frac|1|J>*<big|sum><rsub|i=1><rsup|3><around*|(|<around*|(|<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><rsup|\<ast\>>-<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><around*|(|<with|font-series|bold|\<xi\>><rsub|i><rsup|R>|)>*g<rsub|R><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>>>|<row|<cell|+<frac|1|J>*<big|sum><rsub|i=1><rsup|3><around*|(|<around*|(|<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><rsup|\<ast\>>-<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><around*|(|<with|font-series|bold|\<xi\>><rsub|i><rsup|L>|)>*g<rsub|L><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>=<with|font-series|bold|0>,>>>>>>>>>>
      </equation*>
    </with>
  </hidden>|<\hidden>
    <tit|Lax-Wendroff Flux Reconstruction for the transformed PDE>

    <\with|font-base-size|10>
      \;
    </with>

    <unroll|<\shown>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<with|font-series|bold|u><rsub|t>+<frac|1|J>*\<nabla\><rsub|<with|font-series|bold|\<xi\>>>\<cdot\><wide|<with|font-series|bold|f>|~>=0,>>|<row|<cell|<tabular*|<tformat|<table|<row|<cell|<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsup|i>>|<cell|=>|<cell|J*<with|font-series|bold|a><rsup|i>\<cdot\><with|font-series|bold|f>=<big|sum><rsub|n=1><rsup|3>J*a<rsub|n><rsup|i>*<with|font-series|bold|f><rsub|n>.>>>>>>>>>>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<with|font-series|bold|u><rsup|n+1><around*|(|<with|font-series|bold|\<xi\>>|)>=<with|font-series|bold|u><rsup|n><around*|(|<with|font-series|bold|\<xi\>>|)>-<frac|1|J>*\<mathLaplace\>t*\<nabla\><rsub|<with|font-series|bold|\<xi\>>>\<cdot\><wide|<with|font-series|bold|F>|~>>>|<row|<cell|<wide|<with|font-series|bold|F>|~>=<big|sum><rsub|k=0><rsup|N><frac|\<mathLaplace\>t<rsup|k>|<around*|(|k+1|)>!>*\<partial\><rsub|t><rsup|k>
        <wide|<with|font-series|bold|f>|~>>>>>>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<with|font-series|bold|u><rsub|e,<with|font-series|bold|p>><rsup|n+1>-<with|font-series|bold|u><rsub|e,<with|font-series|bold|p>><rsup|n>**+<frac|1|J>**\<mathLaplace\>t*\<nabla\><rsub|<with|font-series|bold|\<xi\>>>\<cdot\><wide|<with|font-series|bold|F>|~><rsup|\<delta\>><rsub|e><around*|(|<with|font-series|bold|\<xi\>><rsub|<with|font-series|bold|<with|font-series|bold|p>>>|)>>>|<row|<cell|<space|4em><tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|+<frac|1|J>*\<mathLaplace\>t*<big|sum><rsub|i=1><rsup|3><big|int><rsub|\<partial\>\<Omega\><rsub|s,i>><around*|(|<around*|(|<wide|<with|font-series|bold|F>|~><rsup|\<delta\>><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><rsup|\<ast\>>-<wide|<with|font-series|bold|F>|~><rsup|\<delta\>><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><around*|(|<with|font-series|bold|\<xi\>><rsub|i><rsup|R>|)>*g<rsub|R><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>**d
        S<rsub|<with|font-series|bold|\<xi\>>>>>|<row|<cell|+<frac|1|J>*\<mathLaplace\>t*<big|sum><rsub|i=1><rsup|3><big|int><rsub|\<partial\>\<Omega\><rsub|s,i>><around*|(|<around*|(|<wide|<with|font-series|bold|F>|~><rsup|\<delta\>><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><rsup|\<ast\>>-<wide|<with|font-series|bold|F>|~><rsup|\<delta\>><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><around*|(|<with|font-series|bold|\<xi\>><rsub|i><rsup|L>|)>*g<rsub|L><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>**d
        S<rsub|<with|font-series|bold|\<xi\>>>=<with|font-series|bold|0>.>>>>>>>>>>
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Free stream preservation of Lax-Wendroff>

    \;

    <unroll|<\shown>
      Claimed free stream preservation conditions

      <\equation*>
        <with|color|red|<big|sum><rsub|i=1><rsup|3>\<partial\><rsub|\<xi\><rsup|i>><rsup|N>*<around*|(|J*<with|font-series|bold|a><rsup|i>|)>=<with|font-series|bold|0>>
      </equation*>
    </shown>|<\shown>
      Assume a free stream

      <\equation*>
        <math|<with|font-series|bold|u><rsup|n>=<underline|<with|font-series|bold|c>>>
        and <math|<with|font-series|bold|f><around*|(|<underline|<with|font-series|bold|c>>|)>=<with|font-series|bold|c>>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        <tformat|<cwith|1|1|3|3|cell-halign|l>|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<with|font-series|bold|u<rsub|t>>>|<cell|=>|<cell|-<frac|1|J>*\<nabla\><rsub|<with|font-series|bold|\<xi\>>><rsup|N>\<cdot\><wide|<with|font-series|bold|f>|~><rsup|\<delta\>><rsub|e>>>|<row|<cell|>|<cell|=>|<cell|-<big|sum><rsub|n=1><rsup|3><around*|(|<with|color|red|<big|sum><rsub|i=1><rsup|3>\<partial\><rsub|\<xi\><rsub|i>><rsup|N>
        <around*|(|J*a<rsup|i><rsub|n>|)>>|)><with|font-series|bold|*c><rsub|n>=0.>>>>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        N=1:<space|2em>\<partial\><rsub|t>
        <wide|<with|font-series|bold|f>|~><rsup|\<delta\>>=<frac|<wide|<with|font-series|bold|f>|~><around*|(|<with|font-series|bold|u>+\<mathLaplace\>t*<with|font-series|bold|u><rsub|t>|)>-<wide|<with|font-series|bold|f>|~><around*|(|<with|font-series|bold|u>-\<mathLaplace\>t*<with|font-series|bold|u><rsub|t>|)>|2*\<mathLaplace\>t>=<with|font-series|bold|0>
      </equation*>
    </shown>|<\shown>
      <\equation*>
        \<Rightarrow\><wide|<with|font-series|bold|F>|~><rsup|\<delta\>>=<wide|<with|font-series|bold|f>|~><rsup|\<delta\>>+<frac|\<mathLaplace\>t|2>*\<partial\><rsub|t>
        <wide|<with|font-series|bold|f>|~><rsup|\<delta\>>=<wide|<with|font-series|bold|f>|~><rsup|\<delta\>>,
      </equation*>
    </shown>|<\shown>
      where

      <\equation*>
        <wide|<with|font-series|bold|f>|~><rsup|\<delta\>><rsub|i>=J*<with|font-series|bold|a><rsup|i>\<cdot\><with|font-series|bold|c>=J*<with|font-series|bold|a><rsup|i>\<cdot\><with|font-series|bold|c>.
      </equation*>

      \;
    </shown>>
  </hidden>|<\hidden>
    <tit|Free stream preservation of Lax-Wendroff>

    <unroll|<\shown>
      <\equation*>
        <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<with|font-series|bold|u><rsup|n+1>-<with|font-series|bold|u><rsup|n>**+<frac|1|J>**\<mathLaplace\>t*<around*|(|<with|color|red|<big|sum><rsub|i=1><rsup|3>\<partial\><rsub|\<xi\><rsup|i>><rsup|N><around*|(|J*<with|font-series|bold|a><rsup|i>|)>>|)>\<cdot\><with|font-series|bold|c>>>|<row|<cell|<space|1em><tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|+<frac|1|J>*\<mathLaplace\>t*<big|sum><rsub|i=1><rsup|3><big|int><rsub|\<partial\>\<Omega\><rsub|s,i>><around*|(|<with|color|blue|<around*|(|J*<with|font-series|bold|a><rsup|i>\<cdot\><with|font-series|bold|c>|)><rsup|\<ast\>>-J*<with|font-series|bold|a><rsup|i>\<cdot\><with|font-series|bold|c>>|)><around*|(|<with|font-series|bold|\<xi\>><rsub|i><rsup|R>|)>*g<rsub|R><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>**d
        S<rsub|<with|font-series|bold|\<xi\>>>>>|<row|<cell|+<frac|1|J>*\<mathLaplace\>t*<big|sum><rsub|i=1><rsup|3><big|int><rsub|\<partial\>\<Omega\><rsub|s,i>><around*|(|<with|color|blue|<around*|(|J*<with|font-series|bold|a><rsup|i>\<cdot\><with|font-series|bold|c>|)><rsup|\<ast\>>-J*<with|font-series|bold|a><rsup|i>\<cdot\><with|font-series|bold|c>>|)><around*|(|<with|font-series|bold|\<xi\>><rsub|i><rsup|L>|)>*g<rsub|L><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>**d
        S<rsub|<with|font-series|bold|\<xi\>>>=<with|font-series|bold|0>.>>>>>>>>>>
      </equation*>
    </shown>|<\shown>
      Metric identities

      <\equation*>
        <with|color|red|<with|color|red|<big|sum><rsub|i=1><rsup|3>\<partial\><rsub|\<xi\><rsup|i>><rsup|N><around*|(|J*<with|font-series|bold|a><rsup|i>|)>>=<with|font-series|bold|0>>
      </equation*>
    </shown>|<\shown>
      Conformality

      <\equation*>
        <with|color|blue|<around*|(|J*<with|font-series|bold|a><rsup|i>\<cdot\><with|font-series|bold|c>|)><rsup|\<ast\>>-J*<with|font-series|bold|a><rsup|i>\<cdot\><with|font-series|bold|c>=<with|font-series|bold|0>>
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Metric identities in practise (Kopriva 2006)>

    <unroll|<\shown>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-valign|c>|<cwith|1|1|2|2|cell-halign|l>|<cwith|1|1|1|1|cell-halign|l>|<twith|table-width|1par>|<twith|table-hmode|exact>|<table|<row|<\cell>
          <large|<with|font-series|bold|2-D>>
        </cell>|<\cell>
          <\equation*>
            J*<with|font-series|bold|a><rsup|1>=<around*|(|y<rsub|\<eta\>>,-x<rsub|\<eta\>>|)>,<space|2em>J*<with|font-series|bold|a><rsup|2>=<around*|(|-y<rsub|\<xi\>>,x<rsub|\<xi\>>|)>.
          </equation*>

          <\equation*>
            \<partial\><rsub|\<xi\>><rsup|N>*J*<with|font-series|bold|a><rsup|1>+\<partial\><rsub|\<eta\>><rsup|N>*J*<with|font-series|bold|a><rsup|2>=<with|font-series|bold|0>
          </equation*>

          <\equation*>
            <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|r>|<table|<row|<cell|\<partial\><rsup|N><rsub|\<xi\>><around*|(|y<rsub|\<eta\>>|)>-\<partial\><rsub|\<eta\>><rsup|N>*<around*|(|x<rsub|\<xi\>>|)>=0>>|<row|<cell|-\<partial\><rsub|\<xi\>><rsup|N><around*|(|x<rsub|\<eta\>>|)>+\<partial\><rsub|\<eta\>><rsup|N>*<around*|(|x<rsub|\<xi\>>|)>=0>>>>>
          </equation*>

          <\equation*>
            Condition:<space|1em>Degree of mesh\<leq\>N
          </equation*>

          <space|43em>
        </cell>>>>
      </wide-tabular>
    </shown>|<\shown>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-valign|c>|<table|<row|<\cell>
          <large|<with|font-series|bold|3-D>>
        </cell>|<\cell>
          <\equation*>
            J*<with|font-series|bold|a><rsup|1>=<with|font-series|bold|a><rsup|2>\<times\><with|font-series|bold|a><rsup|3>,<space|1em>J*<with|font-series|bold|a><rsup|2>=<with|font-series|bold|a><rsup|3>\<times\><with|font-series|bold|a><rsup|1>,<space|1em>J*<with|font-series|bold|a><rsup|3>=<with|font-series|bold|a><rsup|1>\<times\><with|font-series|bold|a><rsup|2>
          </equation*>

          <\equation*>
            Condition:<space|2em>Degree of mesh\<leq\>N/2.
          </equation*>

          <space|43em>
        </cell>>>>
      </wide-tabular>
    </shown>|<\shown>
      Conservative form of metric terms

      <\equation*>
        J*a<rsub|n><rsup|i>=-<with|font-series|bold|e><rsub|i>\<cdot\>\<nabla\><rsub|\<xi\>>\<times\><around*|(|x<rsub|m>*\<nabla\><rsub|\<xi\>>x<rsub|l>|)>,<space|1em>i=1,2,3,<space|1em>n=1,2,3,<space|1em><around*|(|n,m,l|)>
        cyclic.
      </equation*>
    </shown>|<\shown>
      Free stream always satisfied with <with|font-series|bold|conservative
      curl form>

      <\equation*>
        J*a<rsub|n><rsup|i>=-<with|font-series|bold|e><rsub|i>\<cdot\>\<nabla\><rsub|\<xi\>><rsup|N>\<times\><around*|(|x<rsub|l>*\<nabla\><rsub|\<xi\>>
        x<rsub|m>|)>
      </equation*>
    </shown>>
  </hidden>|<\hidden>
    <tit|Free stream condition verified>

    <center|Mesh degree = 6>

    <\wide-tabular>
      <tformat|<cwith|2|2|3|3|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
        <image|figures/euler2d/free_stream/N5.pdf|0.43par|||>
      </cell>|<\cell>
        <space|1em>
      </cell>|<\cell>
        <image|figures/euler2d/free_stream/N6.pdf|0.43par|||>
      </cell>>|<row|<\cell>
        <very-large|Solution polynomial degree 5>
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <very-large|Solution polynomial degree 6>
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    \;

    \;

    \;

    \;

    \;

    \;

    <center|<with|font-family|rm|font-series|bold|font-shape|italic|font-base-size|30|Numerical
    Results>>
  </hidden>|<\hidden>
    <tit|2-D Composite signal <cite|LeVeque1996>>

    <\wide-tabular>
      <tformat|<cwith|2|2|1|1|cell-row-span|1>|<cwith|2|2|1|1|cell-col-span|2>|<cwith|5|5|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<cwith|5|5|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-row-span|1>|<cwith|3|3|1|1|cell-col-span|2>|<cwith|3|3|1|1|cell-halign|c>|<cwith|6|6|1|1|cell-halign|c>|<cwith|6|6|2|2|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|4|4|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-valign|c>|<table|<row|<\cell>
        <small|Min = 0, Max = 1>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/la2d/rotate_composite/initial_color.pdf|0.28par|||>
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        Initial State
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <small|Min= -0.01572, Max = 1.01422>
      </cell>|<\cell>
        <small|Min = -0.0016, Max = 1.00684>
      </cell>>|<row|<\cell>
        <image|figures/la2d/rotate_composite/tvb_color.pdf|0.28par|||>
      </cell>|<\cell>
        <image|figures/la2d/rotate_composite/blend_color.pdf|0.28par|||>
      </cell>>|<row|<\cell>
        <math|TVB-100>
      </cell>|<\cell>
        MUSCL-Hancock
      </cell>>>>
    </wide-tabular>
  </hidden>|<\shown>
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
  </shown>|<\hidden>
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
        <math|t=0.2>, NC = <math|568\<times\>142>, Rusanov, Degree <math|N=4>
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
        <math|t=0.2>, NC=<math|568\<times\>142>, LWFR, Degree <math|N=4>
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
        <math|Density profile> <math|t=0.4>, <math|NC=256<rsup|2>>, Degree
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
    <tit|Sedov blast <cite|SEDOV1959146>>

    <\wide-tabular>
      <tformat|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|2>|<cwith|1|1|1|1|cell-halign|c>|<cwith|3|3|1|1|cell-halign|c>|<cwith|3|3|2|2|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
        <math|t=0.001,<space|1em>NC=160<rsup|2>,<space|1em>Degree N=4>
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
    <tit|Astrophysical jet Mach 2000 <cite|b0ca7a5eeb40423caed7422ff5e0b525>>

    \;

    \;

    <\wide-tabular>
      <tformat|<cwith|3|3|1|1|cell-halign|c>|<cwith|4|4|1|1|cell-halign|c>|<cwith|4|4|3|3|cell-halign|c>|<cwith|1|1|1|1|cell-row-span|1>|<cwith|1|1|1|1|cell-col-span|3>|<cwith|1|1|1|1|cell-halign|c>|<table|<row|<\cell>
        Density profile, <math|NC=450\<times\>225>, <math|t=0.001>, Degree
        <math|N=4>
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        \;
      </cell>>|<row|<\cell>
        <image|figures/euler2d/M2000/trixi.pdf|0.45par|||>
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        <image|figures/euler2d/M2000/lwfr.pdf|0.45par|||>
      </cell>>|<row|<\cell>
        <verbatim|Trixi.jl>
      </cell>|<\cell>
        \;
      </cell>|<\cell>
        LWFR
      </cell>>>>
    </wide-tabular>
  </hidden>|<\hidden>
    <tit|Conclusions>

    <with|font-base-size|11|<\itemize>
      <unroll-greyed|<\shown>
        <item>A Jacobian free Lax-Wendroff scheme presented in the
        collocation based Flux Reconstruction (FR) framework.
      </shown>|<\hidden*>
        <item>Dissipative part of numerical flux computed with time averaged
        solution, leading to an increase in CFL number. The obtained scheme
        is equivalent to ADER-DG for linear problems.
      </hidden*>|<\hidden*>
        <item>Central part of numerical flux computed by performing the
        Lax-Wendroff procedure at the face, leading to improvement in
        accuracy.
      </hidden*>|<\hidden*>
        <item>Sub-cell based blending limiter <cite|HENNEMANN2021109935> with
        MUSCL-Hancock reconstruction introduced for Lax-Wendroff schemes and
        is found to be more accurate than the first order blending initially
        proposed in <cite|HENNEMANN2021109935>.
      </hidden*>|<\hidden*>
        <item>Problem independent slope limiting procedure proposed for
        MUSCL-Hancock schemes on general grids which leads to provable
        admissibility preservation.
      </hidden*>|<\hidden*>
        <item>Using the admissibility preserving MUSCL-Hancock and a flux
        correction, an admissibility preserving Lax-Wendroff scheme was
        constructed.
      </hidden*>|<\hidden*>
        <item>The scheme was extended to unstructured grids and the free
        stream condition was proven to be equivalent to that of Flux
        Reconstruction schemes.
      </hidden*>>
    </itemize>>
  </hidden>|<\hidden>
    <tit|References>

    \;

    \;

    \;

    \;

    \;

    \;

    \;

    <with|font-base-size|11|><with|font-base-size|8|Arpit Babbar, Sudarshan
    Kumar Kenettinkara<localize|, and >Praveen Chandrashekar. Lax-wendroff
    flux reconstruction method for hyperbolic conservation laws.
    <newblock><with|font-shape|italic|Journal of Computational Physics>, 2022
    <hlink|https://doi.org/10.1016/j.jcp.2022.111423|https://doi.org/10.1016/j.jcp.2022.111423>,
    <hlink|https://arxiv.org/abs/2207.02954|https://arxiv.org/abs/2207.02954>>
  </hidden>|<\hidden>
    <tit|Bibliography>

    <\bibliography|bib|tm-plain|references>
      <\bib-list|21>
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

        <bibitem*|20><label|bib-Zhang2010b>Xiangxiong Zhang<localize| and
        >Chi-Wang Shu. <newblock>On maximum-principle-satisfying high order
        schemes for scalar conservation laws.
        <newblock><with|font-shape|italic|Journal of Computational Physics>,
        229(9):3091\U3120, may 2010.<newblock>

        <bibitem*|21><label|bib-zorio_approximate_2017>D.<nbsp>Zorío,
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
    \;
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
    <tit|Low order residual : MUSCL-Hancock>

    <unroll|<\shown>
      <center|<image|illustrations/subcells.pdf|0.4par|||>>
    </shown>|<\hidden*>
      Integrate conservation law <math|<with|font-series|bold|u><rsub|t>+<with|font-series|bold|f><around*|(|<with|font-series|bold|u>|)><rsub|<with|font-series|bold|x>>=<with|font-series|bold|0>>
      over <math|I<rsup|e><rsub|j>\<times\><around*|[|t<rsup|n>,t<rsup|n+1>|]>>

      <\equation*>
        \<mathLaplace\>x<rsub|e>*w<rsub|j>*<around*|(|<bw><rsub|j><rsup|n+1>-<bw><rsub|j><rsup|n>|)>+<big|int><rsub|t<rsup|n>><rsup|t<rsup|n+1>><around|(|<with|font-series|bold|f><rsub|j+<frac|1|2>>-<with|font-series|bold|f><rsub|j-<frac|1|2>>|)>*d\<nocomma\>t=0.
      </equation*>
    </hidden*>|<\hidden*>
      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<text|Midpoint rule:
        ><bw><rsub|j><rsup|n+1>=<bw><rsub|j><rsup|n>-<frac|\<mathLaplace\>t|\<mathLaplace\>x<rsub|e>w<rsub|j>>*<around*|(|<with|font-series|bold|f><rsub|j+1/2><rsup|n+1/2>-<with|font-series|bold|f><rsub|j-1/2><rsup|n+1/2>|)>>>|<row|<cell|<with|font-series|bold|f><rsub|j+1/2><rsup|n+1/2>=<with|font-series|bold|f><around*|(|<bw><rsub|j+1/2-><rsup|n+1/2>,<bw><rsub|j+1/2+><rsup|n+1/2>|)>>>>>>
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
    <tit|Flux Reconstruction for the transformed PDE>

    <\with|font-base-size|10>
      <\equation*>
        <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<dv|<with|font-series|bold|u><rsub|e,<with|font-series|bold|p>><rsup|\<delta\>>|t>**+<frac|1|J>*\<nabla\><rsub|<with|font-series|bold|\<xi\>>><rsup|N>\<cdot\><wide|<with|font-series|bold|f>|~><rsub|e><around*|(|<with|font-series|bold|\<xi\>><rsub|<with|font-series|bold|p>>|)>>>|<row|<cell|<space|1em><tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|+<frac|1|J>*<big|sum><rsub|i=1><rsup|3><around*|(|<around*|(|<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><rsup|\<ast\>>-<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><around*|(|<with|font-series|bold|\<xi\>><rsub|i><rsup|R>|)>*g<rsub|R><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>>>|<row|<cell|+<frac|1|J>*<big|sum><rsub|i=1><rsup|3><around*|(|<around*|(|<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><rsup|\<ast\>>-<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsub|e>\<cdot\><with|font-series|bold|n><rsub|s,i>|)><around*|(|<with|font-series|bold|\<xi\>><rsub|i><rsup|L>|)>*g<rsub|L><rprime|'><around*|(|\<xi\><rsub|p<rsub|i>>|)>=<with|font-series|bold|0>,>>>>>>>>>>
      </equation*>

      where

      <\equation*>
        <tabular*|<tformat|<table|<row|<cell|<with|font-series|bold|p>=<around*|(|p<rsub|1>,p<rsub|2>,p<rsub|3>|)>
        <text|for >1\<leq\>p<rsub|i>\<leq\>N+1>>|<row|<cell|
        <with|font-series|bold|\<xi\>><rsub|<with|font-series|bold|<with|font-series|bold|p>>>=<with|font-series|bold|\<xi\>><rsub|p<rsub|1>p<rsub|2>p<rsub|3>>=<around*|(|\<xi\><rsub|p<rsub|1>>,\<xi\><rsub|p<rsub|2>>,\<xi\><rsub|p<rsub|3>>|)>
        <text|is the solution point of collocation>,<with|font-series|bold|e>
        <text|is the element index>>>|<row|<cell|\<nabla\><rsub|<with|font-series|bold|\<xi\>>><rsup|N>
        <text|is the degree <math|N> gradient>>>|<row|<cell|<around*|(|<wide|<with|font-series|bold|><with|font-series|bold|f>|~><rsub|e>\<cdot\><with|font-series|bold|n>|)><rsup|\<ast\>>
        <text|is the numerical flux along normal
        <math|<with|font-series|bold|n>>>>>|<row|<cell|<with|font-series|bold|n><rsub|s,i>
        <text|is the normal vector in reference cell along <math|i<rsup|th>>
        direction>>>|<row|<cell|<with|font-series|bold|\<xi\>><rsub|i><rsup|L/R>
        <text|is the point that agrees with
        <math|<with|font-series|bold|\<xi\>>> at <math|j,k> and equals 0 or 1
        for <math|L> or <math|R> at <math|i>.>>>>>>
      </equation*>
    </with>
  </hidden>>
</body>

<\initial>
  <\collection>
    <associate|font|roman>
    <associate|font-base-size|8>
    <associate|font-family|sans>
    <associate|info-flag|short>
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
    <associate|bib-Zhang2010b|<tuple|20|?>>
    <associate|bib-akkurt2022|<tuple|1|?>>
    <associate|bib-b0ca7a5eeb40423caed7422ff5e0b525|<tuple|7|?>>
    <associate|bib-oldpaper|<tuple|2|?>>
    <associate|bib-ranocha2022adaptive|<tuple|13|?>>
    <associate|bib-schaal2015|<tuple|15|?>>
    <associate|bib-volkner2010|<tuple|18|?>>
    <associate|bib-zorio_approximate_2017|<tuple|21|?>>
    <associate|eq:ader.linear.update|<tuple|7|?>>
    <associate|eq:admissible.theta.defn|<tuple|5|?>>
    <associate|eq:lemma.1.used|<tuple|3|?>>
    <associate|eq:lwfr.linear.update|<tuple|8|?>>
    <associate|eq:new.cfl1|<tuple|1|?>>
    <associate|eq:new.cfl2|<tuple|2|?>>
    <associate|eq:new.cfl3|<tuple|4|?>>
    <associate|eq:non.con.face.defn1|<tuple|6|?>>
    <associate|eq:quadrature1|<tuple|9|?>>
    <associate|lemma:m.h.step.1|<tuple|1|?>>
    <associate|lemma:muscl.step2.general|<tuple|2|?>>
    <associate|lemma:muscl.step3.wss|<tuple|3|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      HENNEMANN2021109935

      Huynh2007

      Huynh2007

      Huynh2007

      zorio_approximate_2017

      oldpaper

      HENNEMANN2021109935

      HENNEMANN2021109935

      HENNEMANN2021109935

      Persson2006

      Berthon2006

      LeVeque1996

      Woodward1984

      Woodward1984

      volkner2010

      schaal2015

      volkner2010

      schaal2015

      SEDOV1959146

      b0ca7a5eeb40423caed7422ff5e0b525

      b0ca7a5eeb40423caed7422ff5e0b525

      HENNEMANN2021109935

      HENNEMANN2021109935

      Jackson2017

      Dumbser2009

      Julia-2017

      ranocha2022adaptive

      akkurt2022

      ranocha2022adaptive

      akkurt2022

      ranocha2022adaptive

      akkurt2022
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>