#!/usr/bin/env lua
-- runtime_error.lua
-- Glenn G. Chappell
-- 2020-01-27
--
-- For CS F331 / CSCE A331 Spring 2020
-- Demonstrate Lua Runtime Type Errors


-- checkval
-- Given a value, which should be a number, determine whether it is too
-- big, and print a message giving the result.
function checkval(val)
    io.write("Checking value: "..val.."\n")

    -- If val is not of type "number", then a type error is flagged on
    -- the next line.
    if val > 7 then
        io.write("Value is too big!\n")
    else
        io.write("Value is okay\n")
    end
end


-- Main program
-- Check some values using function checkval
io.write("Examples of Runtime Type Errors\n\n")

val1 = 4
checkval(val1)
io.write("\n")

val2 = 10
checkval(val2)
io.write("\n")

val3 = "abc"  -- Not a number!
checkval(val3)
io.write("\n")

val4 = -7
checkval(val4)
io.write("\n")

val5 = "xyz"  -- Not a number!
checkval(val5)
io.write("\n")

-- Wait for user
io.write("\nPress ENTER to quit ")
io.read("*l")

