-- modules/cc-utils/fs.lua
-- This module provides file system utilities for the cc-utils library.

return function ()
  local ccUtils = context._use("cc-utils")
  local _fs = {}
  
  function _fs.readFile (path)
    assert(type(path) == "string", "Path must be a string")
    local file = fs.open(path, "r")
    if not file then
      error("Failed to open file for reading: " .. path)
    end
    local content = file.readAll()
    file.close()
    return content
  end

  function _fs.writeToFile(path, content)
    assert(type(path) == "string", "Path must be a string")
    assert(type(content) == "string", "Content must be a string")
    local file = fs.open(path, "w")
    if not file then
      error("Failed to open file for writing: " .. path)
    end
    file.write(content)
    file.close()
  end


  function _fs.ensureParent(path)
    assert(type(path) == "string", "Path must be a string")
    local parent = fs.getDir(path)
    if parent ~= "" and not fs.exists(parent) then
      fs.makeDir(parent)
    end
  end

  function _fs.getAbsolutePath(relative_path)
    assert(type(relative_path) == "string", "Relative path must be a string")
    local root = context._ROOT
    if relative_path:sub(1, #root) == root then
      return relative_path
    else
      return root .. relative_path
    end
  end
 
  function _fs.deleteIfExists(path) 
    if fs.exists(path) then
      fs.delete(path)
    end
  end

  function _fs.deleteIfEmpty(path)
    assert(type(path) == "string", "Path must be a string")
    if fs.getSize(path) == 0 then
      fs.delete(path)
    end
  end

  return _fs
end