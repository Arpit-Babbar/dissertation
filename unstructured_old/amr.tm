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

  <section*|How Trixi does AMR>

  <center|<with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1cm|<tuple|0.5gw|0.370012gh>>|gr-geometry|<tuple|geometry|0.386682par|0.186672par|center>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-arrow-end|\<gtr\>|<graphics||<cline|<point|-2|1>|<point|0.0|1.0>|<point|0.0|-1.0>|<point|-2.0|-1.0>>|<cline|<point|0|1>|<point|2.0|1.0>|<point|2.0|-1.0>|<point|0.0|-1.0>>|<line|<point|0|0>|<point|2.0|0.0>>|<line|<point|1|1>|<point|1.0|-1.0>>|<with|line-width|2ln|color|red|<line|<point|0|1>|<point|0.0|-1.0>>>|<with|arrow-end|\<gtr\>|<line|<point|-1.7|1.4>|<point|-0.2|0.3>>>|<text-at|<with|color|red|Mortar>|<point|-2.5|1.5>>>>>

  We assume that the refinement level between elements only differs by
  <math|2>. Interfaces where neighbours have different refinement levels are
  called <with|font-series|bold|mortars>. For these non-conformal meshes,
  understanding AMR simply requires us to understand how to compute the
  numerical flux at the mortars. We explain that for the FR scheme.

  The idea is that we will compute the numerical flux
  <with|font-series|bold|in the smaller elements> and
  <with|font-series|bold|project<math|<rsup|\<ast\>>> it back to the larger
  elements.>

  <subsection*|Prolongation to mortars>

  We <math|u<rsub|e+<frac|1|2>><rsup|+>> and
  <math|u<rsub|e+<frac|1|2>><rsup|->>. The
  <math|u<rsub|e+<frac|1|2>><rsup|+>> is directly available from the smaller
  elements. For getting <math|u<rsub|e+<frac|1|2>><rsup|->> on the solution
  points of smaller elements, we just <with|font-series|bold|interpolate>.

  <subsection*|Calculation of mortar flux>

  The numerical flux <math|<around*|{|<wide|f|^><rsub|e+<frac|1|2>,upper><rsup|j>|}><rsub|j>,<around*|{|<wide|f|^><rsub|e+<frac|1|2>,lower><rsup|j>|}><rsub|j>>
  for <with|font-series|bold|both> the smaller elements is calculated
  directly because we have all the values. Then, we project each of these
  fluxes to the larger elements individually and then take their average. For
  curved meshes, the average will be weighted.\ 

  This approach, called <with|font-series|bold|Mortar Element Method (MEM)>
  was mentioned in the FR AMR paper <cite|Hao2022> which cited
  <cite|Zhang2015> for details.

  <\remark>
    <math|<rsup|\<ast\>>>For mapping numerical flux from smaller cells to
    larger, <verbatim|Trixi.jl> does the following operations -\ 

    <center|Convert GLL to GL values <math|\<rightarrow\>> Project to the
    large cell <math|\<rightarrow\>> Convert from GL to GLL>

    They say they do it so that the projection has some errors.
  </remark>

  <\question>
    Is the scheme still free stream preserving?
  </question>

  <\question>
    Is this scheme conservative?
  </question>

  \;

  <\bibliography|bib|tm-plain|references>
    <\bib-list|2>
      <bibitem*|1><label|bib-Hao2022>Hao Fu, Jian Xia<localize|, and
      >Xiuqiang Ma. <newblock>Shock capturing with the high-order flux
      reconstruction method on adaptive meshes based on p4est.
      <newblock><with|font-shape|italic|Engineering Reports>, 4(10):0,
      2022.<newblock>

      <bibitem*|2><label|bib-Zhang2015>Bin Zhang<localize| and >Chunlei
      Liang. <newblock>A simple, efficient, and high-order accurate curved
      sliding-mesh interface approach to spectral difference method on
      coupled rotating and stationary domains.
      <newblock><with|font-shape|italic|Journal of Computational Physics>,
      295:147\U160, 2015.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|?|1>>
    <associate|auto-3|<tuple|?|1>>
    <associate|auto-4|<tuple|2|3>>
    <associate|bib-Hao2022|<tuple|1|3>>
    <associate|bib-Zhang2015|<tuple|2|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Hao2022

      Zhang2015
    </associate>
    <\associate|toc>
      How Trixi does AMR <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>

      <with|par-left|<quote|1tab>|Prolongation to mortars
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|Calculation of mortar flux
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>