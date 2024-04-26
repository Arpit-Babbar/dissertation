<TeXmacs|2.1.1>

<project|main.tm>

<style|<tuple|tmbook|style_common|preview-ref>>

<\body>
  <\hide-preamble>
    <assign|cE|<macro|E>>

    <assign|Eoneone|<macro|<math|E><rsub|11>>>

    <assign|Eonetwo|<macro|E<rsub|12>>>

    <assign|Etwotwo|<macro|E<rsub|22>>>

    <assign|vone|<macro|v<rsub|1>>>

    <assign|vtwo|<macro|v<rsub|2>>>

    <assign|ccE|<macro|\<b-E\>>>

    <assign|cT|<macro|<math|T>>>

    <assign|ccT|<macro|\<b-T\>>>

    <assign|cP|<macro|<math|p>>>

    <assign|cR|<macro|p>>

    <assign|ccP|<macro|\<b-p\>>>

    <assign|ccR|<macro|<math|\<b-p\>>>>

    <assign|Poneone|<macro|p<rsub|11>>>

    <assign|Ponetwo|<macro|p<rsub|12>>>

    <assign|Ptwotwo|<macro|p<rsub|22>>>

    <assign|Eoneones|<macro|<math|E><rsub|11\<ast\>>>>

    <assign|Etwotwos|<macro|<math|E><rsub|22\<ast\>>>>

    <assign|Eonetwos|<macro|<math|E><rsub|12\<ast\>>>>

    <assign|Poneones|<macro|<math|p><rsub|11><rsup|\<ast\>>>>

    <assign|Poneonesa|<macro|1|P<rsub|11><rsup|\<ast\><arg|1>>>>

    <assign|Toneonesa|<macro|1|T<rsub|11><rsup|\<ast\><arg|1>>>>

    <assign|Ponetwoss|<macro|<math|p><rsub|12><rsup|\<ast\>\<ast\>>>>

    <assign|ra|<macro|1|\<rho\><rsup|<arg|1>>>>

    <assign|vonea|<macro|1|v<rsub|1><rsup|<arg|1>>>>

    <assign|vtwoa|<macro|1|v<rsub|2><rsup|<arg|1>>>>

    <assign|Eoneonea|<macro|1|<cE><rsub|11><rsup|<arg|1>>>>

    <assign|Eonetwoa|<macro|1|<cE><rsub|12><rsup|<arg|1>>>>

    <assign|Etwotwoa|<macro|1|<cE><rsub|22><rsup|<arg|1>>>>

    <assign|Poneonea|<macro|1|<cP><rsub|11><rsup|<arg|1>>>>

    <assign|Ponetwoa|<macro|1|<cP><rsub|12><rsup|<arg|1>>>>

    <assign|Ptwotwoa|<macro|1|<cP><rsub|22><rsup|<arg|1>>>>

    <assign|Toneonea|<macro|1|<cT><rsub|11><rsup|<arg|1>>>>

    <assign|Tonetwoa|<macro|1|<cT><rsub|12><rsup|<arg|1>>>>

    <assign|Ttwotwoa|<macro|1|<cT><rsub|22><rsup|<arg|1>>>>

    <assign|vtwosa|<macro|1|v<rsub|2><rsup|\<ast\><arg|1>>>>

    <assign|Ponetwosa|<macro|1|<cP><rsub|12><rsup|\<ast\><arg|1>>>>

    <assign|Eoneonesa|<macro|1|<cE><rsub|11><rsup|\<ast\><arg|1>>>>

    <assign|Eonetwosa|<macro|1|<cE><rsub|12><rsup|\<ast\><arg|1>>>>

    <assign|Etwotwosa|<macro|1|<cE><rsub|22><rsup|\<ast\><arg|1>>>>

    <assign|Etwotwossa|<macro|1|<cE><rsub|22><rsup|\<ast\>\<ast\><arg|1>>>>

    <assign|Ptwotwosa|<macro|1|<cP><rsub|22><rsup|\<ast\><arg|1>>>>

    <assign|Tonetwosa|<macro|1|<cT><rsub|12><rsup|\<ast\><arg|1>>>>

    <assign|Ptwotwos|<macro|<math|p><rsub|22\<ast\>>>>

    <assign|Ponetwos|<macro|<math|p><rsub|12\<ast\>>>>

    <assign|vones|<macro|v<rsub|1><rsup|\<ast\>>>>

    <assign|vtwos|<macro|v<rsub|2><rsup|\<ast\>>>>

    <assign|vtwoss|<macro|v<rsub|2><rsup|\<ast\>\<ast\>>>>

    <assign|rs|<macro|\<rho\><rsup|\<ast\>>>>

    <assign|rsa|<macro|1|\<rho\><rsup|\<ast\><arg|1>>>>

    <assign|mones|<macro|m<rsub|1\<ast\>>>>

    <assign|mtwos|<macro|m<rsub|2\<ast\>>>>

    <assign|ueppone|<macro|\<b-u\><rsub|e, p + 1>>>

    <assign|uepmone|<macro|<with|font-series|bold|u><rsub|e,p-1>>>
  </hide-preamble>

  <chapter|Generalized admissibility preservation with source
  terms><label|ch:10mom>

  <section|Introduction>

  In Chapter<nbsp><reference|ch:lw.subcell.limiter>, we developed an
  admissibility preserving subcell based blending scheme for LWFR by
  exploiting the subcell structure to appropriately construct the
  <with|font-shape|italic|blended numerical flux>. In this chapter, we
  develop a <with|font-shape|italic|generalized procedure> to obtain an
  admissibility preserving LWFR scheme that does not depend on a subcell
  based blending limiter. The idea is to perform a cell average decomposition
  like in<nbsp><cite|Zhang2010b> for LWFR and perform flux limiting to
  enforce admissibility in means. The LWFR scheme is extended to apply to
  conservation laws with source terms by performing time averaging of source
  terms. The extension is made provably admissibility preserving by limiting
  the time average source terms. To numerically validate our claims, we test
  LWFR on the Ten Moment equations, which are derived by Levermore et
  al.<nbsp><cite|Levermore_1996> by taking a Gaussian closure of the kinetic
  model.

  The rest of the chapter is organized as follows.
  Section<nbsp><reference|sec:tmp.lwfr> describes the LWFR scheme for
  conservation laws with source terms, and notions of admissibility
  preservation. Section<nbsp><reference|sec:tmp.adm.pres> describes the
  additional limiting required in LW scheme for admissibility preservation,
  i.e., for the time averaged flux<nbsp>(Section<nbsp><reference|sec:tmp.flux.correction>)
  and time averaged sources<nbsp>(Section<nbsp><reference|sec:tmp.source.limiter>).
  Section<nbsp><reference|sec:tmp.numerical.results> shows the numerical
  results for the Ten Moment equations model and summary of the the chapter
  is given in Section<nbsp><reference|sec:tmp.conclusion>.

  <section|LWFR for source terms><label|sec:tmp.lwfr>

  Consider a conservation law of the form

  <\equation>
    <uu><rsub|t>+<ff><rsub|x>=<bss><label|eq:tmp.con.law>
  </equation>

  where <math|<uu>\<in\><re><rsup|p>> is the vector of conserved quantities,
  <math|<ff>=<pf><around|(|<bw>|)>> is the corresponding flux,
  <math|<bss>=<bss><around*|(|<uu>,t,x|)>> is the source term, together with
  some initial and boundary conditions. As in the case of
  <math|<value|bss>=<value|bzero>><nbsp><eqref|eq:con.law>, the solution that
  is physically correct is assumed to belong to an admissibility set
  <math|<Uad>><nbsp><eqref|eq:uad.form>. In case of the Ten Moment
  equations<nbsp><eqref|eq:tmp.tmp>, the density must remain positive and the
  pressure tensor <math|<ccR>> must be positive definite. Following the
  notation of<nbsp><eqref|eq:uad.form>, the <math|K=3> admissibility
  constraints <math|<value|ad><rsub|1>,<value|ad><rsub|2>,<value|ad><rsub|3>>
  are density, <math|Trace<around*|(|<bp>|)>>, <math|det<around*|(|<ccR>|)>>.
  However, although density and trace functions are concave functions of the
  conserved variables, <math|det <around*|(|<ccR>|)>> is not so.

  As in Chapter<nbsp><reference|ch:lwfr>, the LWFR scheme for source terms is
  derived from a Taylor's expansion in time at <math|t=t<rsub|n+1>> around
  <math|t=t<rsub|n>>

  <\equation*>
    <uu><rsup|n+1>=<uu><rsup|n>+<big|sum><rsub|m=1><rsup|N+1><frac|\<Delta\>t<rsup|m>|m!>*\<partial\><rsub|t><rsup|m>*<uu><rsup|n>+O<around|(|\<Delta\>t<rsup|N+2>|)>
  </equation*>

  Since the spatial error is expected to be of
  <math|O<around|(|\<Delta\>x<rsup|N+1>|)>>, we retain terms up to
  <math|O<around|(|\<Delta\>t<rsup|N+1>|)>> in the Taylor expansion, so that
  the overall formal accuracy is of order <math|N+1> in both space and time.
  Using the conservation law with source terms,
  <math|\<partial\><rsub|t>*<uu>=-\<partial\><rsub|x>*<pf>+<bss>><nbsp><eqref|eq:tmp.con.law>,
  we re-write time derivatives of the solution in terms of spatial
  derivatives of the flux and source terms

  <\equation*>
    \<partial\><rsub|t><rsup|m>*<uu>=-<around|(|\<partial\><rsub|t><rsup|m-1>*<pf>|)><rsub|x>+\<partial\><rsub|t><rsup|m-1>*<bss>,<space|2em>m=1,2,\<ldots\>
  </equation*>

  so that

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<uu><rsup|n+1>>|<cell|=>|<cell|<uu><rsup|n>-<big|sum><rsub|m=1><rsup|N+1><frac|\<Delta\>t<rsup|m>|m!>*<around|(|\<partial\><rsub|t><rsup|m-1>*<pf>|)><rsub|x>+<big|sum><rsub|m=1><rsup|N+1><frac|\<Delta\>t<rsup|m>|m!>*\<partial\><rsub|t><rsup|m-1>*<bss>+O<around|(|\<Delta\>t<rsup|N+2>|)>>>|<row|<cell|>|<cell|=>|<cell|<uu><rsup|n>-\<Delta\>t*<pd|<F>|x><around|(|<uu><rsup|n>|)>+\<Delta\>t*<bS><around*|(|<uu><rsup|n>,t<rsup|n>|)>+O<around|(|\<Delta\>t<rsup|N+2>|)>>>>>><label|eq:tmp.lwtay>
  </equation>

  where

  <\eqnarray>
    <tformat|<table|<row|<cell|<F>>|<cell|=>|<cell|<big|sum><rsub|m=0><rsup|N><frac|\<Delta\>t<rsup|m>|<around|(|m+1|)>!>*\<partial\><rsub|t><rsup|m>*<pf>=<pf>+<frac|\<Delta\>t|2>*\<partial\><rsub|t>*<pf>+\<ldots\>+<frac|\<Delta\>t<rsup|N>|<around|(|N+1|)>!>*\<partial\><rsub|t><rsup|N>*<pf><eq-number><label|eq:tmp.tavgflux>>>|<row|<cell|<bS>>|<cell|=>|<cell|<big|sum><rsub|m=0><rsup|N><frac|\<Delta\>t<rsup|m>|<around|(|m+1|)>!>*\<partial\><rsub|t><rsup|m>*<bss>=<bss>+<frac|\<Delta\>t|2>*\<partial\><rsub|t>*<bss>+\<ldots\>+<frac|\<Delta\>t<rsup|N>|<around|(|N+1|)>!>*\<partial\><rsub|t><rsup|N>*<bss><eq-number><label|eq:tmp.tavgS>>>>>
  </eqnarray>

  Note that <math|<F><around|(|<uu><rsup|n>|)>,<bS><around|(|<uu><rsup|n>,t<rsup|n>|)>>
  are approximations to the time average flux and source term in the interval
  <math|<around|[|t<rsub|n>,t<rsub|n+1>|]>> since they can be written as

  <\eqnarray>
    <tformat|<table|<row|<cell|<F><around|(|<uu><rsup|n>|)>>|<cell|=>|<cell|<frac|1|\<Delta\>t>*<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><around*|[|<pf><around|(|<uu><rsup|n>|)>+\<ldots\>+<frac|<around|(|t-t<rsub|n>|)><rsup|N>|N!>*\<partial\><rsub|t><rsup|N>*<pf><around|(|<uu><rsup|n>|)>|]>*<ud>t<eq-number><label|eq:tmp.tvgproperty>>>|<row|<cell|<bS><around|(|<uu><rsup|n>,t<rsup|n>|)>>|<cell|=>|<cell|<frac|1|\<Delta\>t>*<big|int><rsub|t<rsub|n>><rsup|t<rsub|n+1>><around*|[|<bss><around|(|<uu><rsup|n>,t<rsup|n>|)>+\<ldots\>+<frac|<around|(|t-t<rsub|n>|)><rsup|N>|N!>*\<partial\><rsub|t><rsup|N>*<bss><around|(|<uu><rsup|n>,t<rsup|n>|)>|]>*<ud>t<eq-number><label|eq:tmp.tvgproperty.S>>>>>
  </eqnarray>

  where the quantity inside the square brackets is the truncated Taylor
  expansion of the flux <math|<pf>> or source <math|<bss>> in time. Following
  equation<nbsp><eqref|eq:tmp.lwtay> we need to specify the construction of
  the time averaged flux<nbsp><eqref|eq:tmp.tavgflux> and the time averaged
  source terms<nbsp><eqref|eq:tmp.tavgS>. The first step of
  approximating<nbsp><eqref|eq:tmp.lwtay> is the predictor step where a
  locally degree <math|N> approximation <math|<F><rsup|\<delta\>>> of the
  time averaged flux is computed by the approximate Lax-Wendroff procedure
  (Section<nbsp><reference|sec:alw>). Then, as in the standard RKFR scheme,
  we perform the Flux Reconstruction procedure on <math|<F><rsup|\<delta\>>>
  to construct a locally degree <math|N+1> and globally continuous flux
  approximation <math|<F><rsub|h><around|(|\<xi\>|)>>. The time average
  source <math|<bS>> will also be approximated locally as a degree <math|N>
  polynomial using the approximate Lax-Wendroff procedure and denoted with a
  single notation <math|<bS><rsup|\<delta\>><around|(|\<xi\>|)>> since it
  needs no correction. The scheme for local approximation is discussed in
  Section<nbsp><reference|sec:tmp.approximate.lw>. After computing
  <math|<F><rsub|h>,<bS><rsup|\<delta\>>>, truncating
  equation<nbsp><eqref|eq:tmp.lwtay>, the solution at the nodes is updated by
  a collocation scheme as follows

  <\equation>
    <uep><rsup|n+1>=<uep><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<od|<F><rsub|h>|\<xi\>><around|(|\<xi\><rsub|p>|)>+\<Delta\>t*<bS><rsup|\<delta\>><around|(|\<xi\><rsub|p>|)>,<space|2em>0\<le\>p\<le\>N<label|eq:tmp.uplwfr>
  </equation>

  This is the single step Lax-Wendroff update scheme for any order of
  accuracy.

  <subsection|Approximate Lax-Wendroff procedure for degree
  <math|N=2>><label|sec:tmp.approximate.lw>

  The approximations of temporal derivatives of <math|<bss>> are made in a
  similar fashion as those of <math|<pf>>
  in<nbsp><cite|Zorio2017|babbar2022>. For example, to obtain second order
  accuracy, <math|\<partial\><rsub|t>*<bss>> can be approximated as

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|\<partial\><rsub|t>*<bss><around*|(|<uu>,<bx>,t|)>>|<cell|\<approx\>>|<cell|<frac|<bss><around*|(|<uu><rsup|n>+\<Delta\>t<uu><rsup|n><rsub|t>,<bx>,t<rsup|n+1>|)>-<bss><around*|(|<uu><rsup|n>-\<Delta\>t<uu><rsub|t><rsup|n>,<bx>,t<rsup|n-1>|)>|2*\<Delta\>t>>>>>>
  </equation*>

  where <math|<uu><rsub|t>=-\<partial\><rsub|x>*<pf>+<bss><around*|(|<uu>,<bx>,t|)>>.
  Denoting <math|<vg><rsup|<around|(|k|)>>> as an approximation for
  <math|\<Delta\>t<rsup|k>*\<partial\><rsub|t><rsup|k>*g>, we explain the
  local flux and source term approximation procedure for degree <math|N=2>

  <\equation*>
    <vF>=<vf>+<frac|1|2>*<vf><rsup|<around|(|1|)>>+<frac|1|6>*<vf><rsup|<around|(|2|)>>,<space|2em><vS>=<vs>+<frac|1|2>*<vs><rsup|<around|(|1|)>>+<frac|1|6>*<vs><rsup|<around|(|2|)>>
  </equation*>

  where

  <\eqnarray*>
    <tformat|<table|<row|<cell|<vu><rsup|<around|(|1|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf>+\<Delta\>t*<vs>>>|<row|<cell|<vf><rsup|<around|(|1|)>>,<vs><rsup|<around|(|1|)>>>|<cell|=>|<cell|<frac|1|2>*<around*|[|<pf><around*|(|<vu>+<vu><rsup|<around|(|1|)>>|)>-<pf><around*|(|<vu>-<vu><rsup|<around|(|1|)>>|)>|]>,<frac|1|2>*<around*|[|<bss><around*|(|<vu>+<vu><rsup|<around|(|1|)>>|)>-<bss><around*|(|<vu>-<vu><rsup|<around|(|1|)>>|)>|]>>>|<row|<cell|<vu><rsup|<around|(|2|)>>>|<cell|=>|<cell|-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<vD><vf><rsup|<around|(|1|)>>+\<Delta\>t*<vs><rsup|<around|(|1|)>>>>|<row|<cell|<vf><rsup|<around|(|2|)>>>|<cell|=>|<cell|<pf><around*|(|<vu>+<vu><rsup|<around|(|1|)>>+<half>*<vu><rsup|<around|(|2|)>>|)>-2*<pf><around|(|<vu>|)>+<pf><around*|(|<vu>-<vu><rsup|<around|(|1|)>>+<half>*<vu><rsup|<around|(|2|)>>|)>>>|<row|<cell|<vs><rsup|<around|(|2|)>>>|<cell|=>|<cell|<bss><around*|(|<vu>+<vu><rsup|<around|(|1|)>>+<half>*<vu><rsup|<around|(|2|)>>|)>-2*<bss><around|(|<vu>|)>+<bss><around*|(|<vu>-<vu><rsup|<around|(|1|)>>+<half>*<vu><rsup|<around|(|2|)>>|)>>>>>
  </eqnarray*>

  The local approximation of the flux <math|<F>> for all degrees and then its
  FR correction using the time numerical flux <math|<F><rsub|<eph>>> is as in
  Chapter<nbsp><reference|ch:lwfr>.

  <subsection|Admissibility preservation>

  As in Chapter<nbsp><reference|ch:lw.subcell.limiter>, the idea is to obtain
  admissibility preservation in means (Definition<nbsp><reference|defn:mean.pres>)
  and then use the scaling limiter of<nbsp><cite|Zhang2010b> to obtain an
  admissibility preserving LWFR scheme (Definition<nbsp><reference|defn:adm.pres>).
  The following conservation property of the LWFR scheme will be crucial in
  the obtaining admissibility preservation in means

  <\equation>
    <label|eq:tmp.fravgup><wide|<bw>|\<bar\>><rsub|e><rsup|n+1>=<au><rsub|e><rsup|n>-<frac|\<Delta\>t|\<Delta\>x<rsub|e>>*<around|(|<F><rsub|<eph>>-<F><rsub|<emh>>|)>+\<Delta\>t<avg|<bS>><rsub|e>
  </equation>

  where <math|<au><rsub|e><rsup|n>> is the cell average of solution,
  <math|<avg|<bS>><rsub|e>\<assign\><big|sum><rsub|p=0><rsup|N>w<rsub|p>*<bS><rsub|e><rsup|\<delta\>><around|(|\<xi\><rsub|p>|)>>
  is the cell average of the source term. As in<nbsp><eqref|eq:upmean>, the
  conservation property<nbsp><eqref|eq:tmp.fravgup> is obtained by
  multiplying<nbsp><eqref|eq:tmp.uplwfr> by the quadrature weights associated
  with the solution points and sum over all the points in the
  <math|e><rsup|th> element. This involves limiting of time average sources
  and fluxes, which is discussed in the subsequent sections.

  <section|Limiting time averages><label|sec:tmp.adm.pres>

  <subsection|Limiting time average flux><label|sec:tmp.flux.correction>

  In this section, we describe the approach to obtain admissibility
  preservation in means property<nbsp><eqref|defn:mean.pres> for the LWFR
  update<nbsp><eqref|eq:tmp.uplwfr> in the case where source term
  <math|<bss>> in<nbsp><eqref|eq:tmp.con.law> is zero. This approach is a
  generalization of Chapter<nbsp><reference|ch:lw.subcell.limiter> in the
  sense that it does not depend on a subcell based blending limiter. We begin
  by following the work of Zhang-Shu<nbsp><cite|Zhang2010b> to define
  <with|font-shape|italic|fictitious finite volume updates>

  <\equation>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<cwith|1|1|2|2|cell-halign|l>|<cwith|3|3|2|2|cell-halign|l>|<cwith|1|1|3|3|cell-halign|l>|<cwith|3|3|3|3|cell-halign|l>|<table|<row|<cell|<atu><rsub|e,0><rsup|n+1>>|<cell|=>|<cell|<uez><rsup|n>-<frac|\<Delta\>t|w<rsub|0>*\<Delta\>x<rsub|e>>*<around|[|<pf><rsub|<half>><rsup|e>-<F><rsub|<emh>><rsup|LW>|]>>>|<row|<cell|<atu><rsub|e,p><rsup|n+1>>|<cell|=>|<cell|<uep><rsup|n>-<frac|\<Delta\>t|w<rsub|p>*\<Delta\>x<rsub|e>>*<around|[|<pf><rsub|<pph>><rsup|e>-<pf><rsub|<pmh>><rsup|e>|]>,<space|2em>1\<le\>p\<le\>N-1>>|<row|<cell|<atu><rsub|e,N><rsup|n+1>>|<cell|=>|<cell|<ueN><rsup|n>-<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|[|<F><rsub|<eph>><rsup|LW>-<pf><rsub|<Nmh>><rsup|e>|]>>>>>><label|eq:tmp.low.order.update>
  </equation>

  where <math|<pf><rsub|<pph>><rsup|e>=<pf><around|(|<uep><rsup|n>,<ueppone><rsup|n>|)>>
  is an admissibility preserving finite volume numerical flux
  (Definition<nbsp><reference|defn:admissible.fvm>). Then, note that

  <\equation>
    <label|eq:tmp.cell.avg.decomp><avg|<uu>><rsub|e><rsup|n+1>=<big|sum><rsub|p=0><rsup|N>w<rsub|p>*<atu><rsub|e,p><rsup|n+1>
  </equation>

  Thus, if we can ensure that <math|<atu><rsub|e,p><rsup|n+1>\<in\><Uad>> for
  all <math|p>, the scheme will be admissibility preserving in
  means<nbsp><eqref|defn:mean.pres>. We do have
  <math|<atu><rsub|e,p><rsup|n+1>\<in\><Uad>> for <math|1\<le\>p\<le\>N-1>
  under appropriate CFL conditions because the finite volume fluxes are
  admissibility preserving<nbsp><eqref|eq:fvm.admissibility>. In order to
  ensure that the updates <math|<atu><rsub|e,0><rsup|n+1>,<atu><rsub|e,N><rsup|n+1>>
  are also admissible, the flux limiting procedure of
  Chapter<nbsp><reference|ch:lw.subcell.limiter> is followed so that the high
  order numerical fluxes <math|<F><rsub|e\<pm\><half>><rsup|LW>> are replaced
  by <with|font-shape|italic|blended numerical fluxes>
  <math|<F><rsub|e\<pm\><half>>>. The procedure is explained here for
  completeness. We define an admissibility preserving lower order flux at the
  interface <math|<eph>>

  <\equation*>
    <pf><rsub|<eph>>=<pf><around|(|<uepoz><rsup|n>,<ueN><rsup|n>|)>
  </equation*>

  Note that, for an RKFR scheme using Gauss-Legendre-Lobatto (GLL) solution
  points, the definition of <math|<atu><rsub|e,N><rsup|n+1>> will use
  <math|<pf><rsub|<eph>>> in place of <math|<F><rsub|<eph>><rsup|LW>> and
  thus admissibility preserving in means property will always be present.
  That is the argument of<nbsp><cite|Zhang2010b> and here we demonstrate that
  the same argument can be applied to LWFR schemes by limiting
  <math|<F><rsub|<eph>><rsup|LW>>. We will explain the procedure for limiting
  <math|<F><rsub|<eph>><rsup|LW>> to obtain <math|<F><rsub|<eph>>>; it will
  be similar in the case of <math|<F><rsub|<emh>>>. Note that we want
  <math|<F><rsub|<eph>>> to be such that the following are admissible

  <\equation>
    <tabular|<tformat|<table|<row|<cell|<atu><rsub|0><rsup|n+1>>|<cell|=>|<cell|<uepoz><rsup|n>-<frac|\<Delta\>t|w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<pf><rsup|e+1><rsub|<half>>-<F><rsub|<eph>>|)>>>|<row|<cell|<atu><rsub|N><rsup|n+1>>|<cell|=>|<cell|<ueN><rsup|n>-<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<F><rsub|<eph>>-<pf><rsup|e><rsub|<Nmh>>|)>>>>>><label|eq:tmp.low.order.tilde.update>
  </equation>

  We will exploit the admissibility preserving property of the finite volume
  fluxes to get

  <\equation>
    <tabular*|<tformat|<cwith|2|2|3|3|cell-halign|l>|<table|<row|<cell|<utilow><rsub|0>>|<cell|=>|<cell|<uepoz><rsup|n>-<frac|\<Delta\>t|w<rsub|0>*\<Delta\>x<rsub|e+1>>*<around|(|<pf><rsup|e+1><rsub|<half>>-<pf><rsub|<eph>>|)>\<in\><Uad>>>|<row|<cell|<utilow><rsub|N>>|<cell|=>|<cell|<ueN><rsup|n>-<frac|\<Delta\>t|w<rsub|N>*\<Delta\>x<rsub|e>>*<around|(|<pf><rsub|<eph>>-<pf><rsup|e><rsub|<Nmh>>|)>\<in\><Uad>>>>>><label|eq:tmp.pure.low.order.tilde.update>
  </equation>

  Thus, to enforce admissibility preservation in means, the flux
  <math|<F><rsub|<eph>><rsup|LW>> can be limited by
  Algorithm<nbsp><reference|alg:flux.limit> by using the initial guess
  <math|<F><rsub|<eph>>\<leftarrow\><F><rsub|<eph>><rsup|LW>> and the
  <math|<utilow><rsub|i>,<atu><rsub|i><rsup|n+1>> defined for <math|i=0,N>
  in<nbsp>(<reference|eq:tmp.low.order.tilde.update>,<nbsp><reference|eq:tmp.pure.low.order.tilde.update>).

  <subsection|Limiting time average sources><label|sec:tmp.source.limiter>

  After the flux limiting performed in Section<nbsp><reference|sec:tmp.flux.correction>,
  we will have an admissibility preserving in means
  scheme<nbsp><eqref|defn:mean.pres> if the source term average
  <math|<avg|<bS>><rsub|e>> in<nbsp><eqref|eq:tmp.fravgup> is zero. In order
  to get an admissibility preserving scheme in the presence of source terms,
  we will make a splitting of the cell average
  update<nbsp><eqref|eq:tmp.fravgup>, which is similar to that
  of<nbsp><cite|meena2017>

  <\equation>
    <au><rsup|n+1><rsub|e>=<frac|1|2>*<around*|(|<au><rsup|n><rsub|e>-<frac|2*\<Delta\>t|\<Delta\>x<rsub|e>>*<around|(|<F><rsub|<eph>>-<F><rsub|<emh>>|)>|)>+<frac|1|2>*<around|(|<au><rsup|n><rsub|e>+2*\<Delta\>t*<avg|<bS><rsup|LW><rsub|e>>|)>=:<au><rsup|<F>><rsub|e>+<au><rsup|<bS><rsup|LW>><rsub|e><label|eq:tmp.F.S.split>
  </equation>

  where <math|<bS><rsup|LW><rsub|e>> denotes the time average source term in
  element <math|e> computed with the approximate Lax-Wendroff procedure in
  Section<nbsp><reference|sec:tmp.approximate.lw>. With the flux limiting
  performed in Section<nbsp><reference|sec:tmp.flux.correction>, we can
  ensure that cell average <math|<wide|<uu>|\<bar\>><rsup|<F>><rsub|e>\<in\><Uad>>
  if twice the standard CFL is assumed<\footnote>
    In the experiments we conducted, the CFL restriction used in
    Chapter<nbsp><reference|ch:lw.subcell.limiter> preserved admissibility
  </footnote>. In order to enforce <math|<au><rsup|<bS>><rsub|e>\<in\><Uad>>,
  <math|<bS><rsup|LW><rsub|e>> will be limited as follows. We will use the
  admissibility of the first order update using the source term

  <\equation*>
    <au><rsup|low,n+1><rsub|e>\<assign\><au><rsup|n><rsub|e>+2*\<Delta\>t*<avg|<bss>><rsub|e>\<in\><Uad>,<space|2em><avg|<bss>><rsub|e>=<big|sum><rsub|p=0><rsup|N>w<rsub|p>*<bss><around|(|<uep>,<bx><rsub|e,p>,t<rsup|n>|)>
  </equation*>

  which will be true under some problem dependent time step restrictions
  (e.g., Theorem 3.3.1 of<nbsp><cite|Meena_Kumar_Chandrashekar_2017>). Then,
  we will find a <math|\<theta\>\<in\><around|[|0,1|]>> so that for
  <math|<bS>=<bS><rsup|\<theta\>>\<assign\>\<theta\>*<bss>+<around|(|1-\<theta\>|)>*<bS><rsup|LW>>,
  we will have <math|<avg|<uu>><rsub|e><rsup|<bS>>\<in\><Uad>>. The
  <math|\<theta\>> can be found by iterating over admissibility constraints
  <math|<value|ad><rsub|k>><nbsp><eqref|eq:uad.form>. For the constraint
  <math|<value|ad><rsub|k>> we can solve an optimization problem as in
  <eqref|eq:optimization.problem> to find the largest <math|\<theta\>>
  satisfying

  <\equation>
    <value|ad><rsub|k><around|(|<au><rsup|n><rsub|e>+2*\<Delta\>t*<bS><rsup|\<theta\>>|)>=<ad><rsub|k><around|(|\<theta\>*<au><rsup|<bS><rsup|LW>><rsub|e>+<around|(|1-\<theta\>|)>*<au><rsup|low,n+1><rsub|e>|)>\<geq\>\<epsilon\><label|eq:general.pk.source>
  </equation>

  where <math|\<epsilon\>> is a tolerance, taken to be
  <math|<frac|1|10>*<ad><rsub|k><around|(|<au><rsup|low,n+1><rsub|e>|)>><nbsp><cite|ramirez2021>
  . We solve<nbsp><eqref|eq:general.pk.source> using a general iterative
  solver that is independent of choice of <math|<value|ad><rsub|k>>
  (Appendix<nbsp><reference|app:scaling.limiter>). If <math|<ad><rsub|k>> is
  a concave function of the conserved variables, as
  in<nbsp><eqref|eq:concave.theta>, we can use the simpler but possibly
  sub-optimal approach of defining

  <\equation>
    \<theta\>=min <around*|(|min<rsub|p=0,N><around*|\||<frac|\<epsilon\><rsub|p>-<ad><rsub|k><around|(|<au><rsup|low,n+1><rsub|e>|)>|<ad><rsub|k><around|(|<au><rsup|<bS><rsup|LW>><rsub|e>|)>-<ad><rsub|k><around|(|<au><rsup|low,n+1><rsub|e>|)>>|\|>,1|)><label|eq:concave.theta.source>
  </equation>

  Thus, a procedure analogous to Algorithm<nbsp><reference|alg:flux.limit> is
  used for limiting source terms, which we write here for completeness

  <\wide-tabular>
    <tformat|<cwith|2|2|1|1|cell-tborder|0ln>|<cwith|1|1|1|1|cell-bborder|0ln>|<cwith|2|2|1|1|cell-bborder|1ln>|<cwith|2|2|1|1|cell-lborder|0ln>|<cwith|2|2|1|1|cell-rborder|0ln>|<cwith|2|2|1|1|cell-halign|c>|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|1|1|1|1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-lborder|0ln>|<cwith|1|1|1|1|cell-rborder|0ln>|<table|<row|<\cell>
          <\algorithm>
            <label|alg:source.limit>Source limiter
          </algorithm>
        </cell>>>>
      </wide-tabular>
    </cell>>|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|2|2|1|1|cell-halign|l>|<table|<row|<\cell>
          <\wide-tabular>
            <tformat|<cwith|1|1|2|2|cell-halign|r>|<table|<row|<\cell>
              <algo-state|<math|<wide|<bS>|\<wide-bar\>><rsub|e>\<leftarrow\><wide|<bS>|\<wide-bar\>><rsub|e><rsup|LW>>>
            </cell>|<\cell>
              <math|\<vartriangleright\>> Initial guess
            </cell>>>>
          </wide-tabular>
        </cell>>|<row|<\cell>
          <with|font-series|bold|for> <math|k=1:K> <with|font-series|bold|do>

          <algo-state|<math|\<epsilon\><rsub|0>\<leftarrow\><frac|1|10>*<ad><rsub|k><around|(|<au><rsup|low,n+1><rsub|e>|)>>>

          <algo-state|<math|Find \<theta\>> by
          solving<nbsp><eqref|eq:general.pk.source> or by
          using<nbsp><eqref|eq:concave.theta.source> if
          <math|<value|ad><rsub|k>> is concave>

          <algo-state|<math|<wide|<bS>|\<wide-bar\>><rsub|e>\<leftarrow\>\<theta\>*<wide|<bss>|\<wide-bar\>><rsub|e>+<around|(|1-\<theta\>|)>*<wide|<bS>|\<wide-bar\>><rsub|e>>>

          <algo-state|<math|<au><rsup|<bS>><rsub|e>\<leftarrow\><au><rsup|n><rsub|e>+2*\<Delta\>t*<avg|<bS><rsub|e>>>>

          <no-indent><with|font-series|bold|end for>
        </cell>>>>
      </wide-tabular>
    </cell>>>>
  </wide-tabular>

  After replacing <math|<bS><rsup|LW>> by <math|<bS>> obtained from
  Algorithm<nbsp><reference|alg:source.limit>
  in<nbsp><eqref|eq:tmp.F.S.split>, we will have
  <math|<au><rsup|<bS>>\<in\><Uad>> and since <math|<F>> has been corrected
  to ensure <math|<au><rsup|<F>><rsub|e>\<in\><Uad>> following
  Section<nbsp><reference|sec:tmp.flux.correction>, we will also have
  <math|<au><rsup|n+1><rsub|e>\<in\><Uad>>. Thus, we have an admissibility
  preserving in means LWFR scheme<nbsp><eqref|defn:mean.pres> even in the
  presence of source terms. Then, the scaling limiter
  of<nbsp><cite|Zhang2010b> (Appendix<nbsp><reference|app:scaling.limiter>)
  will be used to obtain an admissibility preserving scheme.

  <section|Numerical results><label|sec:tmp.numerical.results>

  The numerical tests for admissibility preservation with 2-D Euler's
  equations in Chapter<nbsp><reference|ch:lw.subcell.limiter> were repeated
  with the generalized \ The numerical verification of admissibility
  preserving flux limiter<nbsp>(Section<nbsp><reference|sec:tmp.flux.correction>)
  and admissibility of LWFR with source terms<nbsp>(Section<nbsp><reference|sec:tmp.source.limiter>)
  is made through the Ten Moment equations<nbsp><cite|Levermore_1996> which
  we describe here. Here, the energy tensor is defined by the ideal equation
  of state <math|<ccE>=<frac|1|2>*<ccP>+<frac|1|2>*\<rho\>*<bv>\<otimes\><bv>>
  where <math|\<rho\>> is the density, <math|<bv>> is the velocity vector,
  <math|<ccR>> is the symmetric pressure tensor. Thus, we can define the 2-D
  conservation law with source terms

  <\equation*>
    \<partial\><rsub|t>*<uu>+\<partial\><rsub|x<rsub|1>>*<pf><rsub|1>+\<partial\><rsub|x<rsub|2>>*<pf><rsub|2>=<bss><rsup|x<rsub|1>><around*|(|<uu>|)>+<bss><rsup|x<rsub|2>><around*|(|<uu>|)>
  </equation*>

  where <math|<uu>=<around|(|\<rho\>,\<rho\>*v<rsub|1>,\<rho\>*v<rsub|2>,<cE><rsub|11>,<cE><rsub|12>,<cE><rsub|22>|)>>
  and

  <\equation>
    <pf><rsub|1>=<around*|[|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<rho\>*v<rsub|1>>>|<row|<cell|<cR><rsub|11>+\<rho\>*v<rsub|1><rsup|2>>>|<row|<cell|<cR><rsub|12>+\<rho\>*v<rsub|1>*v<rsub|2>>>|<row|<cell|<around*|(|<cE><rsub|11>+<cR><rsub|11>|)>*v<rsub|1>>>|<row|<cell|<Eonetwo>*v<rsub|1>+<frac|1|2>*<around|(|<cR><rsub|11>*v<rsub|2>+<cR><rsub|12>*v<rsub|1>|)>>>|<row|<cell|<Etwotwo>*v<rsub|1>+<cR><rsub|12>*v<rsub|2>>>>>>|]>,<space|1em><pf><rsub|2>=<around*|[|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|\<rho\>*v<rsub|2>>>|<row|<cell|<cR><rsub|12>+\<rho\>*v<rsub|1>*v<rsub|2>>>|<row|<cell|<cR><rsub|22>+\<rho\>*v<rsub|2><rsup|2>>>|<row|<cell|<cE><rsub|11>*v<rsub|2>+<cR><rsub|12>*v<rsub|1>>>|<row|<cell|<cE><rsub|12>*v<rsub|2>+<frac|1|2>*<around|(|<cR><rsub|12>*v<rsub|2>+<cR><rsub|22>*v<rsub|1>|)>>>|<row|<cell|<around*|(|<cE><rsub|22>+<cR><rsub|22>|)>*v<rsub|2>>>>>>|]><label|eq:tmp.tmp>
  </equation>

  The source terms are given by

  <\equation>
    <label|eq:tmp.tenmom.source><bss><rsup|x<rsub|1>>=<around*|[|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|0>>|<row|<cell|-<frac|1|2>*\<rho\>*\<partial\><rsub|x>*W>>|<row|<cell|0>>|<row|<cell|-<frac|1|2>*\<rho\>*v<rsub|1>*\<partial\><rsub|x>*W>>|<row|<cell|-<frac|1|4>*\<rho\>*v<rsub|2>*\<partial\><rsub|x>*W>>|<row|<cell|0>>>>>|]>,<space|1em><bss><rsup|x<rsub|2>>=<around*|[|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|1|1|cell-rborder|0ln>|<table|<row|<cell|0>>|<row|<cell|0>>|<row|<cell|-<frac|1|2>*\<rho\>*\<partial\><rsub|y>*W>>|<row|<cell|0>>|<row|<cell|-<frac|1|4>*\<rho\>*v<rsub|1>*\<partial\><rsub|y>*W>>|<row|<cell|-<frac|1|2>*\<rho\>*v<rsub|2>*\<partial\><rsub|y>*W>>>>>|]>
  </equation>

  where <math|W<around|(|x,y,t|)>> is a given function, which models electron
  quiver energy in the laser<nbsp><cite|Berthon2015>. These equations are
  relevant in many applications, especially related to plasma
  flows<nbsp>(see<nbsp><cite|Berthon_TMP_2006|Berthon2015> and further
  references in<nbsp><cite|meena2017>), in cases where the
  <with|font-shape|italic|local thermodynamic equilibrium> used to close the
  Euler equations of compressible flows is not valid, and anisotropic nature
  of the pressure needs to be accounted for. The admissibility set is given
  by

  <\equation*>
    <Uad>=<around*|{|<uu>\<in\><re><rsup|6>\|\<rho\><around*|(|<uu>|)>\<gtr\>0,<space|1em><bx><rsup|T>*<ccP><around*|(|<uu>|)>*<bx>\<gtr\>0,<space|1em><bx>\<in\>\<bbb-R\><rsup|2>\<setminus\><around*|{|<bzero>|}>|}>
  </equation*>

  which contains the states <math|<uu>> with positive density and positive
  definite pressure tensor. The positive definiteness of <math|<ccP>> is
  equivalent to that <math|Tr<around*|(|<bp>|)>=<Poneone>+<Ptwotwo>\<gtr\>0>
  and <math|det <ccP>=<Poneone><Ptwotwo>-<Ponetwo><rsup|2>\<gtr\>0>. The
  hyperbolicity of the system without source terms, along with its
  eigenvalues are presented in Lemma 2.0.2
  of<nbsp><cite|Meena_Kumar_Chandrashekar_2017>. The conditions for
  admissibiltiy preservation of the forward Euler method for the source
  terms, which are the basis for the source term limiting described in
  Section<nbsp><reference|sec:tmp.source.limiter>, are in Theorem 3.3.1
  of<nbsp><cite|Meena_Kumar_Chandrashekar_2017>. All distinct numerical
  experiments from<nbsp><cite|Meena_Kumar_Chandrashekar_2017|meena2017|Meena2020>
  were performed and observed to validate the accuracy and robustness of the
  proposed scheme, but only some are shown here. The experiments were
  performed both with the TVB limiter used in<nbsp><cite|babbar2022> and the
  subcell-based blending scheme developed in
  Chapter<nbsp><reference|ch:lw.subcell.limiter>. As seen in
  Chapter<nbsp><reference|ch:lw.subcell.limiter>, the subcell based limiter
  preserves small scale structures well compared to the TVB limiter. The use
  of TVB limiter is only made in this chapter to numerically validate that
  the flux limiting procedure of<nbsp>Section<nbsp><reference|sec:tmp.flux.correction>
  preserves admissibility even without the subcell based bending limiter. The
  results shown are produced with TVB limiter unless specified otherwise.

  The developments made in this chapter have been contributed to the package
  <with|font-family|tt|Tenkai.jl><nbsp><cite|tenkai> developed in
  Chapter<nbsp><reference|ch:lw.subcell.limiter> and the setup files used for
  generating the results in this chapter are available
  in<nbsp><cite|icosahom2023_tmp>.

  <subsection|Convergence test>

  This is a smooth convergence test from<nbsp><cite|Biswas2021> and requires
  no limiter. The domain is taken to be <math|\<Omega\>=<around|[|-0.5,0.5|]>>
  and the potential for source terms<nbsp><eqref|eq:tmp.tenmom.source> is
  <math|W=sin <around|(|2*\<pi\>*<around|(|x-t|)>|)>>. With periodic boundary
  conditions, the exact solution is given by

  <\equation*>
    <tabular*|<tformat|<table|<row|<cell|\<rho\><around|(|x,t|)>=2+sin
    <around|(|2*\<pi\>*<around|(|x-t|)>|)>,<space|1em><vone><around|(|x,t|)>=1,<space|1em><vtwo><around|(|x,t|)>=0>>|<row|<cell|<Poneone>=1.5+<frac|1|8>*<around|[|cos
    <around|(|4*\<pi\>*<around|(|x-t|)>|)>-8*sin
    <around|(|2*\<pi\>*<around|(|x-t|)>|)>|]>,<space|1em><Ponetwo><around|(|x,t|)>=0,<space|1em><Ptwotwo><around|(|x,t|)>=1>>>>>
  </equation*>

  The solutions are computed at <math|t=0.5> and the convergence results for
  variable <math|\<rho\>> and <math|<Poneone>> are shown in
  Figure<nbsp><reference|fig:convergence> where optimal convergence rates are
  seen.

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/ten_moment/convergence/convergence_rho.pdf|0.43par|||>>|<cell|<image|figures/ten_moment/convergence/convergence_p11.pdf|0.43par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:convergence>|<caption-detailed|Error
  convergence analysis of a smooth test with source terms for (a)
  <math|\<rho\>>, (b) <math|<Poneone>> variable|Convergence of ten moment
  problem with sources.>>

  <subsection|Riemann problems>

  Here, we test the scheme on Riemann problems in the absence of source
  terms. The domain is <math|\<Omega\>=<around|[|-0.5,0.5|]>>. The first
  problem is Sod's test

  <\equation*>
    <around|(|\<rho\>,<vone>,<vtwo>,<Poneone>,<Ponetwo>,<Ptwotwo>|)>=<choice|<tformat|<table|<row|<cell|<around|(|1,0,0,2,0.05,0.6|)>,<space|2em>>|<cell|x\<less\>0>>|<row|<cell|<around|(|0.125,0,0,0.2,0.1,0.2|)>,>|<cell|x\<gtr\>0>>>>>
  </equation*>

  The second is a problem from<nbsp><cite|Meena_Kumar_Chandrashekar_2017>
  with two rarefaction waves containing both low-density and low-pressure,
  leading to a near vacuum solution

  <\equation*>
    <around*|(|\<rho\>,v<rsub|1>,v<rsub|2>,<Poneone>,<Ponetwo>,<Ptwotwo>|)>=<choice|<tformat|<table|<row|<cell|<around|(|1,-5,0,2,0,2|)>,<space|2em>>|<cell|x\<less\>0>>|<row|<cell|<around|(|1,5,0,2,0,2|)>,>|<cell|x\<gtr\>0>>>>>
  </equation*>

  The scheme is able to maintain admissibility in the near vacuum test and
  the results for both Riemann problems are shown in
  Figure<nbsp><reference|fig:rp> where convergence is seen under grid
  refinement.

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/ten_moment/sod/density.pdf|0.43par|||>>|<cell|<image|figures/ten_moment/two_rare/density.pdf|0.43par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>>
  <label|fig:rp>|<caption-detailed|Density plots of numerical solutions with
  polynomial degree <math|N=2> for (a) Sod's problem, (b) Two rarefaction
  (near vacuum) problem|Ten moment problem, Sod and two rarefaction tests.>>

  <subsection|Shu-Osher test>

  This is a modified version of the standard Shu-Osher test
  (Section<nbsp><reference|sec:shuosher>), taken from<nbsp><cite|Meena2020>.
  The solution is initialized in domain <math|<around|[|-5,5|]>> in terms of
  primitive variables as

  <\equation*>
    <tabular*|<tformat|<cwith|1|1|1|1|cell-halign|l>|<table|<row|<cell|<around|(|\<rho\>,v<rsub|1>,v<rsub|2>,<Poneone>,<Ponetwo>,<Ptwotwo>|)>>>|<row|<cell|=<choice|<tformat|<table|<row|<cell|<around|(|3.857143,2.699369,0,10.33333,0,10.33333|)>,<space|2em>>|<cell|<text|if
    >x\<le\>-4>>|<row|<cell|<around|(|1+0.2*sin
    <around|(|5*x|)>,0,0,1,0,1|)>,>|<cell|<text|if >x\<gtr\>-4>>>>>>>>>>
  </equation*>

  The simulation is performed with polynomial degree <math|N=4> using 200
  elements and run till time <math|t=1.8> and the results with both blending
  and TVB limiter are shown in Figure<nbsp><reference|fig:shuosher> where, as
  expected, the blending limiter is giving much better resolution of the
  shock and high-frequency wave.<float|float|thb|<big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/ten_moment/shuosher/density.pdf|0.43par|||>>|<cell|<image|figures/ten_moment/shuosher/v1.pdf|0.43par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:shuosher>|<caption-detailed|Numerical
  solution for Shu-Osher problem with polynomial degree <math|N=4> using TVB
  and blending limiter and we show (a) Density, (b) <math|v<rsub|1>>
  profiles. The density plot has an inset plot near the shock which compares
  number of cells smeared across the shock by blending and TVB limiter.|Ten
  moment Shu-Osher problem.>>>

  <subsection|Two rarefactions with source terms>

  The Riemann problem is given by

  <\equation*>
    <around*|(|\<rho\>,v<rsub|1>,v<rsub|2>,<Poneone>,<Ponetwo>,<Ptwotwo>|)>=<choice|<tformat|<table|<row|<cell|<around|(|1,-4,0,9,7,9|)>,<space|2em>>|<cell|x\<less\>0>>|<row|<cell|<around|(|1,4,0,9,7,9|)>,>|<cell|x\<gtr\>0>>>>>
  </equation*>

  with source terms as in<nbsp><eqref|eq:tmp.tenmom.source> with
  <math|W<around*|(|x,y,t|)>=25*exp<around*|(|-200*<around*|(|x-2|)><rsup|2>|)>>.
  We show the numerical solutions with degree <math|N=4> and 500 elements at
  <math|t=0.1> in Figure<nbsp><reference|fig:two.rare.sources> with and
  without the source terms. The solution with source terms has a near vacuum
  state at the centre. Thus, this is a test where low density is caused by
  the presence of source terms verifying that our scheme is able to capture
  admissibility even in the presence of source terms. The positivity limiter
  had to be used to maintain admissibility of the
  solution.<float|float|thb|<big-figure|<wide-tabular|<tformat|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|2|2|cell-halign|c>|<cwith|1|1|1|1|cell-halign|c>|<cwith|1|1|2|2|cell-halign|c>|<table|<row|<\cell>
    <image|figures/ten_moment/two_rare_source/density.pdf|0.43par|||>
  </cell>|<\cell>
    <image|figures/ten_moment/two_rare_source/P12.pdf|0.43par|||>
  </cell>>|<row|<\cell>
    (a)
  </cell>|<\cell>
    (b)
  </cell>>>>><label|fig:two.rare.sources>|<caption-detailed|Two rarefactions
  with source terms using polynomial degree <math|N=4> on a mesh of 500
  element at time <math|t=0.1>, where we show (a) Density Profile, (b)
  <math|P<rsub|12>>|Two rarefactions with source terms>>>

  <subsection|Two dimensional near vacuum test>

  This is a near vacuum test taken from<nbsp><cite|Meena_Kumar_Chandrashekar_2017>,
  and is thus another verification of our admissibility preserving framework.
  The domain is <math|\<Omega\>=<around|[|-1,1|]><rsup|2>> with outflow
  boundary conditions. The initial conditions are

  <\equation*>
    \<rho\>=1,<space|1em><Poneone>=<Ptwotwo>=1,<space|1em><Ponetwo>=0,<space|1em><vone>=8*f<rsub|s><around|(|r|)>*cos
    \<theta\>,<space|1em><vtwo>=8*f<rsub|s><around|(|r|)>*sin \<theta\>
  </equation*>

  where <math|r=<sqrt|x<rsup|2>+y<rsup|2>>>, <math|\<theta\>=arctan
  <around|(|y/x|)>\<in\><around|[|-\<pi\>,\<pi\>|]>> and
  <math|s=0.06*\<Delta\>x> for mesh size <math|\<Delta\>x (=\<Delta\>y)> of
  the uniform mesh. The <math|f<rsub|s><around|(|r|)>> smoothens the velocity
  profile near the origin as <math|\<theta\>> is not defined there

  <\equation*>
    f<rsub|s><around|(|r|)>=<choice|<tformat|<table|<row|<cell|-2<around*|(|<frac|r|s>|)><rsup|3>+3<around*|(|<frac|r|s>|)><rsup|2>,<space|1em>>|<cell|if
    r\<less\>s>>|<row|<cell|1,>|<cell|<text|otherwise>>>>>>
  </equation*>

  The numerical solution computed using polynomial degree <math|N=2> and 100
  elements is shown at the time <math|t=0.02>. The results are shown in
  Figure<nbsp><reference|fig:2d.near.vacuum> and are similar to those seen in
  the literature. Since this is a near vacuum problem, the numerical method
  is not able to maintain admissibility of solution without the positivity
  limiter.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/ten_moment/2d_near_vacuum/density.png|0.31par|||>>|<cell|<image|figures/ten_moment/2d_near_vacuum/density_y0.pdf|0.43par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:2d.near.vacuum>>|<caption-detailed|2-D
  near vacuum test. Density plot of numerical solution with degree <math|N=2>
  on a <math|100<rsup|2>> element mesh (a) Pseudocolor plot (b) Solution cut
  along the line <math|y=0>.|Ten moment 2-D near vacuum test.>>

  <subsection|Uniform plasma state with Gaussian source>

  The initial condition is a uniform plasma state characterized by

  <\equation*>
    \<rho\>=0.1,<space|2em><vone>=<vtwo>=0,<space|2em><Poneone>=<Ptwotwo>=9,<space|2em><Ponetwo>=7
  </equation*>

  in the domain <math|\<Omega\>=<around|[|0,4|]><rsup|2>> with outflow
  boundary conditions and source terms with potential

  <\equation*>
    W<around|(|x,y,t|)>=25*exp <around|(|-200*<around|(|<around|(|x-2|)><rsup|2>+<around|(|y-2|)><rsup|2>|)>|)>
  </equation*>

  Since <math|W> depends on both <math|x> and <math|y> variable, the uniform
  state will be affected an-isotropically. The simulation is run till
  <math|t=0.1> and the density profile is shown in
  Figure<nbsp><reference|fig:gauss.source> with degree <math|N=2> on a
  <math|200\<times\>200> mesh. In Figure<nbsp><reference|fig:gauss.source>,
  we show the line plot across the diagonal.

  <big-figure|<with|par-mode|center|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<cwith|1|1|2|2|cell-halign|c>|<cwith|1|1|2|2|cell-valign|c>|<table|<row|<cell|<image|figures/ten_moment/gauss_source/density_contour.png|0.32par|||>>|<cell|<image|figures/ten_moment/gauss_source/density_ymx.pdf|0.5par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>>
  ><label|fig:gauss.source>|<caption-detailed|Uniform plasma state with
  Gaussian source (a) Density pseudocolour plot (b) Line plot across
  <math|x+y=4>.|Uniform plasma with Gaussian source.>>

  <subsection|Realistic simulation>

  Consider the domain <math|\<Omega\>=<around|[|0,100|]><rsup|2>> with
  outflow boundary conditions. The uniform initial condition is taken to be

  <\equation*>
    \<rho\>=0.109885,<space|1em><vone>=<vtwo>=0,<space|1em><Poneone>=<Ptwotwo>=1,<space|1em><Ponetwo>=0
  </equation*>

  with the electron quiver energy <math|W<around|(|x,y,t|)>=exp
  <around|(|-0.01*<around|(|<around|(|x-50|)><rsup|2>+<around|(|y-50|)><rsup|2>|)>|)>>.
  The source term is taken from<nbsp><cite|Berthon2015>, and only has the
  <math|x> component, i.e, <math|<bss><rsup|y><around*|(|<uu>|)>=<bzero>>,
  even though <math|W> continues to depend on <math|x> and <math|y>. An
  additional source corresponding to energy components
  <math|<bss><rsub|E>=<around|(|0,0,0,\<nu\><rsub|T>*\<rho\>*W,0,0|)>> is
  also added where <math|\<nu\><rsub|T>> is an absorption coefficient. Thus,
  the source terms are <math|<bss>=<bss><rsub|x>+<bss><rsub|E>>. The
  simulation is run till <math|t=0.5> on a grid of 100 cells. The blending
  limiter from Chapter<nbsp><reference|ch:lw.subcell.limiter> was used in
  this test as it captured the smooth extrema better. The density plot with a
  cut at <math|y=4> is shown in Figure<nbsp><reference|fig:realistic>.

  <big-figure|<tabular*|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<cwith|1|-1|1|1|cell-lborder|0ln>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|2|2|cell-rborder|0ln>|<cwith|1|-1|1|-1|cell-valign|c>|<table|<row|<cell|<image|figures/ten_moment/realistic/density_nuT1.png|0.33par|||>>|<cell|<image|figures/ten_moment/realistic/density_cut.pdf|0.5par|||>>>|<row|<cell|(a)>|<cell|(b)>>>>><label|fig:realistic>|<caption-detailed|Realistic
  simulation. Density profile computed with degree <math|N=2> on
  <math|100<rsup|2>> element mesh. (a) Pseudocolor color plot (b) Cut at
  <math|y=4> comparing different absorption coefficient
  <math|\<nu\><rsub|T>>.|Ten moment, realistic simulation.>>

  <section|Summary and Conclusions><label|sec:tmp.conclusion>

  A generalized framework was developed for the LWFR scheme. The framework
  can be seen as extension of<nbsp><cite|Zhang2010b> to LWFR. It is a
  generalization of Chapter<nbsp><reference|ch:lw.subcell.limiter> as it is
  independent of the shock capturing scheme used and can, in particular, be
  used without the subcell based limiter. The LWFR scheme was extended to be
  applicable to problems with source terms while maintaining high order
  accuracy. Provable admissibility preservation in presence of source terms
  was also obtained by limiting the time average sources. The claims were
  numerically verified on the Ten Moment problem model where the scheme
  showed high order accuracy and robustness.
