-- Refactored: modules/cc-utils/meta/manifest.lua

return {
  id = "cc-utils",
  type = "module",
  version = "0.1.0",
  description = "Utility helpers for cc-systems",
  entry = "modules/cc-utils/init.lua",
  files = {
    "modules/cc-utils/init.lua",
    "modules/cc-utils/fs.lua",
    "modules/cc-utils/net.lua",
    "modules/cc-utils/manifest.lua",
    "modules/cc-utils/factories.lua",
    "modules/cc-utils/bootstrap.lua",
    "modules/cc-utils/placeholder.lua",
    "modules/cc-utils/meta/manifest.lua"
  },
  dependencies = {}
}
