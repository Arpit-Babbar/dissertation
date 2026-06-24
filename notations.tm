<TeXmacs|2.1>

<project|main.tm>

<style|<tuple|tmbook|preview-ref|comment|style_common>>

<\body>
  <chapter-unnumbered-title|Notations><blanc-page>

  The following notations are used in this thesis.

  We deal with systems of equations, and denote vectors and matrices by bold
  letters. For example, the solution of the system of equations is usually
  denoted as <math|<value|uu>\<in\><re><rsup|p>> and a matrix as
  <math|<bA>\<in\><re><rsup|p*\<times\>d>> where <math|\<bbb-R\>> is the set
  of real numbers. The set of non-negative real numbers is denoted as
  <math|<re><rsub|+>>. The components of vectors are denoted by subscripts as
  <math|<value|uu>=<around*|(|u<rsub|1>,u<rsub|2>,\<ldots\>,u<rsub|p>|)>>.
  The dyadic/outer product of <math|<ba>\<in\>\<bbb-R\><rsup|p>,<bb>\<in\>\<bbb-R\><rsup|q>>
  is denoted by <math|<around*|(|<ba>\<otimes\><bb>|)><rsub|i\<nocomma\>j>\<assign\><ba><rsub|i>*<bb><rsub|j>>.
  We will also consider quantities like the flux
  <math|<value|pf>=<around*|(|<value|pf><rsub|1>,<value|pf><rsub|2>,\<ldots\>,<value|pf><rsub|d>|)>>,
  where <math|<value|pf><rsub|i>\<in\><re><rsup|p>> is a state vector while
  <math|d> corresponds to the space dimension. Then, for a vector
  <math|<bv>\<in\>\<bbb-R\><rsup|d>>, we define <math|<value|pf>\<cdot\><bv>>
  to the product correponding to spatial dimension
  <math|<value|pf>\<cdot\><bv>=<big|sum><rsub|i=1><rsup|d><value|pf><rsub|i>*v<rsub|i>>.

  For <math|<around*|(|<bx>,t|)>\<in\><re><rsup|d>\<times\>\<bbb-R\><rsub|+>>,
  this work considers scalar functions of the form
  <math|u=u<around*|(|<bx>,t|)>>. The partial derivatives of <math|u> are
  written as <math|\<partial\><rsub|t>*u,\<partial\><rsub|x<rsub|i>>*u>.
  Other notations like <math|\<partial\><rsub|t>*u\<equiv\><pdv|<space|0.2spc>|t>*u\<equiv\>u<rsub|t>>
  are also used. The gradient of a scalar function <math|u> is denoted as
  <math|\<nabla\><rsub|<bx>>*u\<assign\><around*|(|\<partial\><rsub|x<rsub|1>>*u,\<partial\><rsub|x<rsub|2>>*u,\<ldots\>,\<partial\><rsub|x<rsub|d>>*u|)>>
  where the subcript <math|<bx>> is usually omitted. Vector valued functions
  of the form <math|<value|uu><around*|(|<bx>,t|)>\<in\>\<bbb-R\><rsup|p>>
  will also be considered where derivatives will be applied to each component
  <math|u<rsub|i>>. The flux <math|<value|pf>> will be a function of
  <math|<value|uu>\<in\>\<bbb-R\><rsup|p>> and its Jacobian will be denoted
  as <math|<value|pf><rsub|<value|uu>>\<equiv\>\<partial\><rsub|<value|uu>>*<value|pf>=<value|pf><rprime|'>>.
  The divergence of flux <math|<value|pf>=<around*|(|<value|pf><rsub|1>,<value|pf><rsub|2>,\<ldots\>,<value|pf><rsub|d>|)>>
  will be denoted as <math|<value|Div><value|pf>\<assign\>\<partial\><rsub|x<rsub|i>>*<value|pf><rsub|i>>
  where the subscript <math|<bx>> will usually be suppressed.
</body>

<\initial>
  <\collection>
    <associate|font-base-size|12>
    <associate|page-even|1in>
    <associate|page-first|?>
    <associate|page-medium|paper>
    <associate|page-odd|1in>
    <associate|page-right|1in>
    <associate|page-screen-margin|false>
  </collection>
</initial>