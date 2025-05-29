-- apps/cc-deploy/meta/manifest.lua
return {
  id = "cc-deploy",
  type = "app",
  version = "0.2.3",
  description = "Installer for cc-systems",
  entry = "apps/cc-deploy/init.lua",
  files = {
    "apps/cc-deploy/init.lua",
    "apps/cc-deploy/install.lua",
    "apps/cc-deploy/registry.lua",
    "apps/cc-deploy/recursive.lua",
  },
  dependencies = {
    "modules/cc-hui/meta/manifest.lua",
  }
}
