-- modules/cc-utils/manifest.lua
-- Load and process manifest files

return function ()
  local ccUtils = context._use("cc-utils")
  local manifest = {}

  --- Load a manifest file from path (returns manifest table)
  function manifest.load(relativePath)
    assert(type(relativePath) == "string", "Path must be a string")
    local fullPath = context._ROOT .. relativePath
    local loadedChunk = assert(loadfile(fullPath, "t", _ENV), "Failed to load manifest: " .. relativePath)
    return loadedChunk()
  end

  --- Download all files referenced in a manifest
  function manifest.process(manifestTable, baseUrl)
    assert(type(manifestTable) == "table", "Manifest must be a table")
    assert(type(baseUrl) == "string", "Base URL must be a string")

    local function downloadFile(relativePath)
      local targetPath = context._ROOT .. relativePath
      local sourceUrl = ccUtils.net.joinUrl(baseUrl, relativePath)
      ccUtils.fs.ensureParent(targetPath)
      ccUtils.net.download(sourceUrl, targetPath)
    end

    -- 1. Download files listed in this manifest
    for _, relativePath in ipairs(manifestTable.files or {}) do
      downloadFile(relativePath)
    end

    -- 2. Download and process module manifests
    for _, manifestPath in ipairs(manifestTable.modules or {}) do
      downloadFile(manifestPath)
      local moduleManifest = manifest.load(manifestPath)
      manifest.process(moduleManifest, baseUrl)
    end

    -- 3. Download and process system manifests
    for _, manifestPath in ipairs(manifestTable.systems or {}) do
      downloadFile(manifestPath)
      local systemManifest = manifest.load(manifestPath)
      manifest.process(systemManifest, baseUrl)
    end
  end

  return manifest
end
