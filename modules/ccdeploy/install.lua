-- modules/ccdeploy/install.lua
-- Basic installer logic

local registry = require("modules.ccdeploy.registry")

local install = {}

local function ensureDir(path)
  local dir = fs.getDir(path)
  if dir ~= "" and not fs.exists(dir) then
    fs.makeDir(dir)
  end
end

local function copy(src, dst)
  local h = fs.open(src, "r")
  if not h then
    error("missing file: " .. src)
  end
  local data = h.readAll()
  h.close()
  ensureDir(dst)
  local out = fs.open(dst, "w")
  out.write(data)
  out.close()
end

function install.install(manifest, root)
  root = root or ""
  for _, file in ipairs(manifest.files or {}) do
    local src = fs.combine(root, file)
    local dst = file
    copy(src, dst)
  end
  registry.record(manifest.id, manifest.version or "0")
end

function install.update(manifest, root)
  install.install(manifest, root)
end

return install