</body>

<\initial>
  <\collection>
    <associate|algorithm-indentation|0tab>
    <associate|chapter-nr|5>
    <associate|font-base-size|12>
    <associate|info-flag|detailed>
    <associate|page-even|1in>
    <associate|page-first|135>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|165mm>
    <associate|preamble|false>
    <associate|section-nr|10>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|alg:source.limit|<tuple|6.1|139>>
    <associate|auto-1|<tuple|6|135>>
    <associate|auto-10|<tuple|6.4.1|141>>
    <associate|auto-11|<tuple|6.1|141>>
    <associate|auto-12|<tuple|6.4.2|142>>
    <associate|auto-13|<tuple|6.2|142>>
    <associate|auto-14|<tuple|6.4.3|142>>
    <associate|auto-15|<tuple|6.3|143>>
    <associate|auto-16|<tuple|6.4.4|143>>
    <associate|auto-17|<tuple|6.4|143>>
    <associate|auto-18|<tuple|6.4.5|143>>
    <associate|auto-19|<tuple|6.5|144>>
    <associate|auto-2|<tuple|6.1|135>>
    <associate|auto-20|<tuple|6.4.6|145>>
    <associate|auto-21|<tuple|6.6|145>>
    <associate|auto-22|<tuple|6.4.7|145>>
    <associate|auto-23|<tuple|6.7|146>>
    <associate|auto-24|<tuple|6.5|146>>
    <associate|auto-3|<tuple|6.2|135>>
    <associate|auto-4|<tuple|6.2.1|137>>
    <associate|auto-5|<tuple|6.2.2|137>>
    <associate|auto-6|<tuple|6.3|137>>
    <associate|auto-7|<tuple|6.3.1|137>>
    <associate|auto-8|<tuple|6.3.2|139>>
    <associate|auto-9|<tuple|6.4|140>>
    <associate|ch:10mom|<tuple|6|135>>
    <associate|eq:concave.theta.source|<tuple|6.15|139>>
    <associate|eq:general.pk.source|<tuple|6.14|139>>
    <associate|eq:tmp.F.S.split|<tuple|6.13|139>>
    <associate|eq:tmp.cell.avg.decomp|<tuple|6.10|138>>
    <associate|eq:tmp.con.law|<tuple|6.1|135>>
    <associate|eq:tmp.fravgup|<tuple|6.8|137>>
    <associate|eq:tmp.low.order.tilde.update|<tuple|6.11|138>>
    <associate|eq:tmp.low.order.update|<tuple|6.9|138>>
    <associate|eq:tmp.lwtay|<tuple|6.2|136>>
    <associate|eq:tmp.pure.low.order.tilde.update|<tuple|6.12|138>>
    <associate|eq:tmp.tavgS|<tuple|6.4|136>>
    <associate|eq:tmp.tavgflux|<tuple|6.3|136>>
    <associate|eq:tmp.tenmom.source|<tuple|6.17|140>>
    <associate|eq:tmp.tmp|<tuple|6.16|140>>
    <associate|eq:tmp.tvgproperty|<tuple|6.5|136>>
    <associate|eq:tmp.tvgproperty.S|<tuple|6.6|136>>
    <associate|eq:tmp.uplwfr|<tuple|6.7|136>>
    <associate|fig:2d.near.vacuum|<tuple|6.5|144>>
    <associate|fig:convergence|<tuple|6.1|141>>
    <associate|fig:gauss.source|<tuple|6.6|145>>
    <associate|fig:realistic|<tuple|6.7|146>>
    <associate|fig:rp|<tuple|6.2|142>>
    <associate|fig:shuosher|<tuple|6.3|143>>
    <associate|fig:two.rare.sources|<tuple|6.4|143>>
    <associate|footnote-6.1|<tuple|6.1|139>>
    <associate|footnr-6.1|<tuple|6.1|139>>
    <associate|sec:tmp.adm.pres|<tuple|6.3|137>>
    <associate|sec:tmp.approximate.lw|<tuple|6.2.1|137>>
    <associate|sec:tmp.conclusion|<tuple|6.5|146>>
    <associate|sec:tmp.flux.correction|<tuple|6.3.1|137>>
    <associate|sec:tmp.lwfr|<tuple|6.2|135>>
    <associate|sec:tmp.numerical.results|<tuple|6.4|140>>
    <associate|sec:tmp.source.limiter|<tuple|6.3.2|139>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Zhang2010b

      Levermore_1996

      Zorio2017

      babbar2022

      Zhang2010b

      Zhang2010b

      Zhang2010b

      meena2017

      Meena_Kumar_Chandrashekar_2017

      ramirez2021

      Zhang2010b

      Levermore_1996

      Berthon2015

      Berthon_TMP_2006

      Berthon2015

      meena2017

      Meena_Kumar_Chandrashekar_2017

      Meena_Kumar_Chandrashekar_2017

      Meena_Kumar_Chandrashekar_2017

      meena2017

      Meena2020

      babbar2022

      tenkai

      icosahom2023_tmp

      Biswas2021

      Meena_Kumar_Chandrashekar_2017

      Meena2020

      Meena_Kumar_Chandrashekar_2017

      Berthon2015

      Zhang2010b
    </associate>
    <\associate|figure>
      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.1>|>
        Convergence of ten moment problem with sources.
      </surround>|<pageref|auto-11>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.2>|>
        Ten moment problem, Sod and two rarefaction tests.
      </surround>|<pageref|auto-13>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.3>|>
        Ten moment Shu-Osher problem.
      </surround>|<pageref|auto-15>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.4>|>
        Two rarefactions with source terms
      </surround>|<pageref|auto-17>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.5>|>
        Ten moment 2-D near vacuum test.
      </surround>|<pageref|auto-19>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.6>|>
        Uniform plasma with Gaussian source.
      </surround>|<pageref|auto-21>>

      <tuple|normal|<\surround|<hidden-binding|<tuple>|6.7>|>
        Ten moment, realistic simulation.
      </surround>|<pageref|auto-23>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|6.<space|2spc>Generalized
      admissibility preservation with source terms>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>

      6.1.<space|2spc>Introduction <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      6.2.<space|2spc>LWFR for source terms
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      <with|par-left|<quote|1tab>|6.2.1.<space|2spc>Approximate Lax-Wendroff
      procedure for degree <with|mode|<quote|math>|N=2>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|6.2.2.<space|2spc>Admissibility
      preservation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      6.3.<space|2spc>Limiting time averages
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      <with|par-left|<quote|1tab>|6.3.1.<space|2spc>Limiting time average
      flux <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|6.3.2.<space|2spc>Limiting time average
      sources <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      6.4.<space|2spc>Numerical results <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>

      <with|par-left|<quote|1tab>|6.4.1.<space|2spc>Convergence test
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|6.4.2.<space|2spc>Riemann problems
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|6.4.3.<space|2spc>Shu-Osher test
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|6.4.4.<space|2spc>Two rarefactions with
      source terms <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <with|par-left|<quote|1tab>|6.4.5.<space|2spc>Two dimensional near
      vacuum test <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <with|par-left|<quote|1tab>|6.4.6.<space|2spc>Uniform plasma state with
      Gaussian source <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|1tab>|6.4.7.<space|2spc>Realistic simulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22>>

      6.5.<space|2spc>Summary and Conclusions
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-24>
    </associate>
  </collection>
</auxiliary>