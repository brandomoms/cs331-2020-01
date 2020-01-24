#!/usr/bin/env lua
-- check_lua.lua
-- Glenn G. Chappell
-- 2020-01-21
--
-- For CS F331 / CSCE A331 Spring 2020
-- A Lua Program to Run
-- Used in Assignment 1, Exercise 1


-- A mysterious table
k = {[=[DH]=],"UXWM",[2*3]='QYFT'..[==[XLUF]==],[2+2]='FUNVO',
     [2+[[3]]]=[=[[]=]..'R'..[====[ZZ]====],[3]=[[VR]]}


-- And a mysterious function
function q(z)
    local f,x,r=74,38,35
    f = f-r - x x = x - r-f r=[===[]===]
    for y = 1,z :len() do
        r = r..string.char(string.byte(z,y)-(x%9))
        f, x = x, f+x
    end
    return r
end


-- Formatted output using the function and the table entries
io.write("Here is the secret message:\n\n")
io.write(string.format([[%s %]]..[==[s %s %s %]==]..'s %s\n',
         q(k[1]),q(k[2]),q(k[3]),q(k[4]),q(k[5]),q(k[6])))

-- Wait for user
io.write("\nPress ENTER to quit ")
io.read("*l")

