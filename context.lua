-- context.lua
local context = {}

context._load = function (name, path)
  local init = dofile(path)
  context[name] = init(context)
end

-- load core modules


-- load app
context._app = function (path)
  return dofile(path)(context)
end

return context
