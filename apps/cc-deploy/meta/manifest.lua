-- apps/cc-deploy/meta/manifest.lua
return {
  id = "cc-deploy",
  type = "app",
  version = "0.2.0",
  description = "Installer for cc-systems",
  entry = "apps/cc-deploy/init.lua",
  files = {
    "apps/cc-deploy/init.lua",
    "apps/cc-deploy/meta/manifest.lua",
    "modules/ccdeploy/init.lua",
    "modules/ccdeploy/install.lua",
    "modules/ccdeploy/registry.lua",
    "modules/ccdeploy/recursive.lua",
    "modules/cc-utils/require.lua"
  }
}
