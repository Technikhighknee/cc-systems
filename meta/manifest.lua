-- meta/manifest.lua
-- Repository systems listing
return {
  version = "0.1.0",
  core = {
    "context.lua",
  },
  modules = {
    "modules/cc-hui/meta/manifest.lua",
    "modules/cc-utils/meta/manifest.lua",
  },
  systems = {
    "apps/cc-deploy/meta/manifest.lua"
  }
}

-- TODO: Automatically generate this manifest from the actual files in the repository
-- REFACTOR: Discover what a true manifest should look like