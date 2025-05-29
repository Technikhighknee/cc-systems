-- modules/cc-utils/bootstrap.lua
-- This module provides file system utilities for the cc-utils library.

return function ()
  local ccUtils = context._use("cc-utils")
  local bootstrap = {}

  function bootstrap.autoUpdateStartup(starScriptUrl, targetFile)
    assert(type(starScriptUrl) == "string", "starScriptUrl must be a string")

    local ACTUAL_FILE = targetFile or "startup.lua"
    local FILE_URL = starScriptUrl

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