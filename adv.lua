#!/usr/bin/env lua
-- adv.lua
-- Glenn G. Chappell
-- 2020-02-03
--
-- For CS F331 / CSCE A331 Spring 2020
-- Code from 2/3 - Lua: Advanced Flow


io.write("This file contains sample code from February 3, 2020,\n")
io.write("for the topic \"Lua: Advanced Flow\".\n")
io.write("It will execute, but it is not intended to do anything\n")
io.write("useful. See the source.\n")


-- ***** Coroutines *****


io.write("\n*** Coroutines:\n")

-- Here is a coroutine: a function that can temporarily give up control
-- ("yield"), and then be resumed again.

-- small_fibos1
-- Yield Fibonacci numbers less than given limit.
function small_fibos1(limit)
    local curr_fibo, next_fibo = 0, 1
    while curr_fibo < limit do
        coroutine.yield(curr_fibo)  -- yield value; resumable afterwards
        curr_fibo, next_fibo = next_fibo, curr_fibo+next_fibo
    end
end

-- Use the above coroutine
io.write("Small Fibonacci numbers, using a coroutine\n")

-- Get the coroutine wrapper function
cw = coroutine.wrap(small_fibos1)

-- Attempt to get value from coroutine; argument passed to small_fibos1
f = cw(2000)

while f ~= nil do  -- While coroutine has not returned
    -- Do something with our value
    io.write(f .. "  ")

    -- Attempt to get another value from coroutine
    f = cw()
end
io.write("\n")


-- ***** Custom Iterators *****


io.write("\n*** Custom Iterators:\n")

-- You can make your own iterators for use with the for-in control
-- structure.

-- The following code:
--
--   for u, v1, v2 in XYZ do
--       FOR_LOOP_BODY
--   end
--
-- is translated to:
--
--   local iter, state, u = XYZ
--   local v1, v2
--   while true do
--       u, v1, v2 = iter(state, u)
--       if u == nil then
--           break
--       end
--       FOR_LOOP_BODY
--   end
--
-- Above, "v1, v2" can be replaced with an arbitrary number of
-- variables, or with no variables at all.

-- Here is an example (with the same result as the above coroutine
-- example):

-- small_fibos2
-- Allows for-in iteration through Fibonacci numbers less than n.
function small_fibos2(limit)
    local curr_fibo, next_fibo = 0, 1

    function iter(dummy1, dummy2)
        if curr_fibo >= limit then
            return nil  -- End iteration
        end
        local save_curr = curr_fibo
        curr_fibo, next_fibo = next_fibo, curr_fibo+next_fibo
        return save_curr
    end

    return iter, nil, nil
end

-- Use the above iterator
io.write("Small Fibonacci numbers, using a custom iterator\n")
for f in small_fibos2(2000) do
    io.write(f .. "  ")
end
io.write("\n")


io.write("\n")
io.write("This file contains sample code from February 3, 2020,\n")
io.write("for the topic \"Lua: Advanced Flow\".\n")
io.write("It will execute, but it is not intended to do anything\n")
io.write("useful. See the source.\n")

-- Wait for user
io.write("\nPress ENTER to quit ")
io.read("*l")

