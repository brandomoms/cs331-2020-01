\ fibo.fs
\ Glenn G. Chappell
\ 2020-03-23
\
\ For CS F331 / CSCE A331 Spring 2020
\ Compute Fibonacci Numbers


\ Note. The following can be done in Forth in a rather prettier, easier-
\ to-understand manner. The code here is written to use only very basic
\ Forth words & constructions.


\ The Fibonacci number F[n], for n >= 0, is defined by F[0] = 0,
\ F[1] = 1, and for n >= 2, F[n] = F[n-2] + F[n-1].


\ advance
\ Given pair of consecutive Fibonacci numbers (F[n], F[n+1]), returns
\ next such pair (F[n+1] F[n+2]).
\ Used by fibo.
: advance  ( a b -- b a+b )
  swap    \ Stack: b a
  over    \ Stack: b a b
  +       \ Stack: b a+b
;


\ fibo
\ Compute F[n]: the nth Fibonacci number.
\ Uses fast iterative algorithm.
\ Gives correct results:
\ - On 32-bit systems, for n = 0 .. 46
\ - On 64-bit systems, for n = 0 .. 92
: fibo  ( n -- F[n] )
  0 1     \ Stack: n 0 1
  rot     \ Stack: 0 1 n
  0 ?do   \ Counted loop: n times
    advance
  loop
          \ Stack: F[n] F[n+1]
  drop    \ Stack: F[n]
;


\ printfibos
\ Print i & Fibonacci number i in a nice format, for i = 0..k, each on a
\ separate line.
: printfibos  ( k -- )
  cr
  1 + 0 ?do   \ Counted loop: k+1 times
    ." F("
    i 1 .r  \ Output loop counter with no trailing blank
    ." ) = "
    i fibo .
    cr
  loop
;


\ Main program
\ Print the first few Fibonacci numbers.
cr
." Fibonacci Numbers"
19  \ k for last F[k] to print
    \ Can be up to 46 on a 32-bit system, 92 on a 64-bit system
printfibos

