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

local input = ">++++++++++++++++++++++++++++++++++++++++++++++++++<(+|>-|<)" --">++++<(++++|>-|[#}>#=;]<<)|"
print"Tokenizing..."
local tokens = tokenize(input)
print"Parsing..."
local parsed = parse(tokens)
print"Running..."
local result = run(parsed)
