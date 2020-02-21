-- fibo.hs
-- Glenn G. Chappell
-- 2020-02-21
--
-- For CS F331 / CSCE A331 Spring 2020
-- Compute Fibonacci Numbers

module Main where

import System.IO  -- for hFlush, stdout


-- The Fibonacci number F(n), for n >= 0, is defined by F(0) = 0,
-- F(1) = 1, and for n >= 2, F(n) = F(n-2) + F(n-1).


-- fibopair
-- Given n >= 0, return a pair of Fibonacci numbers: (F(n), F(n+1)).
-- Used by fibo.
fibopair 0 = (0, 1)
fibopair n = (b, a+b) where
    (a, b) = fibopair (n-1)


-- fibo
-- Given n >= 0, return Fibonacci number F(n).
-- Uses fibopair.
fibo n = a where
    (a, b) = fibopair n


-- allfibos
-- List of ALL Fibonacci numbers: [F(0), F(1), F(2), ...].
-- Uses fibo.
allfibos = map fibo [0..]


-- printListWithName
-- Print items in given list, each preceded by "NAME(#) = ", where NAME
-- is the first parameter, and # is an increasing index starting at the
-- second parameter. The third parameter is the list.
--
-- Example usage:
--   printListWithName "Square" 2 [4,9,16]
-- Output:
--   Square(2) = 4
--   Square(3) = 9
--   Square(4) = 16
printListWithName _ _ [] = return ()
printListWithName name i (f:fs) = do
    putStrLn $ name ++ "(" ++ (show i) ++ ") = " ++ (show f)
    printListWithName name (i+1) fs


-- main
-- Print some Fibonacci numbers.
main = do
    putStrLn "Fibonacci Numbers"
    printListWithName "F" 0 (take how_many_to_print allfibos)

    -- Wait for user
    putStrLn ""
    putStr "Press ENTER to quit "
    hFlush stdout  -- Make sure prompt comes before input
    _ <- getLine
    return ()
    where
        how_many_to_print = 20

