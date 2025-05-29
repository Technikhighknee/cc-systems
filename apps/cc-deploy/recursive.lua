-- apps/cc-deploy/recursive.lua
-- Helpers for nested manifests

return function(context)
  local function load_manifest(path)
    local key = path:gsub("[/%.]", "_")
    if not context[key] then
      context._load(key, path)
    end
    return context[key]
  end

  local M = {}

  function M.collect(manifest, list)
    list = list or {}
    table.insert(list, manifest)
    if manifest.dependencies then
      for _, dep in ipairs(manifest.dependencies) do
        local dm = load_manifest(dep)
        M.collect(dm, list)
      end
    end
    return list
  end

  return M
end
