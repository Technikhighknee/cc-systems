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
  local dir = get_absolute_path(path)
  if not fs.exists(dir) then
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

  shell.run("wget", url, output_path)
  
  if not fs.exists(output_path) then
    error("Failed to fetch file: " .. url)
  end
  
  -- load the file if it's a Lua script
  if output_path:sub(-4) == ".lua" then
    local file = fs.open(output_path, "r")
    local content = file.readAll()
    file.close()
    return load(content, "@" .. output_path)()
  else
    return nil
  end
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

  shell.run("wget", FILE_URL, TEMP_FILE)

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


-- initialization
local manifest = fetch_file("meta/manifest.lua")

for _, file in ipairs(manifest.files or {}) do
  local content = fetch_file(file)
end

local context = dofile(ROOT .. "/context.lua")