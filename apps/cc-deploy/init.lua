-- apps/cc-deploy/init.lua
-- Simple terminal UI for installing systems

return function (context)
  return function ()
    local context = context or _G.context

    local hui = context._use("cc-hui")
    local deploy = context["cc-deploy"]

    hui.init()

    local function choose(options)
      return hui.choose(options, "Select system: ")
    end

    -- local function load_manifest(path)
    --   local key = path:gsub("[/%.]", "_")
    --   if not context[key] then
    --     context._load(key, path)
    --   end
    --   return context[key]
    -- end

    local function main()
      hui.clear()
      hui.print("CC Deploy - System Installer")
      local choice = choose({
        {id = "cc-deploy", label = "CC Deploy"},
        {id = "cc-hui", label = "CC Hui"},
        {id = "exit", label = "Exit"}
      })

      -- local systems = {}
      -- for _, entry in ipairs(root_manifest.systems or {}) do
      --   table.insert(systems, load_manifest(entry))
      -- end

      -- if #systems == 0 then
      --   hui.print("No systems available.")
      --   return
      -- end

      -- local choice = choose(systems)
      -- if not choice then return end

      -- hui.print("Installing " .. choice.id .. "...")
      -- deploy.install(choice, "")
      -- if choice.entry then
      --   local f = fs.open("startup.lua", "w")
      --   f.write("shell.run('" .. choice.entry .. "')\n")
      --   f.close()
      --   hui.print("Startup updated -> " .. choice.entry)
      -- end
      -- hui.print("Done.")
      -- hui.waitForInput("Press any key to reboot...")
      -- os.reboot()

      main()
    end
    main()
  end
end

