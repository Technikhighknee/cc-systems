-- start.lua -- bootstrapper for cc-deploy

local BASE = "https://raw.githubusercontent.com/Technikhighknee/cc-systems/main/"
local ROOT = "cc-systems"

local function ensure_dir(path)
  local dir = fs.getDir(path)
  if dir ~= "" and not fs.exists(ROOT .. "/" .. dir) then
    fs.makeDir(ROOT .. "/" .. dir)
  end
end

local function fetch(path)
  local full_path = ROOT .. "/" .. path
  local url = BASE .. path
  if fs.exists(full_path) then fs.delete(full_path) end
  print("Fetching " .. url)
  shell.run("wget", url, full_path)
end

if not fs.exists(ROOT) then
  fs.makeDir(ROOT)
end

-- Fetch and load root manifest
fetch("meta/manifest.lua")
local root_manifest = dofile(ROOT .. "/meta/manifest.lua")

-- Process system manifests
for _, manifest_path in ipairs(root_manifest.systems or {}) do
  fetch(manifest_path)
  print("Processing manifest: " .. manifest_path)
  local manifest = dofile(ROOT .. "/" .. manifest_path)

  for _, file in ipairs(manifest.files or {}) do
    ensure_dir(file)
    fetch(file)
  end
end

-- Run the deploy app
shell.run("lua", ROOT .. "/apps/cc-deploy/init.lua")
