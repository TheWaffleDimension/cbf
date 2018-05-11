local Tokens = {}
local Input = ""
local Pos = 1

local tokenizeLoop, tokenizeConditional, tokenize

local function getNextChar()
  return Input:sub(Pos, Pos)
end

tokenizeLoop = function()
  local endLoop = false
  local c = getNextChar()

  local loop = {}
  loop.type = "loop"
  loop.children = {}

  while Pos <= Input:len() and not endLoop do
    Pos = Pos + 1
    local c = getNextChar()
    if c == "]" then
      endLoop = true
    else
      local token = tokenize(c)
      table.insert(loop.children, token)
    end
  end

  return loop
end

tokenizeConditional = function()
  local state = "left"
  local c = getNextChar()

  local conditional = {}
  conditional.type = "conditional"
  conditional.left = {}
  conditional.right = {}
  conditional.action = {}

  while Pos <= Input:len() and not state == "end" do
    local c = getNextChar()
    if c == ")" then
      state = "end"
    elseif c == ":" then
      state = "right"
      conditional.condition = "equals"
    elseif c == "!" then
      state = "right"
      conditional.condition = "not"
    elseif c == "{" then
      state = "right"
      conditional.condition = "less"
    elseif c == "}" then
      state = "right"
      conditional.condition = "greater"
    elseif c == "=" then
      state = action
    else
      local token = tokenize(c)
      if state == "left" then
        table.insert(conditional.left, token)
      elseif state == "right" then
        table.insert(conditional.right, token)
      elseif state == "action" then
        table.insert(conditional.action, token)
      end
    end

    Pos = Pos + 1
  end

  return conditional
end

local function generateToken(type)
  local t = {}
  t.type = type
  t.pos = Pos

  return t
end

tokenize = function(c)
  if c == "+" then
    return generateToken("increment")
  elseif c == "-" then
    return generateToken("decrement")
  elseif c == ">" then
    return generateToken("incrementStack")
  elseif c == "<" then
    return generateToken("decrementStack")
  elseif c == "#" then
    return generateToken("return")
  elseif c == "|" then
    return generateToken("print")
  elseif c == "\"" then
    return generateToken("printAscii")
  elseif c == "(" then
    return tokenizeLoop()
  elseif c == "[" then
    return tokenizeConditional()
  end
end

return function(input)
  Input = input or ""
  local tokens = {}
  Tokens = tokens
  Pos = 1

  while Pos <= Input:len() do
    local c = getNextChar()
    local token = tokenize(c)
    table.insert(Tokens, token)

    Pos = Pos + 1
  end

  return tokens
end
