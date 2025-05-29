-- apps/cc-deploy/app.lua
-- Main entry point for the cc-deploy application

return function () 
  local ccUtils = context["cc-utils"]
  local ccDeploy = context["cc-deploy"]
  -- local ccHui = context["cc-hui"]

  local function main () 
    -- ccHui.clear()
    -- we want something like this later, or not
    -- local page = ccHui.page:new({
    --   title = "CC Deploy",
    --   subtitle = "System Installer",
    --   description = "Install and manage ComputerCraft systems.",
    -- })
    -- 
    -- page:showChoices({
    --  choices = ccDeploy.getChoices(),
    --  onChoice = function(choice)
    --    ccDeploy.confirm(choice)
    --  end
    -- })
    -- ccHui.print("Welcome to CC Deploy!")
    -- ccHui.print("This is a placeholder for the main interface.")
    print("Welcome to CC Deploy!")
    print("This is a placeholder for the main interface.")
  end
end