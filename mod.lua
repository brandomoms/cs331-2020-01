#!/usr/bin/env lua
-- mod.lua
-- Glenn G. Chappell
-- 2020-01-29
--
-- For CS F331 / CSCE A331 Spring 2020
-- Code from 1/29 - Lua: Modules
-- Requires mymodule.lua


io.write("This file contains sample code from January 29, 2020,\n")
io.write("for the topic \"Lua: Modules\".\n")
io.write("It will execute, but it is not intended to do anything\n")
io.write("useful. See the source.\n")


-- ***** Modules *****


io.write("\n*** Modules:\n")

-- A Lua *module* is a package -- the kind of thing we would make a
-- header-file/source-file combination for in C++.

-- Import ("require" in Lua-speak) a module.
mymodule = require "mymodule"

-- Use a function from it.
arg = 5            -- To be passed to mymodule.square_plus_one
result = mymodule.square_plus_one(arg)
io.write("Here is mymodule.square_plus_one("..arg.."): "..result.."\n")
io.write("\n")

-- Use another function from it.
msg = "Hi there"   -- To be printed in a fancy way
mymodule.print_with_stars(msg)

-- See file mymodule.lua for the module itself.


io.write("\n")
io.write("This file contains sample code from January 29, 2020,\n")
io.write("for the topic \"Lua: Modules\".\n")
io.write("It will execute, but it is not intended to do anything\n")
io.write("useful. See the source.\n")

-- Wait for user
io.write("\nPress ENTER to quit ")
io.read("*l")

