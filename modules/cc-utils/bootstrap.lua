-- modules/cc-utils/bootstrap.lua
-- This module provides file system utilities for the cc-utils library.

return function () 
  local ccUtils = context("cc-utils")
  local bootstrap = {}

  function bootstrap.autoUpdateStartup(starScriptUrl, targetFile)
    local ACTUAL_FILE = "startup.lua"
    local FILE_URL = ccUtils.net.joinUrl(config.BASE_URL, "start.lua")
  
    local tempContent = ccUtils.net.fetch(FILE_URL)
  
    if not fs.exists(ACTUAL_FILE) then
      ccUtils.fs.writeToFile(ACTUAL_FILE, tempContent)
      return true -- reboot needed
    end
    
    local actualFile = fs.open(ACTUAL_FILE, "r")
    local actualContent = actualFile.readAll()
    actualFile.close()

    if tempContent ~= actualContent then
      fs.delete(ACTUAL_FILE)
      ccUtils.fs.writeToFile(ACTUAL_FILE, tempContent)

      return true -- reboot needed
    end
    return false -- no reboot needed
  end
  return bootstrap
end