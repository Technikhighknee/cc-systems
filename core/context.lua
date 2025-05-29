-- context.lua
_G.context = _G.context or {}

context._ROOT = ''
context._loadedFiles = {}

context._loadFile = function (path, name) 
  if not path:match("%.lua$") then
    path = path .. ".lua"
  end

  local fullPath = context._ROOT .. path
  print("Loading file: " .. fullPath)

  -- Statt loadfile:
  local file = fs.open(fullPath, "r")
  assert(file, "File does not exist: " .. fullPath)
  local content = file.readAll()
  file.close()

  local chunk = assert(load(content, "@" .. fullPath, "t", _G), "Failed to load Lua file: " .. fullPath)
  local mod = chunk()

  table.insert(context._loadedFiles, {
    name = name,
    path = path
  })

  if name then
    context[name] = mod
  end

  return mod
end

-- load a single module and store under a key
context._load = function(name, path)
  local module = context._loadFile(path, name)
  print(type(module), "loaded as", name)

  if type(context[name]) == "table" then
    for k, v in pairs(module) do
      context[name][k] = v
    end
  else
    context[name] = module
  end
end


-- helper function to load files recursively
local function loadRecursive(relativeDir)
  local result = {}

  local fullDir = context._ROOT .. relativeDir

  for _, file in ipairs(fs.list(fullDir)) do
    local relativePath = relativeDir .. "/" .. file
    local fullPath = context._ROOT .. relativePath
  
    if fs.isDir(fullPath) then
      result[file] = loadRecursive(relativePath)
  
    elseif file == "init.lua" then
      local mod = context._loadFile(relativePath)
      result["init"] = mod
  
    elseif file:match("%.lua$") then
      local name = file:gsub("%.lua$", "")
      result[name] = context._loadFile(relativePath)
    end
  end

  return result
end


context._registerModule = function (directory, key)
  local M = loadRecursive(directory)
  context[key] = M
  return M
end


context._startApp = function (name)
  local init = context[name].init
  assert(type(init) == "function", "Application '" .. name .. "' not found or not runnable")
  init()
end

context._use = function (key)
  local m = context[key]
  return m.init or m
end


return context
