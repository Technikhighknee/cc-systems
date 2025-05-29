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
  local chunk = assert(loadfile(fullPath), "Failed to load " .. fullPath)
  local mod = chunk()

  if type(mod) == 'function' then
    mod = mod()
  end

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
  local mod = context._loadFile(path, name)
  context[name] = mod
  return mod
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
