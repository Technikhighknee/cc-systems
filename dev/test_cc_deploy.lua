-- dev/test_cc_deploy.lua
-- minimal integration test for cc-deploy

local repo_root = assert(os.getenv("PWD"))
local tmp = "dev/tmp-run"
os.execute("rm -rf " .. tmp)
os.execute("mkdir -p " .. tmp)

local function create_fs(prefix, source_root)
  local fs = {}
  local function ensureDir(path)
    local dir = path:match("(.+)/[^/]+$") or ""
    if dir ~= "" then os.execute("mkdir -p " .. prefix .. "/" .. dir) end
  end
  function fs.combine(a,b)
    if a == "" or not a then return b end
    if a:sub(-1) == "/" then return a .. b end
    return a .. "/" .. b
  end
  function fs.exists(path)
    local f = io.open(source_root .. "/" .. path, "r")
    if f then f:close(); return true end
    f = io.open(prefix .. "/" .. path, "r")
    if f then f:close(); return true end
    return false
  end
  function fs.getDir(path)
    return path:match("(.+)/[^/]+$") or ""
  end
  function fs.makeDir(dir)
    os.execute("mkdir -p " .. prefix .. "/" .. dir)
  end
  local function abs(p)
    if p:sub(1,1) == "/" then return p else return source_root .. "/" .. p end
  end
  local function dir_exists(p)
    local h = io.popen("test -d '" .. p .. "' && echo y")
    local out = h:read("*l")
    h:close()
    return out == 'y'
  end
  function fs.isDir(path)
    if dir_exists(abs(path)) then return true end
    return dir_exists(prefix .. "/" .. path)
  end
  function fs.list(dir)
    local p = io.popen("ls -1 " .. abs(dir) .. " 2>/dev/null")
    local items = {}
    for line in p:lines() do table.insert(items, line) end
    p:close()
    local q = io.popen("ls -1 " .. prefix .. "/" .. dir .. " 2>/dev/null")
    for line in q:lines() do table.insert(items, line) end
    q:close()
    return items
  end
  function fs.open(path, mode)
    local actual
    if mode == "r" then
      if path:sub(1,1) == "/" then
        actual = path
      elseif fs.exists(prefix .. "/" .. path) then
        actual = prefix .. "/" .. path
      else
        actual = source_root .. "/" .. path
      end
    else
      actual = prefix .. "/" .. path
      ensureDir(path)
    end
      local f = assert(io.open(actual, mode))
      return {
        readAll = function()
          local d = f:read("*a")
          if not d then error('failed to read '..actual) end
          return d
        end,
        write = function(data)
          assert(data, 'nil write')
          f:write(data)
        end,
        close = function() f:close() end
      }
  end
  return fs
end

if not textutils then textutils = {} end
if not textutils.serialize then
  function textutils.serialize(t)
    local parts = {}
    for k,v in pairs(t) do
      table.insert(parts, k .. "='" .. tostring(v) .. "'")
    end
    return "{" .. table.concat(parts, ",") .. "}"
  end
end
if not textutils.unserialize then
  function textutils.unserialize(s)
    local f = load("return " .. s)
    if f then return f() else return {} end
  end
end
if not os.epoch then
  function os.epoch() return os.time()*1000 end
end


_G.fs = create_fs(tmp, repo_root)
peripheral = {find=function() return nil end}
term = term or {write=function() end, current=function() return {} end}
function _G.write(txt) io.write(txt or "") end
function _G.read() return "1" end
shell = {run=function() end}
os.reboot = function() end

local context = dofile("context.lua")
context._ROOT = repo_root .. "/"
context.root = repo_root
context._registerModule("modules/cc-hui/", "cc-hui")
context._registerModule("apps/cc-deploy/", "cc-deploy")
context._startApp("cc-deploy")

local manifest = dofile("apps/cc-deploy/meta/manifest.lua")
local list = context["cc-deploy"].recursive.collect(manifest)
assert(#list >= 2, "dependency not collected")

local f = io.open(tmp .. "/startup.lua", "r")
assert(f, "startup.lua not written")
f:close()
os.execute("rm -rf " .. tmp)
print("OK")



