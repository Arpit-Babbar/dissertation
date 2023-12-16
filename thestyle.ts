<TeXmacs|2.1>

<style|<tuple|source|british>>

<\body>
  <assign|sign|<macro|sign>> <assign|cblue|<macro|1|<with|color|blue|<arg|1>>>>

  <assign|clr|<macro|1|2|<with|color|#1|<arg|2>>>>

  <assign|Kref|<macro|<wide|K|^>>>

  <assign|rnum|<macro|1|<left|llbracket><arg|1> <right|rrbracket>>>

  <assign|bs|<macro|1|<boldsymbol|<arg|1>>>>

  <assign|tell|<macro|<wide|\<ell\>|~>>>

  <assign|myvector|<macro|1|<with|font|Microsoft|<text|<arg|1><space|0.25spc>>>>>
  # microsoft san seriff font

  <assign|vu|<macro|<myvector|u>>>

  <assign|vA|<macro|<myvector|A>>>

  <assign|vD|<macro|<myvector|D>>>

  <assign|vH|<macro|<myvector|H>>>

  <assign|vT|<macro|<myvector|T>>>

  <assign|vI|<macro|<myvector|I>>>

  <assign|vU|<macro|<myvector|U>>>

  <assign|vf|<macro|<myvector|f>>>

  <assign|vg|<macro|<myvector|g>>>

  <assign|vF|<macro|<myvector|F>>>

  <assign|vG|<macro|<myvector|G>>>

  <assign|vb|<macro|<myvector|b>>>

  <assign|vR|<macro|<myvector|R>>>

  <assign|vV|<macro|<myvector|V>>>

  <assign|vp|<macro|<myvector|p>>>

  <assign|cfl|<macro|<math-up|CFL>>>

  <assign|extrapolate|<macro|<with|font-series|bold|AE>>>

  <assign|evaluate|<macro|<with|font-series|bold|EA>>>

  \;

  ## Paper 2

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

  <assign|bg|\<b-g\>>

  <assign|bG|\<b-G\>>

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

  <assign|btheta|<with|font-series|bold|\<theta\>>>

  <assign|thetapx|<btheta><rsub|i\<nocomma\>j><rsup|+x>>

  <assign|thetamx|<btheta><rsub|i\<nocomma\>j><rsup|-x>>

  <assign|thetapmx|<btheta><rsub|i\<nocomma\>j><rsup|\<pm\>x>>

  <assign|thetapmy|<btheta><rsub|i\<nocomma\>j><rsup|\<pm\>y>>

  <assign|thetapy|<btheta><rsub|i\<nocomma\>j><rsup|+y>>

  <assign|thetamy|<btheta><rsub|i\<nocomma\>j><rsup|-y>>

  <assign|poly|<macro|\<bbb-P\>>>

  <assign|tpoly|<macro|\<bbb-Q\>>>

  <assign|emh|<macro|e-<frac|1|2>>>

  <assign|eymh|<macro|e<rsub|y>-<frac|1|2>>>

  <assign|eph|<macro|e+<frac|1|2>>>

  <assign|exph|<macro|e<rsub|x>+<frac|1|2>>>

  <assign|iph|<macro|i+<frac|1|2>>>

  <assign|imh|<macro|i-<frac|1|2>>>

  <assign|ipmh|<macro|i\<pm\><frac|1|2>>>

  <assign|jmh|<macro|j-<frac|1|2>>>

  <assign|jph|<macro|j+<frac|1|2>>>

  <assign|jpmh|<macro|j\<pm\><frac|1|2>>>

  <assign|nmh|<macro|n-<frac|1|2>>>

  <assign|nph|<macro|n+<frac|1|2>>>

  <assign|Nmh|<macro|N-<frac|1|2>>>

  <assign|Nph|<macro|N+<frac|1|2>>>

  <assign|half|<macro|<frac|1|2>>>

  <assign|ud|<text|<with|font-family|rm|d>>>

  <assign|pd|<macro|1|2|<frac|\<partial\><arg|1>|\<partial\><arg|2>>>>

  <assign|od|<macro|1|2|<frac|<ud><arg|1>|<ud><arg|2>>>>

  <assign|ncell|<macro|<with|font-family|rm|NCELL>>>

  <assign|bmu|\<mu\>>

  <assign|mum|<macro|<bmu><rsub|->>>

  <assign|mup|<macro|<bmu><rsub|+>>>

  <assign|mumx|<macro|<bmu><rsub|-x>>>

  <assign|mupx|<macro|<bmu><rsub|+x>>>

  <assign|mupmx|<macro|<bmu><rsub|\<pm\>x>>>

  <assign|mumy|<macro|<bmu><rsub|-y>>>

  <assign|mupy|<macro|<bmu><rsub|+y>>>

  <assign|mupmy|<macro|<bmu><rsub|\<pm\>y>>>

  <assign|ee|<macro|<math-bf|e>>>

  <assign|ex|<macro|e<rsub|x>>>

  <assign|ey|<macro|e<rsub|y>>>

  <assign|bo|<bzero>>

  <assign|expmh|<macro|e<rsub|x> \<pm\><half>>>

  <assign|exmh|<macro|<ex>- <half>>>

  <assign|eypmh|<macro|<ey>\<pm\><half>>>

  <assign|eyph|<macro|<ey>+ <half>>>

  <assign|eexpmh|<macro|(<expmh>, <ey>)>>

  <assign|eexph|<macro|(<exph>, <ey>)>>

  <assign|eexmh|<macro|(<exmh>, <ey>)>>\<nocomma\>

  <assign|eeypmh|<macro|(<ex>, <eypmh>)>>

  <assign|eeyph|<macro|(<ex>, <eyph>)>>

  <assign|eeymh|<macro|(<ex>, <eymh>)>>

  <assign|Uad|<macro|\<cal-U\><rsub|<with|font-family|rm|ad>>>>

  <assign|avg|<macro|1|<wide|<arg|1>|\<bar\>>>>

  <assign|minmod|<macro|minmod>>

  # Others

  <assign|lmn|<math|\<lambda\>\<mu\>\<nu\>>>

  \;

  <assign|uu|<bu>> <assign|bw|<value|uu>>

  <assign|re|<macro|\<bbb-R\>>>

  <assign|im|<macro|\<frak-i\>>>

  <assign|en|<macro|\<bbb-E\>>>

  <assign|thresh|<macro|\<bbb-T\>>>

  <assign|slope|<macro|<with|font-series|bold|\<delta\>>>>

  <assign|uspx|<macro|<bw><rsup|\<ast\>, +x>>>

  <assign|uspmx|<macro|<bw><rsup|\<ast\>, \<pm\>x>>>

  <assign|uspmy|<macro|<bw><rsup|\<ast\>, \<pm\>y>>>

  <assign|uspmxy|<macro|<bw><rsup|\<ast\>, \<pm\><rsub|x\<nocomma\>y>>>>

  <assign|uspy|<macro|<bw><rsup|\<ast\>, +y>>>

  <assign|uspxy|<macro|<bw><rsup|\<ast\>, +x\<nocomma\>y>>>

  <assign|usmx|<macro|<bw><rsup|\<ast\>, -x>>>

  <assign|usmy|<macro|<bw><rsup|\<ast\>, -y>>>

  <assign|unphpx|<macro|<bw><rsup|<nph>, +x>>>

  <assign|unphmx|<macro|<bw><rsup|<nph>, -x>>>

  <assign|unphpmx|<macro|<bw><rsup|<nph>, \<pm\>x>>>

  <assign|unphpmy|<macro|<bw><rsup|<nph>, \<pm\>y>>>

  <assign|unphsx|<macro|<bw><rsup|<nph>, \<ast\>x>>>

  <assign|unphsy|<macro|<bw><rsup|<nph>, \<ast\>y>>>

  <assign|unphpy|<macro|<bw><rsup|<nph>, +y>>>

  <assign|unphmy|<macro|<bw><rsup|<nph>, -y>>>

  <assign|unpxy|<macro|<bw><rsup|n,+x\<nocomma\>y>>>

  <assign|unpx|<macro|<bw><rsup|n, +x>>>

  <assign|unmx|<macro|<bw><rsup|n, -x>>>

  <assign|unpy|<macro|<bw><rsup|n, +y>>>

  <assign|unmy|<macro|<bw><rsup|n, -y>>>

  <assign|unpmx|<macro|<bw><rsup|n, \<pm\>x>>>

  <assign|unpmy|<macro|<bw><rsup|n, \<pm\>y>>>

  <assign|atu|<wide|<value|uu>|\<invbreve\>>>

  <assign|utilow|<value|atu><rsup|low,n+1>>

  <assign|au|<macro|<avg|<value|uu>>>>

  <assign|uU|<with|font-series|bold|U>>

  <assign|ppu|<math|<value|uu>>>

  <assign|rpu|<math|<wide|<value|uu>|^><rsup|\<delta\>>>>

  <assign|tu|<math|<wide|<bu>|~>>>

  <assign|pf|<bof>> <assign|pg|<value|bg>> <assign|ff|<macro|<value|pf>>>

  <assign|fg|<value|pg>>

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

  <assign|polyP|<math|P>>

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

  <assign|uebp|<with|font-series|bold|<value|uu>><rsub|e,<bp>>>

  <assign|uebq|<with|font-series|bold|<value|uu>><rsub|e,<bq>>>

  <assign|uep|<with|font-series|bold|<value|uu>><rsub|e,p>>

  <assign|uepop|<with|font-series|bold|<value|uu>><rsub|e+1,p>>

  <assign|uez|<with|font-series|bold|<value|uu>><rsub|e,0>>

  <assign|uebz|<with|font-series|bold|<value|uu>><rsub|e,<bzero>>>

  <assign|uepoz|<with|font-series|bold|<value|uu>><rsub|e+1,0>>

  <assign|ueN|<with|font-series|bold|<value|uu>><rsub|e,N>>

  <assign|pph|p+<half>>

  <assign|pmh|p-<half>>

  \;

  # Formatting\ 

  <assign|paragraph-toc|<macro|name|>>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>