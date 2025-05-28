-- start.lua -- bootstrapper for cc-deploy

local BASE = "https://raw.githubusercontent.com/Technikhighknee/cc-systems/main/"
local ROOT = "cc-systems"
local FILES = {
  "meta/manifest.lua",
  "apps/cc-deploy/meta/manifest.lua",
  "apps/cc-deploy/init.lua",
  "apps/cc-deploy/install.lua",
  "apps/cc-deploy/registry.lua",
  "apps/cc-deploy/recursive.lua",
  "modules/cc-utils/require.lua",
  "modules/cc-hui/ui.lua",
}

local function ensure_dir(path)
  local dir = fs.getDir(path)
  if dir ~= "" and not fs.exists(dir) then
    fs.makeDir(dir)
  end
end

if not fs.exists(ROOT) then
  fs.makeDir(ROOT)
end
shell.setDir(ROOT)

for _, file in ipairs(FILES) do
  local url = BASE .. file
  ensure_dir(file)
  print("Fetching " .. url)
  if fs.exists(file) then fs.delete(file) end
  shell.run("wget", url, file)
end

shell.run("apps/cc-deploy/init.lua")
