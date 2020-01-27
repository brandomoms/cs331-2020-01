#!/usr/bin/env lua
-- fibo.lua
-- Glenn G. Chappell
-- 2020-01-27
--
-- For CS F331 / CSCE A331 Spring 2020
-- Compute Fibonacci Numbers


-- The Fibonacci number F(n), for n >= 0, is defined by F(0) = 0,
-- F(1) = 1, and for n >= 2, F(n) = F(n-2) + F(n-1).


-- fibo
-- Given n >= 0, return Fibonacci number F(n).
function fibo(n)
    local curr_fibo, next_fibo = 0, 1

    -- Advance curr_fibo, next_fibo as many times as needed
    for  i = 1, n do
        curr_fibo, next_fibo = next_fibo, curr_fibo + next_fibo
    end

    return curr_fibo
end


-- Main program
-- Print some Fibonacci numbers
how_many_to_print = 20

io.write("Fibonacci Numbers\n")
for i = 0, how_many_to_print-1 do
    io.write("F("..i..") = "..fibo(i).."\n")
end

-- Wait for user
io.write("\nPress ENTER to quit ")
io.read("*l")

