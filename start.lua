-- start.lua -- bootstrapper for cc-deploy

local BASE = "https://raw.githubusercontent.com/Technikhighknee/cc-systems/main/"
local ROOT = "cc-systems"

local function ensure_dir(path)
  local dir = fs.getDir(path)
  if dir ~= "" and not fs.exists(dir) then
    fs.makeDir(dir)
  end
end

local function fetch(path)
  local url = BASE .. path
  if fs.exists(path) then fs.delete(path) end
  print("Fetching " .. url)
  shell.run("wget", url, path)
end

if not fs.exists(ROOT) then
  fs.makeDir(ROOT)
end
shell.setDir(ROOT)

ensure_dir("meta/manifest.lua")
fetch("meta/manifest.lua")
local root_manifest = dofile(ROOT.."/meta/manifest.lua")

for _, manifest_path in ipairs(root_manifest.systems or {}) do
  ensure_dir(manifest_path)
  fetch(manifest_path)
  local manifest = dofile(manifest_path)
  for _, file in ipairs(manifest.files or {}) do
    ensure_dir(file)
    fetch(file)
  end
end

shell.run("apps/cc-deploy/init.lua")
