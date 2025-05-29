-- start.lua -- bootstrapper for cc-deploy
-- wget run http://kappaworld.de:14567/cc-systems/start.lua

-- configuration
local URL = "http://kappaworld.de:14567/"
local ROOT = "cc-systems/"

-- helper functions
local function get_absolute_path(relative_path)
  if relative_path:sub(1, #ROOT) == ROOT then
    return relative_path
  else
    return ROOT .. relative_path
  end
end

local function ensure_path_exists(path)
  local dir

  path = get_absolute_path(path)
  dir = fs.getDir(path)
  
  if not fs.exists(dir) then
    print("Creating directory: " .. dir)
    fs.makeDir(dir)
  end
end

local function delete_if_exists(path) 
  if fs.exists(path) then
    fs.delete(path)
  end
end

local function get_full_url(path)
  return URL .. get_absolute_path(path)
end

local function fetch_file(path, output_path)
  local url = get_full_url(path)
  output_path = get_absolute_path(output_path or path)
  
  delete_if_exists(output_path)
  ensure_path_exists(output_path)

  -- shell.run("wget", url, output_path)
  local file = http.get(url)
  if not file then
    error("Failed to fetch file: " .. url)
  end

  local output_file = fs.open(output_path, "w")
  output_file.write(file.readAll())
  output_file.close()
  file.close()
end

local function delete_if_empty(path)
  if fs.getSize(path) == 0 then
    fs.delete(path)
  end
end

local function auto_update_startup_script()
  local TEMP_DIR = "temp/"
  local TEMP_FILE = TEMP_DIR .. "startup.lua"
  local ACTUAL_FILE = "startup.lua"
  local FILE_URL = get_full_url("start.lua")

  ensure_path_exists(TEMP_FILE)

  -- shell.run("wget", FILE_URL, TEMP_FILE)
  local file = http.get(FILE_URL)
  if not file then
    error("Failed to fetch startup script: " .. FILE_URL)
  end
  local temp_file = fs.open(TEMP_FILE, "w")
  temp_file.write(file.readAll())
  temp_file.close()
  file.close()

  if not fs.exists(ACTUAL_FILE) then
    fs.move(TEMP_FILE, ACTUAL_FILE)
    delete_if_empty(TEMP_DIR)
    return true -- reboot needed
  end

  local temp_content = fs.open(TEMP_FILE, "r").readAll()
  local actual_content = fs.open(ACTUAL_FILE, "r").readAll()

  if temp_content ~= actual_content then
    fs.delete(ACTUAL_FILE)
    fs.move(TEMP_FILE, ACTUAL_FILE)
    delete_if_empty(TEMP_DIR)
    return true -- reboot needed
  end

  fs.delete(TEMP_FILE)
  delete_if_empty(TEMP_DIR)
  return false -- no reboot needed
end

if (auto_update_startup_script()) then
  os.reboot()
end

function load_manifest(path)
  local file = fs.open(get_absolute_path(path), "r")
  if not file then
    error("Failed to open manifest file: " .. path)
  end
  local content = file.readAll() -- lua table
  file.close()

  return load(content, "@" .. path)()
end


-- initialization
local manifest_path = get_absolute_path("meta/manifest.lua")
fetch_file(manifest_path)
local manifest = load_manifest(manifest_path)

-- download every core file
for _, file in ipairs(manifest.core) do
  local full_path = get_absolute_path(file)
  ensure_path_exists(full_path)
  fetch_file(full_path)
end

-- go through the systems and download every file
for _, manifest_file in ipairs(manifest.systems or {}) do
  fetch_file(manifest_file)
  local manifest = load_manifest(manifest_file)
  if type(manifest) ~= "table" or not manifest.id or not manifest.files then
    error("Error in manifest for system: " .. system)
    return
  end

  for _, file in ipairs(manifest.files) do
    local full_path = get_absolute_path(file)
    ensure_path_exists(full_path)
    fetch_file(full_path)
  end
end

for _, manifest_file in ipairs(manifest.modules or {}) do
  fetch_file(manifest_file)
  local manifest = load_manifest(manifest_file)
  if type(manifest) ~= "table" or not manifest.id or not manifest.files then
    error("Error in manifest for module: " .. module)
    return
  end

  for _, file in ipairs(manifest.files) do
    local full_path = get_absolute_path(file)
    ensure_path_exists(full_path)
    fetch_file(full_path)
  end
end

dofile(ROOT .. "/context.lua")
context = _G.context
context._ROOT = ROOT

local modules = {}
table.insert(modules, {
  path = "modules/cc-hui/",
  name = "cc-hui"
})
table.insert(modules, { 
  path = "apps/cc-deploy/",
  name = "cc-deploy"
})

for _, mod in ipairs(modules) do
  local name = mod.name
  local path = mod.path
  context._registerModule(path, name)
end

-- print("Loaded files:")
-- for _, file in ipairs(context._loadedFiles) do
--   print(file.name .. " - " .. file.path)
--   print(context[file.name])
-- end

context._startApp('cc-deploy')
