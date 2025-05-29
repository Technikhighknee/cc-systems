-- modules/cc-utils/net.lua
-- This module provides network utilities for the cc-utils library.

return function () 
  local ccUtils = context("cc-utils")
  local net = {}

  function net.fetch(url)
    assert(type(url) == "string", "URL must be a string")
    
    local response = http.get(url)
    if not response then
      error("Failed to fetch URL: " .. url)
    end
    
    local content = response.readAll()
    response.close()
    
    return content
  end

  function net.download(url, path)
    assert(type(url) == "string", "URL must be a string")
    assert(type(path) == "string", "Path must be a string")
    
    local content = net.fetch(url)
    
    local file = fs.open(path, "w")
    if not file then
      error("Failed to open file for writing: " .. path)
    end
    
    file.write(content)
    file.close()
    
    return true
  end

  function net.joinUrl(base, relative)
    assert(type(base) == "string", "Base URL must be a string")
    assert(type(relative) == "string", "Relative URL must be a string")
    
    if relative:sub(1, 1) == "/" then
      return base .. relative:sub(2)
    else
      return base .. relative
    end
  end

  return net
end