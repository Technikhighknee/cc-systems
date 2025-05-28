-- apps/cc-deploy/init.lua
-- Simple terminal UI for installing systems

local require_mod = dofile("cc-systems/modules/cc-utils/require.lua")
local hui = require_mod("modules.cc-hui.ui")
local deploy = require_mod("apps.cc-deploy.install")

hui.init()

local root_manifest = dofile("cc-systems/meta/manifest.lua")

local function choose(options)
  return hui.choose(options, "Select system: ")
end

local function load_manifest(path)
  local modPath = path:gsub("/", "."):gsub("%.lua$", "")
  return require_mod(modPath)
end

local function main()
  hui.clear()
  local systems = {}
  for _, entry in ipairs(root_manifest.systems or {}) do
    table.insert(systems, load_manifest(entry))
  end

  if #systems == 0 then
    hui.print("No systems available.")
    return
  end

  local choice = choose(systems)
  if not choice then return end

  hui.print("Installing " .. choice.id .. "...")
  deploy.install(choice, "")
  if choice.entry then
    local f = fs.open("startup.lua", "w")
    f.write("shell.run('" .. choice.entry .. "')\n")
    f.close()
    hui.print("Startup updated -> " .. choice.entry)
  end
  hui.print("Done.")
end

main()
