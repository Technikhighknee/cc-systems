-- -- modules/ccdeploy/recursive.lua
-- -- Helpers for nested manifests

-- local M = {}

-- function M.collect(manifest, list)
--   list = list or {}
--   table.insert(list, manifest)
--   if manifest.dependencies then
--     for _, dep in ipairs(manifest.dependencies) do
--       local dm = require(dep)
--       M.collect(dm, list)
--     end
--   end
--   return list
-- end

-- return M

-- THIS FILE IS NO LONGER NEEDED; ALL FUNCTIONS WILL LIVE IN apps/cc-deploy