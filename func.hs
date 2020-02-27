-- func.hs
-- Glenn G. Chappell
-- 2020-02-24
--
-- For CS F331 / CSCE A331 Spring 2020
-- Code from 2/24 - Haskell: Functions

module Main where

import System.IO  -- for hFlush, stdout


main = do
    putStrLn ""
    putStrLn "This file contains sample code from February 24, 2020,"
    putStrLn "for the topic \"Haskell: Functions\"."
    putStrLn "It will execute, but it is not intended to do anything"
    putStrLn "useful. See the source."
    putStrLn ""
    putStr   "Press ENTER to quit "
    hFlush stdout
    _ <- getLine
    return ()


-- ***** Basic Syntax *****


-- Single-line comment goes from "--" to end-of-line.

{- Multiline comments goes from brace/dash to dash/brace.
END: -}

-- Function definition
addem a b = a+b

-- Try:
--   addem 2 3

-- Function types
-- Try:
--   :t addem

-- Pattern matching
fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n-1) + fibo (n-2)

-- Try:
--   fibo 6

-- Use "where" to introduce a block (indent!) of local definitions

plus_minus_times a b c d = a_plus_b * c_minus_d where
    a_plus_b = a + b
    c_minus_d = c - d

-- Try:
--   plus_minus_times 1 2 3 4
--   a_plus_b
-- Above, the first should work, but the second should result in an
-- error; the definition of a_plus_b is *local*.

-- We can nest blocks

twicefactorial n = twice (factorial n) where
    twice k = two*k where
        two = one + one where
            one = 1
    factorial 0 = 1
    factorial curr = curr * factorial prev where
        prev = curr-1


-- ***** Defining Operators *****


-- Infix operator
a +$+ b = 2*a + b

infixl 6 +$+  -- Left associative, same precedence as +

-- Try:
--   2 +$+ 3
--   2 +$+ 3*5
--   (2 +$+ 3)*5

-- We can use a normal function as an infix operator
-- Try:
--   2 `addem` 3

-- And we can use an operator as a normal function
-- Try:
--   (+$+) 2 3
--   :t (+$+)


-- ***** Currying *****


-- Try:
--   (addem 2) 3

-- Try:
--   addem (2 3)
-- You should get an error.

add2 = addem 2

-- Try:
--   add2 3
--   add2 7
--  :t add2


-- ***** Higher-Order Functions *****


-- We can write functions that toss around functions.

-- rev
-- If f is a 2-argument function, then (rev f) is a 2-argument
--  function that takes its arguments in the opposite order.
rev f a b = f b a

sub a b = a-b
rsub = rev sub

-- Try:
--   sub 7 4
--   sub 4 7
--
--   rsub 7 4
--   rsub 4 7

cat a b = a ++ b  -- String concatentation
rcat = rev cat

-- Try:
--   cat "x" "y"
--   rcat "x" "y"

-- This operation is available in the standard function "flip".


-- ***** Lambda Functions *****


-- Two ways to define a function
square x = x*x

square' = \ x -> x*x  -- \ x -> x*x is an unnamed function
                      --  ("lambda function" or "lambda expression")

-- Try:
--   square' 5
--   (\ x -> x*x) 5

-- The following do the same computation as function addem

addem' a = \ y -> a+y

addem'' = \ x -> (\ y -> x+y)

addem''' = \ x y -> x+y

