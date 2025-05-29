-- modules/cc-utils/init.lua
-- Entry point for the cc-utils module

return function ()
  context["cc-utils"] = {}

  context._load("cc-utils", "modules/cc-utils/fs.lua")
  context._load("cc-utils", "modules/cc-utils/net.lua")
  context._load("cc-utils", "modules/cc-utils/manifest.lua")
  context._load("cc-utils", "modules/cc-utils/factories.lua")
  context._load("cc-utils", "modules/cc-utils/placeholder.lua")
  context._load("cc-utils", "modules/cc-utils/bootstrap.lua")

end
