-- cc-systems/start.lua
-- Entry point: bootstraps cc-deploy and installs everything

local BASE = "https://raw.githubusercontent.com/Technikhighknee/cc-systems/refs/heads/main/"
local FILES = {
  "apps/cc-deploy/meta/release/latest.lua",
}

-- Check if the directory 'cc-systems' exists; if not, create it
if not fs.exists("cc-systems") then
  fs.makeDir("cc-systems")
end

-- Change the current working directory to 'cc-systems'
shell.setDir("cc-systems")

-- Download and run the latest release script
for _, path in ipairs(FILES) do
  local url = BASE .. path
  local target = "start-install.lua"  -- oder smarter extrahieren
  print("Downloading: " .. url)
  shell.run("wget", url, target)
  shell.run(target)
end
