-- modules/cc-utils/factories.lua
-- This module provides factory methods for creating various utility objects

return function ()
  local ccUtils = context._use("cc-utils")

  local factories = {}

  -- Barrels
  factories.barrel = function (options)
    assert(type(options.name) == "string", "Barrel name must be a string")
    assert(type(options.path) == "string", "Barrel path must be a string")
    assert(type(options.methods) == "table", "Barrel methods must be a table")

    local barrel = {
      name = options.name,
      path = options.path,
      entry = options.entry or options.name,
    }
    for _, method in ipairs(options.methods) do
      barrel[method] = factories.barrel.method(options.name, method)
    end
    return barrel
  end

  function factories.barrel.method(module, methodName)
    return context[module][methodName] or ccUtils.placeholder.METHOD_NOT_IMPLEMENTED
  end

  return factories
end