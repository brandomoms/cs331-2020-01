\ detail.fs
\ Glenn G. Chappell
\ 2020-04-01
\
\ For CS F331 / CSCE A331 Spring 2020
\ Code from 4/1 - Forth: Details


cr cr
." This file contains sample code from April 1, 2020," cr
." for the topic 'Forth: Details'." cr
." It will execute, but it is not intended to do anything" cr
." useful. See the source." cr



\ ***** The Dictionary *****


\ marker: creates a word whose execution removes its own and all later
\ definitions from the dictionary. It is traditional to begin such words
\ with "-".

\ Try:
\   : f 1 ;
\   marker -x
\   : f 2 ;
\   f .
\   -x
\   f .


\ ***** Floating Point *****


\ sqrtsout
\ Prints header, then numbers 1 .. max and their decimal square roots.
: sqrtsout  { max-val -- }
  cr
  ." n     sqrt(n)"
  cr
  1e     \ Counter ("n") on the FP stack; when we use this we do fdup
  max-val 1 + 1 ?do
    fdup f.        \ Print our number ("n")
    ."    "
    fdup fsqrt f.  \ Print square root of "n"
    cr
    1e f+
  loop
  fdrop  \ Done with counter on FP stack ("n")
;

\ Try:
\   10 sqrtsout

