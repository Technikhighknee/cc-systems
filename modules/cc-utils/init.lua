-- modules/cc-utils/init.lua
-- Utility helpers shared across cc-systems

local utils = {}

-- Simple loader that defers to context
function utils.require(path)
  return context._loadFile(path)
end

return function()
  context = _G.context
  return utils
end

