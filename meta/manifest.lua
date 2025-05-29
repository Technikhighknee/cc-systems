-- cc-systems/meta/manifest.lua

return {
  version = "0.2.0",

  core = {
    "core/context.lua",
    "modules/cc-utils/fs.lua",
    "modules/cc-utils/net.lua",
    "modules/cc-utils/manifest.lua",
    "modules/cc-utils/init.lua",
    "modules/cc-utils/meta/manifest.lua",
  },

  modules = {
    "modules/cc-utils/meta/manifest.lua",
    "modules/cc-hui/meta/manifest.lua",
  },

  systems = {
    "apps/cc-deploy/meta/manifest.lua",
  }
}
