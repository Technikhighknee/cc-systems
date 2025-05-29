-- context.lua
local context = {}

context._load = function (name, path)
  local mod = dofile(path)
  if type(mod) == "function" then
    context[name] = mod(context)
  else
    context[name] = mod
  end
end

-- load core modules
context._load("hui", "modules/cc-hui/ui.lua")
context._load("registry", "apps/cc-deploy/registry.lua")
context._load("install", "apps/cc-deploy/install.lua")
context._load("recursive", "apps/cc-deploy/recursive.lua")
context._load("root_manifest", "meta/manifest.lua")

-- load app
context._app = function (path)
  return dofile(path)(context)
end

return context
