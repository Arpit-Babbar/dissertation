<TeXmacs|2.1.1>

<style|<tuple|source|british>>

<\body>
  <assign|sign|<macro|sign>> <assign|cblue|<macro|1|<with|color|blue|<arg|1>>>>

  <assign|clr|<macro|1|2|<with|color|#1|<arg|2>>>>

  <assign|Kref|<macro|<wide|K|^>>>

  <assign|rnum|<macro|1|<left|llbracket><arg|1> <right|rrbracket>>>

  <assign|bs|<macro|1|<boldsymbol|<arg|1>>>>

  <assign|tell|<macro|<wide|\<ell\>|~>>>

  <assign|avg|<macro|1|<wide|<arg|1>|\<bar\>>>>

  # Cell centre for Finite volume method

  <assign|ax|<avg|x>>

  \;

  <assign|minmod|<macro|minmod>>

  <assign|myvector|<macro|1|<with|font|Microsoft|<text|<space|0.1spc><arg|1><space|0.15spc>>>>>
  # microsoft san seriff font

  # Vector symbols

  <assign|vu|<macro|<myvector|u>>>

  <assign|vA|<macro|<myvector|A>>>

  <assign|vD|<macro|<myvector|D>>>

  <assign|vH|<macro|<myvector|H>>>

  <assign|vT|<macro|<myvector|T>>>

  <assign|vI|<macro|<myvector|I>>>

  <assign|vU|<macro|<myvector|U>>>

  <assign|vf|<macro|<myvector|f>>>

  <assign|vg|<macro|<myvector|g>>>

  <assign|vs|<macro|<myvector|s>>>

  <assign|vF|<macro|<myvector|F>>>

  <assign|vG|<macro|<myvector|G>>>

  <assign|vb|<macro|<myvector|b>>>

  <assign|vR|<macro|<myvector|R>>>

  <assign|vS|<macro|<myvector|S>>>

  <assign|vV|<macro|<myvector|V>>>

  <assign|vp|<macro|<myvector|p>>>

  \;

  <assign|cfl|<macro|<math-up|CFL>>>

  <assign|extrapolate|<macro|<with|font-series|bold|AE>>>

  <assign|evaluate|<macro|<with|font-series|bold|EA>>>

  \;

  #Partial Derivative symbols

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

  <assign|bA|<macro|<with|font-series|bold|A>>>

  <assign|C|<with|font-series|bold|<with|font|cal|C>>>

  <assign|bC|<macro|\<b-C\>>>

  <assign|bd|<macro|\<b-d\>>>

  <assign|ba|<macro|<with|font-series|bold|a>>>

  <assign|bb|<macro|<with|font-series|bold|b>>>

  <assign|bD|<macro|\<b-D\>>>

  <assign|be|<macro|\<b-e\>>>

  <assign|bc|<macro|<with|font-series|bold|c>>>

  <assign|bE|<macro|\<b-E\>>>

  <assign|bof|<macro|\<b-f\>>>

  <assign|bF|<macro|\<b-F\>>>

  <assign|bg|<with|font-series|bold|g>>

  <assign|bG|<with|font-series|bold|G>>

  <assign|bl|<macro|\<b-l\>>>

  <assign|bn|<math|<with|font-series|bold|n>>>

  <assign|bM|<macro|\<b-M\>>>

  <assign|bp|<macro|\<b-p\>>>

  <assign|bP|<macro|\<b-P\>>>

  <assign|bq|<macro|\<b-q\>>>

  <assign|bzero|<with|font-series|bold|0>>

  <assign|bS|<macro|\<b-S\>>>

  <assign|br|<macro|\<b-r\>>>

  <assign|bu|<with|font-series|bold|u>>

  <assign|bv|<macro|\<b-v\>>>

  <assign|bx|<macro|\<b-x\>>>

  <assign|by|<with|font-series|bold|y>>

  <assign|bX|<macro|<math|<with|font-series|bold|X>>>>

  #Bold symbols-end

  \;

  #Hat appendex

  <assign|hu|<math|<wide|u|^>>>

  #Sobolev spaces

  <assign|hsd|<math|<wide|H|\<dot\>><rsup|s>>>

  <assign|poly|<macro|\<bbb-P\>>>

  <assign|tpoly|<macro|\<bbb-Q\>>>

  <assign|emh|e-<frac|1|2>>

  <assign|eymh|e<rsub|y>-<frac|1|2>>

  <assign|eph|e+<frac|1|2>>

  <assign|exph|e<rsub|x>+<frac|1|2>>

  <assign|iph|i+<frac|1|2>>

  <assign|imh|i-<frac|1|2>>

  <assign|ipmh|i\<pm\><frac|1|2>>

  <assign|jmh|j-<frac|1|2>>

  <assign|jph|j+<frac|1|2>>

  <assign|jpmh|j\<pm\><frac|1|2>>

  <assign|nmh|n-<frac|1|2>>

  <assign|nph|n+<frac|1|2>>

  <assign|Nmh|N-<frac|1|2>>

  <assign|Nph|N+<frac|1|2>>

  <assign|half|<frac|1|2>>

  <assign|ud|<text|<with|font-family|rm|d>>>

  <assign|pd|<macro|1|2|<frac|\<partial\><arg|1>|\<partial\><arg|2>>>>

  <assign|od|<macro|1|2|<frac|<ud><arg|1>|<ud><arg|2>>>>

  <assign|ncell|<macro|<with|font-family|rm|NCELL>>>

  <assign|bmu|\<mu\>>

  # All the mu +-

  <assign|mum|<macro|<bmu><rsub|->>>

  <assign|mup|<macro|<bmu><rsub|+>>>

  <assign|mumx|<macro|<bmu><rsub|-x>>>

  <assign|mupx|<macro|<bmu><rsub|+x>>>

  <assign|mupmx|<macro|<bmu><rsub|\<pm\>x>>>

  <assign|mumy|<macro|<bmu><rsub|-y>>>

  <assign|mupy|<macro|<bmu><rsub|+y>>>

  <assign|mupmy|<macro|<bmu><rsub|\<pm\>y>>>

  # All the theta \<pm\> symbols

  <assign|btheta|<with|font-series|bold|\<theta\>>>

  <assign|thetapx|<btheta><rsub|p\<nocomma\>q><rsup|+x>>

  <assign|thetamx|<btheta><rsub|p\<nocomma\>q><rsup|-x>>

  <assign|thetapmx|<btheta><rsub|p\<nocomma\>q><rsup|\<pm\>x>>

  <assign|thetapmy|<btheta><rsub|p\<nocomma\>q><rsup|\<pm\>y>>

  <assign|thetapy|<btheta><rsub|p\<nocomma\>q><rsup|+y>>

  <assign|thetamy|<btheta><rsub|p\<nocomma\>q><rsup|-y>>

  # All the e, e \<pm\> symbols

  <assign|ee|<macro|<math-bf|e>>>

  <assign|ex|<macro|e<rsub|x>>>

  <assign|ey|<macro|e<rsub|y>>>

  <assign|expmh|<macro|e<rsub|x> \<pm\><half>>>

  <assign|exmh|<macro|<ex>- <half>>>

  <assign|epmh|<macro|e\<pm\><half>>>

  <assign|eypmh|<macro|<ey>\<pm\><half>>>

  <assign|eyph|<macro|<ey>+ <half>>>

  <assign|eexpmh|<macro|(<expmh>, <ey>)>>

  <assign|eexph|<macro|(<exph>, <ey>)>>

  <assign|eexmh|<macro|(<exmh>, <ey>)>>\<nocomma\>

  <assign|eeypmh|<macro|(<ex>, <eypmh>)>>

  <assign|eeyph|<macro|(<ex>, <eyph>)>>

  <assign|eeymh|<macro|(<ex>, <eymh>)>>

  \;

  <assign|Uad|<macro|\<cal-U\><rsub|<with|font-family|rm|ad>>>>

  # Others

  <assign|lmn|<math|\<lambda\>\<mu\>\<nu\>>>

  \;

  <assign|uu|<bu>> <assign|bw|<value|uu>>

  <assign|re|<macro|\<bbb-R\>>>

  <assign|im|<macro|\<frak-i\>>>

  <assign|en|<macro|\<bbb-E\>>>

  <assign|thresh|<macro|\<bbb-T\>>>

  <assign|slope|<macro|<with|font-series|bold|\<delta\>>>>

  # Blending paper u pm, etc.

  <assign|uspx|<macro|<uu><rsup|\<ast\>, +x>>>

  <assign|uspmx|<macro|<uu><rsup|\<ast\>, \<pm\>x>>>

  <assign|uspmy|<macro|<uu><rsup|\<ast\>, \<pm\>y>>>

  <assign|uspmxy|<macro|<uu><rsup|\<ast\>, \<pm\><rsub|x\<nocomma\>y>>>>

  <assign|uspy|<macro|<uu><rsup|\<ast\>, +y>>>

  <assign|uspxy|<macro|<uu><rsup|\<ast\>, +x\<nocomma\>y>>>

  <assign|usmx|<macro|<uu><rsup|\<ast\>, -x>>>

  <assign|usmy|<macro|<uu><rsup|\<ast\>, -y>>>

  <assign|unphpx|<macro|<uu><rsup|<nph>, +x>>>

  <assign|unphmx|<macro|<uu><rsup|<nph>, -x>>>

  <assign|unphpmx|<macro|<uu><rsup|<nph>, \<pm\>x>>>

  <assign|unphpmy|<macro|<uu><rsup|<nph>, \<pm\>y>>>

  <assign|unphsx|<macro|<uu><rsup|<nph>, \<ast\>x>>>

  <assign|unphsy|<macro|<uu><rsup|<nph>, \<ast\>y>>>

  <assign|unphpy|<macro|<uu><rsup|<nph>, +y>>>

  <assign|unphmy|<macro|<uu><rsup|<nph>, -y>>>

  <assign|unpxy|<macro|<uu><rsup|n,+x\<nocomma\>y>>>

  <assign|unpx|<macro|<uu><rsup|n, +x>>>

  <assign|unmx|<macro|<uu><rsup|n, -x>>>

  <assign|unpy|<macro|<uu><rsup|n, +y>>>

  <assign|unmy|<macro|<uu><rsup|n, -y>>>

  <assign|unpmx|<macro|<uu><rsup|n, \<pm\>x>>>

  <assign|unpmy|<macro|<uu><rsup|n, \<pm\>y>>>

  <assign|atu|<wide|<value|uu>|\<invbreve\>>>

  <assign|utilow|<value|atu><rsup|low,n+1>>

  <assign|au|<macro|<avg|<value|uu>>>>

  <assign|uU|<with|font-series|bold|U>>

  <assign|ppu|<math|<value|uu>>>

  <assign|rpu|<math|<wide|<value|uu>|^><rsup|\<delta\>>>>

  <assign|tu|<math|<wide|<bu>|~>>>

  <assign|pf|<bof>> <assign|pg|<value|bg>> <assign|ff|<macro|<value|pf>>>

  <assign|fg|<value|pg>>

  <assign|pG|<value|bG>>

  <assign|F|<bF>>

  <assign|atF|<wide|<value|F>|\<invbreve\>>>
  <assign|atG|<wide|<value|bG>|\<invbreve\>>>

  <assign|ppf|<math|<value|pf><rsup|\<delta\>>>>

  <assign|rpf|<math|<wide|<value|pf>|^><rsup|\<delta\>>>>

  <assign|tf|<math|<wide|<value|pf>|~>>>

  <assign|tF|<math|<wide|<value|F>|~>>>

  \;

  <assign|Div|\<nabla\><rsub|<with|font-series|bold|x>>\<cdot\>>

  <assign|II|<math|\<bbb-I\><rsub|N>>>

  <assign|I|<math|I>>

  <assign|Id|Id>

  <assign|InI|<math|I<rsub|N>>>

  <assign|xi1|<math|\<xi\>><rsup|1>>

  <assign|xi2|<math|\<xi\>><rsup|2>>

  <assign|xi3|<math|\<xi\>><rsup|3>>

  <assign|xii|<math|\<xi\>><rsup|i>>

  <assign|xij|<math|\<xi\>><rsup|j>>

  <assign|xik|<math|\<xi\>><rsup|k>>

  <assign|polyP|<poly>>

  <assign|proP|<math|<with|font|cal|P>>> <assign|bll|<math|<math|<with|font-series|bold|\<ell\>>>>>

  <assign|Vi|<verbatim|V>> <assign|ijk|i<math|\<nocomma\>>j<math|\<nocomma\>>k>

  <assign|ijkc|i,j,k>

  <assign|Vu|<verbatim|u>>

  <assign|VR|<verbatim|R>> <assign|Cijk|C<rsub|<bp>>>

  <assign|Oo|\<Omega\><rsub|o>>

  <assign|Oip|\<partial\>\<Omega\><rsub|o,i><rsup|R>>

  <assign|Ois|\<partial\>\<Omega\><rsub|o,i><rsup|s>>

  <assign|Oim|\<partial\>\<Omega\><rsub|o,i><rsup|L>>

  <assign|Oipm|\<partial\>\<Omega\><rsub|o,i><rsup|R/L>>

  <assign|bnr|<wide|<value|bn>|^>>

  <assign|g2|g<rsub|2>>

  <assign|Leg|L>

  <assign|Nnd|\<bbb-N\><rsub|N><rsup|d>>

  <assign|Nod|\<bbb-N\><rsub|1><rsup|d>>

  <assign|Nnt|\<bbb-N\><rsub|N><rsup|2>>

  <assign|bss|<with|font-series|bold|s>>

  <assign|sphi|\<phi\>>

  <assign|G|\<Gamma\>>

  <assign|G1|\<Gamma\><rsub|1>>

  <assign|G2|\<Gamma\><rsub|2>>

  <assign|uG|<value|uu><rsub|<value|G>>>

  <assign|uG1|<value|uu><rsub|<value|G1>>>

  <assign|uG2|<value|uu><rsub|<value|G2>>>

  <assign|X|\<Xi\>>

  <assign|X1|\<Xi\><rsub|1>>

  <assign|X2|\<Xi\><rsub|2>>

  <assign|uX1|<value|uu><rsub|<value|X1>>>

  <assign|uX2|<value|uu><rsub|<value|X2>>>

  <assign|bet|<math|<with|font-series|bold|\<eta\>>>>

  <assign|bzeta|<math|<with|font-series|bold|\<zeta\>>>>

  <assign|bga|<math|<with|font-series|bold|\<gamma\>>>>

  <assign|nou|<wide|<value|uu>|\<breve\>>>

  \;

  # uep, Fep, xep symbols

  \;

  <assign|uebp|<uu><rsub|e,<bp>>>

  <assign|uebq|<uu><rsub|e,<bq>>>

  <assign|uep|<uu><rsub|e,p>>

  <assign|uepp1|<uu><rsub|e,p+1>>

  <assign|uepm1|<uu><rsub|e,p-1>>

  <assign|Uep|<uU><rsub|e,p>>

  <assign|ueq|<with|font-series|bold|<value|uu>><rsub|e,q>>

  <assign|uepop|<with|font-series|bold|<value|uu>><rsub|e+1,p>>

  <assign|uez|<with|font-series|bold|<value|uu>><rsub|e,0>>

  <assign|uebz|<with|font-series|bold|<value|uu>><rsub|e,<bzero>>>

  <assign|uepoz|<with|font-series|bold|<value|uu>><rsub|e+1,0>>

  <assign|ueN|<with|font-series|bold|<value|uu>><rsub|e,N>>

  <assign|xep|x<rsup|e><rsub|p>>

  <assign|xez|x<rsup|e><rsub|0>>

  <assign|xeN|x<rsup|e><rsub|N>>

  <assign|Fep|<F><rsub|e,p>>

  \;

  # p \<pm\> half

  <assign|pph|p+<half>>

  <assign|pmh|p-<half>>

  <assign|qph|q+<half>>

  <assign|qmh|q-<half>>

  <assign|ppmh|p\<pm\><half>>

  <assign|qpmh|q\<pm\><half>>

  \;

  # Formatting\ 

  <assign|paragraph-toc|<macro|name|>>

  \;

  # Find these homes!

  <assign|bo|<bzero>>

  <assign|ad|P> # Admissibility constraint symbol

  \;

  <assign|subindex|=>

  <assign|cw|<with|font-series|bold|w>>

  \;

  <assign|uus|<math|<value|uu><rsup|\<ast\>>>>

  <assign|F1|<value|F>>

  <assign|sF1|F>

  <assign|vF1|<vF>>

  <assign|F1m|<value|F><rsup|->>

  <assign|F1p|<value|F><rsup|+>>

  <assign|F1pm|<value|F><rsup|\<pm\>>>

  <assign|F2|<value|F><rsup|\<ast\>>>

  <assign|sF2|F<rsup|\<ast\>>>

  <assign|vF2|<vF><rsup|\<ast\>>>

  <assign|F2m|<value|F><rsup|\<ast\>->>

  <assign|F2p|<value|F><rsup|\<ast\>+>>

  <assign|F2pm|<value|F><rsup|\<ast\>\<pm\>>>

  <assign|F1ho|<F><rsup|HO>>

  <assign|F2ho|<F><rsup|HO\<ast\>>>

  <assign|uU1|<uU>>

  <assign|vU1|<vU>>

  <assign|uU1p|<uU><rsup|+>>

  <assign|uU1m|<uU><rsup|->>

  <assign|uU2|<uU><rsup|\<ast\>>>

  <assign|vU2|<vU><rsup|\<ast\>>>

  <assign|uU2p|<uU><rsup|\<ast\>+>>

  <assign|uU2m|<uU><rsup|\<ast\>->>

  <assign|vA1|<vA><rsup|(1)>>

  <assign|vT1|<vT><rsup|(1)>>

  <assign|vT2|<vT><rsup|(2)>>

  <assign|vT2s|<vT><rsup|(2,\<ast\>)>>

  <assign|S1|<bS><rsup|\<ast\>>>

  <assign|S2|<bS>>

  <assign|R1|<vR><rsup|\<ast\>>>

  <assign|R2|<vR>>

  <assign|bL|<with|font-series|bold|L>>

  <assign|bL1|<with|font-series|bold|L><rsup|1>>

  <assign|bL2|<with|font-series|bold|L><rsup|2>>

  <assign|vFs|<myvector|F*>>

  <assign|vfs|<myvector|f*>>

  <assign|vss|<myvector|s*>>

  <assign|vus|<myvector|u*>>

  <assign|vUs|<myvector|U*>>

  <assign|vxi|<with|font-series|bold|<math|\<xi\>>>>

  \;

  <assign|qint|<big|<math|<superpose|<big|int>|->>>>

  <assign|qqint|<math|<superpose|<big|int>|<small| ->>>>

  \;

  <assign|Cs|C<rsub|CFL>>

  \;

  <assign|Div|\<nabla\><rsub|<with|font-series|bold|x>>\<cdot\>>

  <assign|II|<math|<with|font|cal|I><rsub|N>>>

  <assign|I|<math|I>>

  <assign|Id|Id>

  <assign|InI|<math|I<rsub|N>>>

  \;

  <assign|proP|<math|<with|font|cal|P>>>

  \;

  <assign|bll|<math|<math|<with|font-series|bold|\<ell\>>>>>

  <assign|Vi|<verbatim|V>>

  \;

  <assign|fs|<macro|\<b-f\><rsup|\<alpha\>>>>

  <assign|fa|<macro|\<b-f\><rsup|a>>>

  <assign|fv|<macro|\<b-f\><rsup|v>>>

  <assign|tfa|<macro|<wide|\<b-f\>|~><rsup|a>>>

  <assign|tfv|<macro|<wide|\<b-f\>|~><rsup|v>>>

  <assign|tfs|<macro|<wide|\<b-f\>|~><rsup|\<alpha\>>>>

  <assign|tfad|<macro|<wide|\<b-f\>|~><rsup|a \<delta\>>>>

  <assign|tfvd|<macro|<wide|\<b-f\>|~><rsup|v \<delta\>>>>

  <assign|Fa|<macro|<F><rsup|a>>>

  <assign|Fv|<macro|<F><rsup|v>>>

  <assign|tFa|<macro|<wide|\<b-F\>|~><rsup|a>>>

  <assign|tFv|<macro|<wide|\<b-F\>|~><rsup|v>>>

  <assign|tFs|<macro|<wide|\<b-F\>|~><rsup|\<alpha\>>>>

  <assign|tFad|<macro|<wide|\<b-F\>|~><rsup|a \<delta\>>>>

  <assign|tFvd|<macro|<wide|\<b-F\>|~><rsup|v \<delta\>>>>

  <assign|bt|<macro|<math|\<b-tau\>>>>

  <assign|bQ|<macro|\<b-Q\>>>

  <assign|vxi|<macro|<math|\<b-xi\>>>>

  <assign|T|<macro|<math|\<theta\>>>>

  <assign|M|<macro|\<cal-M\>>>

  <assign|mB|<macro|\<cal-B\>>>

  <assign|Pra|<macro|<with|font-shape|italic|Pr>>>

  <assign|Grad|<macro|\<nabla\><rsub|\<b-x\>>>>

  \;

  # Trying to make section fonts smaller

  <assign|principal-section*|<macro|title|<compound|chapter-clean><compound|chapter-header|<arg|title>><style-with|src-compact|none|<if|<sectional-short-style>|<section-unnumbered-title|<arg|title>>|<chapter-unnumbered-title|<arg|title>>>>>>

  <assign|render-bibliography|<\macro|name|body>
    <chapter*|<arg|name>>

    <with|par-first|0fn|par-par-sep|0fn|font-size|0.84|<arg|body>>
  </macro>>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>