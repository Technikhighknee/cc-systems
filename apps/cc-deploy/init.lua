-- apps/cc-deploy/init.lua
-- Simple terminal UI for installing systems

local require_mod = require("modules.cc-utils.require")
local deploy = require_mod("modules.ccdeploy")

local root_manifest = require_mod("meta.manifest")

local function choose(options)
  for i, opt in ipairs(options) do
    print(i .. ") " .. opt.id .. " - " .. (opt.description or ""))
  end
  write("Select system: ")
  local idx = tonumber(read())
  if idx then return options[idx] end
end

local function load_manifest(path)
  local modPath = path:gsub("/", "."):gsub("%.lua$", "")
  return require_mod(modPath)
end

local function main()
  local systems = {}
  for _, entry in ipairs(root_manifest.systems or {}) do
    table.insert(systems, load_manifest(entry))
  end

  if #systems == 0 then
    print("No systems available.")
    return
  end

  local choice = choose(systems)
  if not choice then return end

  print("Installing " .. choice.id .. "...")
  deploy.install(choice, "")
  if choice.entry then
    local f = fs.open("startup.lua", "w")
    f.write("shell.run('" .. choice.entry .. "')\n")
    f.close()
    print("Startup updated -> " .. choice.entry)
  end
  print("Done.")
end

main()
