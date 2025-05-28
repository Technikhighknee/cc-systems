-- apps/cc-deploy/recursive.lua
-- Helpers for nested manifests

local require_mod = require("..modules.cc-utils.require")

local M = {}

function M.collect(manifest, list)
  list = list or {}
  table.insert(list, manifest)
  if manifest.dependencies then
    for _, dep in ipairs(manifest.dependencies) do
      local dm = require_mod(dep)
      M.collect(dm, list)
    end
  end
  return list
end

return M
