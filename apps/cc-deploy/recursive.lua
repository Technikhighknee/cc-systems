-- apps/cc-deploy/recursive.lua
-- Helpers for nested manifests

return function(mod_context)
  local context = mod_context or _G.context

  local function load_manifest(path)
    local key = path:gsub("[/%.]", "_")
    if not context[key] then
      if context._load then
        context._load(key, path)
      else
        context[key] = context._loadFile(path, key)
      end
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
