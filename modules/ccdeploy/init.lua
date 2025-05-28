-- modules/ccdeploy/init.lua
-- Barrel module exposing installer functions

local install = require("modules.ccdeploy.install")
local registry = require("modules.ccdeploy.registry")

return {
  install = install.install,
  update = install.update,
  registry = registry
}
