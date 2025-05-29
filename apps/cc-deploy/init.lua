-- apps/cc-deploy/init.lua
-- Terminal interface for installing systems

return function ()
  local ccUtils = context["cc-utils"]
  local barrelFactory = ccUtils.factories.barrel

  local path = context._ROOT .. "apps/cc-deploy/"

  local M = barrelFactory({
    name = "cc-deploy",
    path = path,
    entry = path .. "app.lua",
    methods = {  }
  })

  return M
end
