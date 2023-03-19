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

  <\itemize>
    <item>To a general audience, you will need to begin by giving some
    motivation for why positivity is such a significant thing. Also mention
    that positivity is already known for Runge-Kutta schemes.

    <item>Praveen Sir - Too many details. For example, the details of
    MUSCL-Hancock proof could be totally skipped. You could just say that you
    have an admissibility preserving scheme.

    <item>Praveen Sir - FONT SIZE NEEDS TO BE BIGGER!!
  </itemize>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>