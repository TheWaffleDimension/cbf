local Tokens = {}
local Input = ""
local Pos = 1

local function getNextChar()
  return Input:sub(Pos, 1)
end

local function parseLoop()

end

local function generateToken(type)
  local t = {}
  t.type = type
  t.pos = Pos
  return t
end

return function(input)
  Input = input or ""
  local tokens = {}
  Tokens = tokens
  Pos = 1

  while pos <= Input:len() do
    local c = getNextChar()
    if c == "+" then
      table.insert(Tokens, generateToken("increment"))
    elseif c == "-" then
      table.insert(Tokens, generateToken("decrement"))
    elseif c == ">" then
      table.insert(Tokens, generateToken("incrementStack"))
    elseif c == "<" then
      table.insert(Tokens, generateToken("decrementStack"))
    elseif c == "#" then
      table.insert(Tokens, generateToken("return"))
    elseif c == "|" then
      table.insert(Tokens, generateToken("print"))
    elseif c == "\"" then
      table.insert(Tokens, generateToken("printAscii"))
    end
  end

  return tokens
end
