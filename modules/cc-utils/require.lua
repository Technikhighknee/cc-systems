-- modules/cc-utils/require.lua
-- Simple module loader for cc-systems

local loaded = {}

local function load(name)
  if loaded[name] then
    return loaded[name]
  end
  local path = "cc-systems/" .. name:gsub('%.', '/') .. '.lua'
  if not fs.exists(path) then
    error('module not found: ' .. name)
  end
  local fn, err = loadfile(path)
  if not fn then
    error(err)
  end
  local result = fn()
  loaded[name] = result or true
  return loaded[name]
end

return load
