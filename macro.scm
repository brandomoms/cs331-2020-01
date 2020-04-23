#lang scheme
; macro.scm  UNFINISHED
; Glenn G. Chappell
; 2020-04-22
;
; For CS F331 / CSCE A331 Spring 2020
; Code from 4/22 - Scheme: Macros


(display "This file contains sample code from April 22, 2020,")
(newline)
(display "for the topic \"Scheme: Macros\".")
(newline)
(display "It will execute, but it is not intended to do anything")
(newline)
(display "useful. See the source.")
(newline)


; ***** Single-Pattern Macros *****


; Create pattern-based macro with a single pattern using
; define-syntax-rule. USAGE:
;   (define-syntax-rule (PATTERN) TEMPLATE)

; myquote
; Just like quote.
(define-syntax-rule
  (myquote x)     ; pattern
  'x              ; template
  )

; Try:
;   (myquote (+ 1 2))

; myquote2
; Takes two arguments and returns a list containing them unevaluated.
; Example:
;   (myquote2 (+ 1 2) (+ 2 3))
; gives
;   ((+ 1 2) (+ 2 3))
(define-syntax-rule
  (myquote2 x y)
  '(x y)
  )

; qlist
; Takes any number of arguments and returns a list containing them
; unevaluated.
; Example:
;   (qlist (+ 1 2) 7 (+ 2 3))
; gives
;   ((+ 1 2) 7 (+ 2 3))
(define-syntax-rule
  (qlist . args)  ; pattern
  'args           ; template
  )

; Try:
;   (qlist (+ 1 2) 7 (+ 2 3))

; deftwo
; Define two identifiers, setting values equal to given expressions.
(define-syntax-rule
  (deftwo v1 e1 v2 e2)
  (begin
    (define v1 e1)
    (define v2 e2)
    )
  )

; Try:
;   (deftwo a (+ 1 2) b (+ 2 3))
;   a
;   b

; for-loop1  UNFINISHED
; For loop with specified start & end values. proc is called with
; respective values.
(define-syntax-rule
  (for-loop1 (start end) proc)
  (let loop
    (
     [loop-counter start]
     )
    ()
    )
  )

