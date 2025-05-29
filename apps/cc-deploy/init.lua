-- apps/cc-deploy/init.lua
-- Terminal interface for installing systems

return function ()
  local ccUtils = context["cc-utils"]
  local barrelFactory = ccUtils.factories.barrel

  local M = ccUtils.factories.barrel({
    name = "cc-deploy",
    path = context._ROOT .. "apps/cc-deploy/",
    entry = path .. "app.lua",
    methods = {  }
  })
 end
end