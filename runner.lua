local stack = {}
local stackPointer = 1

local parse

local function prntAscii()
  print( string.char(stack[stackPointer]) )
end

local function prnt()
  print( stack[stackPointer] )
end

local function incrementStack()
  stackPointer = math.min(stackPointer + 1, 1000000)
  return stackPointer
end

local function decrementStack()
  stackPointer = math.max(stackPointer - 1, 0)
  return stackPointer
end

local function increment()
  stack[stackPointer] = stack[stackPointer] + 1
end

local function decrement()
  stack[stackPointer] = stack[stackPointer] - 1
end

local function equals(number)
  if stack[stackPointer] == number then
    return true
  end
end

local function loop(loop)
  if loop.conditional then
    if loop.conditional.type == "equals" then
      local shouldBreak = false
      while not shouldBreak do
        parse(loop.children)
        for i,v in pairs(loop.conditional.breaks) do
          shouldBreak = equals(v)
          if shouldBreak then break end
        end
      end
    end
  else -- Unbreaking loops here
    while true do
      if parse(loop.children) == true then break end
    end
  end
end

local function conditional(conditional)
  if conditional.condition == "equals" then

  end
end

parse = function(parsedInput)
  for i,v in ipairs(parsedInput) do
    if v.type == "loop" then
      loop(v)
    elseif v.type == "conditional" then
      conditional(v)
    elseif v.type == "incrementStack" then
      incrementStack()
    elseif v.type == "decrementStack" then
      decrementStack()
    elseif v.type == "increment" then
      increment()
    elseif v.type == "decrement" then
      decrement()
    elseif v.type == "print" then
      prnt()
    elseif v.type == "printAscii" then
      prntAscii()
    elseif v.type == "break" then
      return true
    elseif v.type == "return" then
      return stack[stackPointer]
    end
  end
end

return parse
