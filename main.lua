--[[
tokenizer:
  takes input and turns it into tokens and code blocks

parser:
  takes tokens and parses them into expressions

runner:
  takes parsed tokens and runs them

Usage:
run(parse(tokenize(INPUT)))

]]--

--[[
Specification:
  ( / ) = while loop
  [ / ] = conditional
  + = increment number at stack pointer
  - = decrement number at stack pointer
  # = return number at stack pointer
  | = print number at stack pointer
  " = print number at stack pointer as ascii
  : = equals
  ! = not equals
  { = less
  } = greater
  = = Then (Conditional only)
  ; = break loop/terminate program (if not in loop)
  > = increment stack pointer
  < = decrement stack pointer

]]

local run = require"runner"
local parse = require"parser"
local tokenize = require"tokenizer"

if arg[1] then
  local f = assert(io.open(arg[1], "rb"))
  local input = f:read("*all")
  f:close()
  local tokens = tokenize(input)
  local parsed = parse(tokens)
  local result = run(parsed)
else
  local input
  while true do
    io.flush()
    io.write"> "
    input = io.read()
    local tokens = tokenize(input)
    local parsed = parse(tokens)
    local result = run(parsed)
  end
end
