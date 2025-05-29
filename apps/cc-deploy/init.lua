-- apps/cc-deploy/init.lua
-- Terminal interface for installing systems

return function(mod_context)
  local context = mod_context or _G.context

  local function load_manifest(path)
    local h = fs.open(path, "r")
    if not h then error("missing manifest: " .. path) end
    local data = h.readAll()
    h.close()
    return assert(load(data, "@" .. path))()
  end

  local function choose(options)
    local hui = context._use("cc-hui")
    return hui.choose(options, "Select system: ")
  end

  local function init()
    local hui = context._use("cc-hui")
    local installer = context["cc-deploy"].install
    local registry = context["cc-deploy"].registry

    hui.init()
    hui.clear()
    hui.print("CC Deploy - System Installer")

    local root = load_manifest("meta/manifest.lua")
    local systems = {}
    for _, entry in ipairs(root.systems or {}) do
      table.insert(systems, load_manifest(entry))
    end
    table.insert(systems, {id = "exit", label = "Exit"})

    local choice = choose(systems)
    if not choice or choice.id == "exit" then return end

    hui.print("Installing " .. choice.id .. "...")
    installer.install(choice, "")
    if choice.entry then
      local f = fs.open("startup.lua", "w")
      f.write("shell.run('" .. choice.entry .. "')\n")
      f.close()
      hui.print("Startup updated -> " .. choice.entry)
    end
    registry.record(choice.id, choice.version or "0")
    hui.print("Done.")
    hui.waitForInput("Press any key to reboot...")
    os.reboot()
  end

  return init
end

