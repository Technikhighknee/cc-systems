-- File: systems/cc-deploy/meta/manifest.lua

return {
  id = "cc-deploy",
  type = "tool",

  -- Reminder: bump version manually whenever system behavior changes.
  -- This is part of the release ritual defined in AGENTS.RITUALS.md.
  version = "0.1.0",

  title = "Modular Installer",
  description = [[
    Provides install and update logic for modular ComputerCraft systems.
    This tool acts as the first entry point for users who download `start.lua`.
  ]],
  entry = "systems/cc-deploy/init.lua",
  files = {
    "systems/cc-deploy/init.lua",
    "systems/cc-deploy/install.lua",
    "systems/cc-deploy/registry.lua",
    "libraries/cc-utils/require.lua"
  },
  dependencies = {
    "libraries/cc-utils"
  }
}
