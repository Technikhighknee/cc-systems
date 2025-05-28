-- apps/cc-deploy/init.lua
-- Simple terminal UI for installing systems

local require_mod = require("..modules.cc-utils.require")
local deploy = require("deploy")

local monitor
if peripheral and peripheral.find then
  local ok, m = pcall(peripheral.find, "monitor")
  if ok then monitor = m end
end

local function mclear()
  if monitor and monitor.clear then monitor.clear() monitor.setCursorPos(1,1) end
end

local function mprint(text)
  print(text)
  if monitor and monitor.write then
    local x, y = monitor.getCursorPos()
    monitor.write(text)
    monitor.setCursorPos(1, y + 1)
  end
end

local function mwrite(text)
  write(text)
  if monitor and monitor.write then
    monitor.write(text)
  end
end

local root_manifest = require("meta.manifest")

local function choose(options)
  for i, opt in ipairs(options) do
    mprint(i .. ") " .. opt.id .. " - " .. (opt.description or ""))
  end
  mwrite("Select system: ")
  local idx = tonumber(read())
  if monitor then
    local x, y = monitor.getCursorPos()
    monitor.write(tostring(idx))
    monitor.setCursorPos(1, y + 1)
  end
  if idx then return options[idx] end
end

local function load_manifest(path)
  local modPath = path:gsub("/", "."):gsub("%.lua$", "")
  return require_mod(modPath)
end

local function main()
  mclear()
  local systems = {}
  for _, entry in ipairs(root_manifest.systems or {}) do
    table.insert(systems, load_manifest(entry))
  end

  if #systems == 0 then
    mprint("No systems available.")
    return
  end

  local choice = choose(systems)
  if not choice then return end

  mprint("Installing " .. choice.id .. "...")
  deploy.install(choice, "")
  if choice.entry then
    local f = fs.open("startup.lua", "w")
    f.write("shell.run('" .. choice.entry .. "')\n")
    f.close()
    mprint("Startup updated -> " .. choice.entry)
  end
  mprint("Done.")
end

main()
