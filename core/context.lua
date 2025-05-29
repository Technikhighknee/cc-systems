-- context.lua - runtime module system for ComputerCraft

_G.context = _G.context or {}

-- root directory for resolving relative paths
context._ROOT = context._ROOT or ''

-- bookkeeping for diagnostics
context._loadedFiles = context._loadedFiles or {}

-- registered modules
context._modules = context._modules or {}

--- Load and execute a Lua file relative to ROOT.
-- Returns whatever value the file provides.
local function loadFile(path)
  if not path:match("%.lua$") then
    path = path .. ".lua"
  end

  local fullPath = context._ROOT .. path
  print("Loading file: " .. fullPath)

  local file = fs.open(fullPath, "r")
  assert(file, "File does not exist: " .. fullPath)
  local content = file.readAll()
  file.close()

  local chunk = assert(load(content, "@" .. fullPath, "t", _G), "Failed to load Lua file: " .. fullPath)
  local mod = chunk()

  table.insert(context._loadedFiles, path)
  return mod
end

context._loadFile = loadFile

--- Register a module directory under a key.
-- Files are loaded on first use via context.use().
function context.registerModule(name, dir)
  assert(type(name) == "string", "module name must be string")
  assert(type(dir) == "string", "module directory must be string")
  dir = dir:gsub("/$", "")

  context._modules[name] = {dir = dir, loaded = false, entry = nil}
  context[name] = context[name] or {}
end

--- Internal: load all Lua files for a module.
local function loadModuleFiles(name)
  local info = context._modules[name]
  assert(info, "Module '" .. name .. "' not registered")
  if info.loaded or info.loading then return end
  info.loading = true

  local base = info.dir
  local fullDir = context._ROOT .. base

  for _, file in ipairs(fs.list(fullDir)) do
    local rel = base .. "/" .. file
    local fullPath = fullDir .. "/" .. file

    if fs.isDir(fullPath) then
      -- ignore sub directories for now

    elseif file:match("%.lua$") then
      local key = file:gsub("%.lua$", "")
      local result = loadFile(rel)
      if type(result) == "function" then
        result = result()
      end

      if key == "init" then
        info.entry = result
      else
        context[name][key] = result
      end
    end
  end

  info.loaded = true
  info.loading = nil
end

--- Load a module and return its table.
function context.use(name)
  loadModuleFiles(name)
  return context[name]
end

--- Execute the entry function of a module if it exists.
function context.runModule(name, ...)
  local mod = context.use(name)
  local info = context._modules[name]
  local entry = info and info.entry
  if type(entry) == "function" then
    return entry(...)
  end
end

-- compatibility wrappers for old API
context._registerModule = context.registerModule
context._startApp = context.runModule
context._use = context.use

return context
