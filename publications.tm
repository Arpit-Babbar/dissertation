<TeXmacs|2.1.1>

<project|main.tm>

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

  <chapter*|List of publications>

  <\enumerate>
    <item>Arpit Babbar, Sudarshan Kumar Kenettinkara, Praveen Chandrashekar
    (2022)<nbsp><cite|babbar2022>: Lax-Wendroff flux reconstruction method
    for hyperbolic conservation laws, Journal of Computational Physics Volume
    467, 15 October 2022, 11142. <hlink|https://doi.org/10.1016/j.jcp.2022.111423|https://doi.org/10.1016/j.jcp.2022.111423>,
    <hlink|https://arxiv.org/abs/2207.02954|https://arxiv.org/abs/2207.02954>

    <item>Arpit Babbar, Sudarshan<nbsp>Kumar Kenettinkara<localize|, and
    >Praveen Chandrashekar<nbsp><cite|babbar2023admissibility>.
    <newblock>Admissibility preserving subcell limiter for lax-wendroff flux
    reconstruction, <with|font-shape|italic|Journal of Scientific Computing>,
    Volume 99, 2024. <hlink|https://doi.org/10.1007/s10915-024-02482-9|https://doi.org/10.1007/s10915-024-02482-9>,
    <hlink|https://doi.org/10.48550/arXiv.2305.10781|https://doi.org/10.48550/arXiv.2305.10781>

    <item>Arpit Babbar, Praveen Chandrashekar
    (2024)<nbsp><cite|babbar2024curved>: Lax-Wendroff Flux Reconstruction on
    adaptive curvilinear meshes with error based time stepping for hyperbolic
    conservation laws. <hlink|https://arxiv.org/abs/2402.11926|https://arxiv.org/abs/2402.11926>

    <item>Arpit Babbar, Praveen Chandrashekar
    (2024)<nbsp><cite|babbar2024equivalence>: \ Equivalence of ADER and
    Lax-Wendroff in DG / FR framework for linear problems,
    <hlink|https://arxiv.org/abs/2402.18937|https://arxiv.org/abs/2402.18937>

    <item>Arpit Babbar, Praveen Chandrashekar
    (2024)<nbsp><cite|babbar2024generalized>: Generalized framework for
    admissibility preserving Lax-Wendroff Flux Reconstruction for hyperbolic
    conservation laws with source terms. <hlink|https://arxiv.org/abs/2402.01442|https://arxiv.org/abs/2402.01442>

    <item>Arpit Babbar, Praveen Chandrashekar
    (2024)<nbsp><cite|babbar2024laxwendroff>: Lax-Wendroff Flux
    Reconstruction for advection-diffusion equations with error-based time
    stepping. <hlink|https://arxiv.org/abs/2402.12669|https://arxiv.org/abs/2402.12669>

    <item>Arpit Babbar, Praveen Chandrashekar
    (2024)<nbsp><cite|babbar2024multiderivative>: Multi-Derivative
    Runge-Kutta Flux Reconstruction for hyperbolic conservation laws.
    <hlink|https://arxiv.org/abs/2403.02141|https://arxiv.org/abs/2403.02141>
  </enumerate>
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|0>
    <associate|font|roman>
    <associate|font-base-size|12>
    <associate|font-family|rm>
    <associate|math-font|roman>
    <associate|page-even|1in>
    <associate|page-first|3>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-right|auto>
    <associate|page-screen-margin|false>
    <associate|page-width-margin|false>
    <associate|par-width|180mm>
    <associate|section-nr|0>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      babbar2022

      babbar2023admissibility

      babbar2024curved

      babbar2024equivalence

      babbar2024generalized

      babbar2024laxwendroff

      babbar2024multiderivative
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|font-shape|<quote|small-caps>|List
      of publications> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>