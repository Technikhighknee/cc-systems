-- modules/cc-utils/placeholder.lua
-- This module provides placeholder values for things that are not yet implemented or available.

return function () 
  local ccUtils = context._use("cc-utils")
  local placeholder = {}

  function placeholder.METHOD_NOT_IMPLEMENTED()
    error("Method not implemented")
  end 
  return placeholder
end