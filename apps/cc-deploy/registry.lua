-- apps/cc-deploy/registry.lua
-- Tracks installed systems

local path = "registry.db"

local function load()
  if not fs.exists(path) then
    return {}
  end
  local f = fs.open(path, "r")
  local data = textutils.unserialize(f.readAll()) or {}
  f.close()
  return data
end

local function save(db)
  local f = fs.open(path, "w")
  f.write(textutils.serialize(db))
  f.close()
end

local registry = {}

function registry.record(id, version)
  local db = load()
  db[id] = {version = version, time = os.epoch("utc")}
  save(db)
end

function registry.list()
  return load()
end

return registry
