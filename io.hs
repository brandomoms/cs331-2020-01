-- io.hs  UNFINISHED
-- Glenn G. Chappell
-- 2020-02-28
--
-- For CS F331 / CSCE A331 Spring 2020
-- Code from 2/28 - Haskell: I/O

module Main where

import System.IO  -- for hFlush, stdout


main = do
    putStrLn ""
    putStrLn "This file contains sample code from February 28, 2020,"
    putStrLn "for the topic \"Haskell: I/O\"."
    putStrLn "It will execute, but it is not intended to do anything"
    putStrLn "useful. See the source."
    putStrLn ""
    putStr   "Press ENTER to quit "
    hFlush stdout
    _ <- getLine
    return ()


-- ***** String Conversion *****


-- Function "show" converts anything showable (type must be in class
-- Show) to a String.

-- numConcat
-- Returns string containing 2 params separated by blank.
-- So (numConcat 42 7) returns "42 7".
numConcat a b = (show a) ++ " " ++ (show b)

-- Try:
--   numConcat 42 7


-- Function "read" converts a string to anything (type must be in class
-- Read).

-- Try:
--   read "42"
-- Result is error; need to force return type.


stringPlusOne str = 1 + read str

stringToInteger str = asTypeOf (read str) 1

-- Try:
--   stringPlusOne "42"
--   stringToInteger "42"


-- ***** Simple Output *****


-- An I/O action is type of value. We do I/O by returning an I/O action
-- to the outside world.

sayHowdy = putStr "Howdy!"

sayHowdyNewLine = putStrLn "Howdy!"

-- "print x" is same as "putStrLn (show x)"

sayTenNewLine = print (5+5)

-- Use ">>" to join I/O actions together into a single I/O action

sayHowdyAgain = (putStr "Howdy " >> putStrLn "thar!")

sayHowdy2Line = (putStrLn "Howdy" >> putStrLn "thar!")

-- Try:
--   sayHowdy
--   sayHowdyNewLine
--   sayTenNewLine
--   sayHowdyAgain
--   sayHowdy2Line


-- ***** Simple Input *****


-- An I/O action wraps a value. The above I/O actions all wrapped
-- "nothing" values. getLine returns an I/O action that wraps the string
-- that is input.

-- Send the wrapped value to a function with ">>="

getPrint =    getLine >>= putStrLn
getPrint' =   getLine >>= (\ line -> putStrLn line)
getPrintRev = getLine >>= (\ line -> putStrLn (reverse line))

-- The wrapped value cannot be removed from the I/O world, but it can be
-- processed inside it (e.g., the above call to function reverse).

-- Try-:
--   getPrint
--   getPrint'
--   getPrintRev


-- ***** Do-Construction *****


-- The do-construction is simple syntactic sugar around the ">>" and
-- ">>=" operators.

-- reverseIt
-- Input some text from the user, and print something based on it.
reverseIt = do
    putStr "Type some text: "
    hFlush stdout      -- Make sure prompt comes before input
    line <- getLine
    putStrLn ""
    putStrLn ("Line length: " ++ show (length line))
    putStrLn ""
    putStr "Here is your line, backwards: "
    putStrLn (reverse line)

-- Try:
--   reverseIt

-- Note that, inside an I/O do-block, NAME <- IO_ACTION binds NAME to
-- the value wrapped by IO_ACTION.


-- TO BE CONTINUED ...

