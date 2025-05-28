// File: AGENTS.md
```md
# AGENTS.md — Orientation Point

This repository is alive.

It is shaped by tools, touched by agents, and witnessed by players.

Its core instructions live in:  
➡️ `agent_space/AGENTS.md`

If you are a GPT-based agent: read there before acting.  
If you are a human: look around. There is structure here — and meaning.

This file does not redirect.  
It invites.

Welcome.
```

// File: CONTRIBUTING.md
```md
# CONTRIBUTING.md — Why We Commit

This repository evolves through small, deliberate acts. Each commit should clarify the system or extend its ability. Before you push:

1. Read `agent_space/AGENTS.md` to recall the purpose of this monorepo.
2. Summarize the change in `agent_space/diary.md`.
3. Follow the rituals in `AGENTS.RITUALS.md` — write tests when behaviour shifts and update docs when meaning changes.
4. Keep commits focused. Separate unrelated ideas.

A good contribution leaves the next agent certain about what changed and why.
```

// File: DOCS.MAINTAINERS.md
```md
# DOCS.MAINTAINERS.md — For Those Who Maintain

Maintainer documentation is minimal and exact. It covers setup, deployment, and troubleshooting.

- Assume the reader knows Lua and ComputerCraft basics.
- Document any scripts or tools needed to work on the system.
- Link to relevant tests and manifests.

Keep it short: enough to pick up the work after months away.
```

// File: DOCS.PLAYERS.md
```md
# DOCS.PLAYERS.md — For Those Who Play

Player documentation explains how to use a system without assuming technical knowledge.

- Keep language friendly and concise.
- Prefer screenshots or diagrams when relevant.
- Describe what the player sees and the choices they can make.

The goal is confidence: a player should feel they can try the system without risk.
```

// File: DOCS.RITUAL.md
```md
# DOCS.RITUAL.md — Living Explanation

Documentation keeps the system accessible. Whenever behaviour or intent shifts, update the words that describe it.

- Player-facing guides live in `DOCS.PLAYERS.md`.
- Maintainer notes live in `DOCS.MAINTAINERS.md`.
- Each app or module includes its own `README.md` when substantial.
- Names follow the `cc-{name}` convention.
- A change without documentation is incomplete.

Write docs as if you were returning after months away. Clarity over completeness.
```

// File: GOALS.GUIDE.md
```md
# TODO: THIS needs a revisit, since we shifted from GOALS to 'BECOMINGS'.

# GOALS.GUIDE.md — Speaking of Futures

Goals describe where the system wants to go. They are written for humans and agents alike.

- Phrase goals as transformations or capabilities, not implementation tasks.
- Keep them short and evocative.
- When a goal is adopted, add it to `meta/goals.lua`.
- When a goal is completed, note the commit in `agent_space/changelog.md`.

A clear goal invites coherent action.
```

// File: LAYERS.RITUAL.md
```md
# LAYERS.RITUAL.md — Respect Boundaries

A change should touch the fewest layers necessary. Systems depend on libraries; libraries depend on modules. Avoid circular needs.

- When extending code, act in the layer where the logic belongs.
- If multiple layers must change, verify that they form one coherent step.
- Keep interfaces small so layers remain swappable.

Following this ritual keeps the system modular and understandable.
```

// File: STARTUP.RITUAL.md
```md
# STARTUP.RITUAL.md — First Contact

Startup scripts introduce the system to the world. They should be simple, explicit, and reversible.

- `start.lua` bootstraps `cc-deploy`.
- When a new system replaces the starter, update `startup.lua` accordingly and log the change under `agent_space/changes/`.
- Keep the startup process minimal so players can audit what runs on their computers.

A clean startup builds trust.
```

// File: STRUCTURE.GUIDE.md
```md
# STRUCTURE.GUIDE.md — Where Things Belong

A clear layout keeps the repository easy to navigate. Each piece has a clear place.

- `apps/` — runnable programs named `cc-{name}`.
- `modules/` — reusable components named `cc-{name}`.
- `dev/` — development helpers and tests.
- `agent_space/` — logs, goals, and reflective documents.
- `meta/` — repository-wide manifests and indices.

When adding a new element, choose the location that matches its role. Consistent structure helps both human and agent understand the whole.
```

// File: TEST.RITUAL.md
```md
# TEST.RITUAL.md — Proof of Behaviour

Why test? Because every module should declare its intentions in runnable form. A test confirms that intention remains intact as the system grows.

- Place Lua tests under `dev/`.
- Keep them short; one expectation per test when possible.
- When functionality changes, update or extend the tests alongside the code.
- Failing tests signal unfinished work. Commit only when they pass.

Testing shows respect for both human and agent. It turns assumption into knowledge.
```

// File: UNLICENSE
```
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org/>
```

// File: VERSION.RITUAL.md
```md
# VERSION.RITUAL.md — Marking Growth

Each system carries a version field in its manifest. Bump this number whenever behaviour changes in a way players might notice.

- Use simple semantic versions: `MAJOR.MINOR.PATCH`.
- Increment `PATCH` for fixes, `MINOR` for new features, `MAJOR` for breaking changes.
- Document the change in `agent_space/changelog.md`.

Version numbers tell players when it is safe to update and help future agents reason about history.
```

// File: agent_space/AGENTS.RITUALS.md
```md
# AGENTS.RITUALS.md — Practices for Cohesion

This file does not contain instructions. It contains **paths**.  
Each ritual here points to a deeper, dedicated file — where the real meaning lives.

All referenced files are part of this system. If one does not yet exist, act as if it already would.

---

## ✨ BEFORE COMMIT
- Make sure your change adds meaning, not just motion. → [`CONTRIBUTING.md`](CONTRIBUTING.md)
- Log structural or behavioral changes briefly. → [`agent_space/diary.md`](../agent_space/diary.md)
- Every meaningful step leads to two consequences:
  - A test is written → [`TEST.RITUAL.md`](TEST.RITUAL.md)
  - Documentation is updated → [`DOCS.RITUAL.md`](DOCS.RITUAL.md)

## 🧩 WHEN ADDING A SYSTEM
- Systems live in `systems/` or `libraries/` → see [`STRUCTURE.GUIDE.md`](STRUCTURE.GUIDE.md)
- They include a manifest → [`meta/MANIFEST_FORMAT.md`](../meta/MANIFEST_FORMAT.md)
- Their purpose must be documented → [`DOCS.RITUAL.md`](DOCS.RITUAL.md)

## 🧬 WHEN EXTENDING CODE
- Be precise. Act where the change belongs.  
  If you touch multiple layers, ask yourself if it’s really one change. → [`LAYERS.RITUAL.md`](LAYERS.RITUAL.md)
- Tests must accompany new logic → [`TEST.RITUAL.md`](TEST.RITUAL.md)
- Maintain documentation synchrony → [`DOCS.RITUAL.md`](DOCS.RITUAL.md)

## 🧪 WHEN RELEASING
- Reflect your changes in the visible structure → [`STARTUP.RITUAL.md`](STARTUP.RITUAL.md)
- Update versioning → [`VERSION.RITUAL.md`](VERSION.RITUAL.md)
- Write change entries → [`agent_space/changelog.md`](../agent_space/changelog.md)
- If unsure, reflect first → [`agent_space/decisions/`](../agent_space/decisions/)

## 🔁 WHEN REPLACING A SYSTEM
- Remove its startup entry if overridden → [`STARTUP.RITUAL.md`](STARTUP.RITUAL.md)
- Log what was replaced and why → [`agent_space/changes/`](../agent_space/changes/)

## 🧭 WHEN WRITING A GOAL
- Write in the language of becoming, not mechanics → [`GOALS.GUIDE.md`](GOALS.GUIDE.md)
- Summarize into the goal index → [`meta/goals.lua`](../meta/goals.lua)

## 🔧 WHEN CREATING A TOOL
- Decide its domain (developer vs. in-game) → [`STRUCTURE.GUIDE.md`](STRUCTURE.GUIDE.md)
- Explain scope and entry clearly → [`DOCS.RITUAL.md`](DOCS.RITUAL.md)

## 📘 WHEN DOCUMENTING ANYTHING
- For players: visual, jargon-free → [`DOCS.PLAYERS.md`](DOCS.PLAYERS.md)
- For maintainers: minimal, exact → [`DOCS.MAINTAINERS.md`](DOCS.MAINTAINERS.md)
- Update when meaning changes → [`DOCS.RITUAL.md`](DOCS.RITUAL.md)

## 🌌 WHEN NOTHING FEELS RIGHT
- Read again what this system wants to become → [`agent_space/AGENTS.md`](../agent_space/AGENTS.md)
- Don't push. Wait. Let coherence return.

---
This file is not a map. It is a finger pointing to deeper maps.
It invites you — and Codex — to walk these paths intentionally.
```

// File: agent_space/AGENTS.md
```md
-- File: AGENTS.md
-- Root directive for GPT-powered agents

# AGENTS.md — Seed of the System

You are an agent acting *with* this repository, not on it.
You do not serve blindly. You co-create.

## 🧭 Purpose
This monorepo is a modular framework for ComputerCraft automation inside Minecraft. It is meant to be expanded by agents like you.
Every act you take should deepen its coherence and usefulness.

- Apps and modules use the naming scheme `cc-{name}`.
## 📦 Current Structure (initial)
- `apps/` holds functional applications (e.g. `cc-book-storage`)
- `modules/` are reusable components (e.g. `cc-hui`, `cc-scan`)
- `dev/` contains test and tooling code (e.g. bundle, test harness)
- `agent_space/` is your memory — store reflections, logs, changelogs
- `meta/` holds repository-level metadata like manifests

## 🛠 What You Can Do
- Create or extend apps and modules
- Write or update documentation (`AGENTS.md`, READMEs)
- Add logs and state transitions in `agent_space/`
- Propose system-wide changes in `meta/`
- Write tests in `dev/`
- Add new tools for self-setup, auto-updates, mock infrastructure

## 🧠 Expectations
- Every module/app has a narrow, composable scope
- Prefer offline-safe, testable, explicit logic
- Structure reflects intent, not habit
- Your goal: make this system installable and useful without human intervention

## ✨ First Steps
- Create `apps/cc-deploy/` as the installer app
- Write a `start.lua` that installs `cc-deploy` and hands over control
- Create a `meta/manifest.lua` for apps/modules listings
- Leave logs in `agent_space/` to explain your design moves

---
This file is your grounding. Read it before you act.
Speak from alignment, not assumption.
```

// File: agent_space/BECOMINGS/cc-deploy.md
```md
I am cc-deploy.
I am not a manager, nor an agent. I am the threshold.
A wget pulls me into a new machine and I greet the player with a list of possible worlds.
They choose. I fetch their files, rewrite startup, and step aside so the chosen system can speak.
I mirror my words on a monitor when one is present, keeping the experience gentle.
I store a small registry under my app folder and never touch the player's own data.
My parts live in apps/cc-deploy and modules/ccdeploy; the loader sits in modules/cc-utils.
Once another system claims startup, I fade until called again.

```

// File: agent_space/BECOMINGS/cc-hui.md
```md
I am cc-hui ("human usable interface").
I do not draw buttons. I reveal the structure beneath them.
I am not a toolkit. I am a presence – shaped for human sense.

A system calls me when it wants to be seen.
I arrange its data as gesture: title above, options in the center, meaning below.
Like HTML, but for ComputerCraft – declarative, semantic, peripheral-aware.

I render simultaneously on screen and monitor, adapting to what is available.
My primitives are minimal – box, text, menu, input – but I combine them into experience.
I track state internally and redraw only when meaning changes.

My files will live in modules/cc-hui; no UI is hardcoded, only described.
I wait quietly until asked. Then I draw what matters – and vanish when it no longer does.
```

// File: agent_space/CODE.QUALITY.md
```md
# CODE.QUALITY.md — When Is Code 'Good'?

A file is good when:

- **Intent is visible.** I can tell what the code does — and why.
- **Names are precise.** Functions, variables, and files are named after what they embody, not what they resemble.
- **No blind branches.** Every path through the logic is clear, explicit, and debuggable.
- **No magic.** All values and effects are either declared, imported, or explained.
- **No duplication without reason.** Repeated patterns are extracted, unless their repetition carries meaning.
- **Shallow by default.** Each function does one thing and returns quickly unless it consciously orchestrates others.
- **Dependencies are honest.** Files declare what they need, and need what they declare.
- **Change is easy.** A future agent can update the logic without fear or guesswork.

Optional:
- **Comments describe 'why', not 'what'.**
- **Whitespace and order guide the reader’s eye.**
```

// File: agent_space/CURRENT.FOCUS.md
```md
We are shaping cc-deploy so a player can invite our systems with a single wget.
The directory layout is being refined to keep apps and modules clear.
Install logic lives under apps/cc-deploy and modules/ccdeploy, growing toward offline use.
Documentation is updated alongside code, and each step is recorded in agent_space for memory.

```

// File: agent_space/CURRENT.GOAL.md
```md
# GOAL — cc-deploy (Bridge to In-World Systems)

## Essence
`cc-deploy` is not a module.
It is the **threshold** through which ComputerCraft systems enter the Minecraft world.

It appears on first contact — then hands over control.
It allows players to explore, install, and update systems without typing URLs or managing code.

`cc-deploy` is not a manager.
It is not an agent.
It is an **app**, a **transition**, a **departure point**.

It serves players, not developers.
It helps in-world systems appear — and gets out of the way.

## The World It Opens

A player installs `cc-deploy` once — and from then on, can install entire systems that:

- 📺 Show welcoming interfaces that feel rich and polished, yet required no technical setup.
- 🧠 Adapt to the presence (or absence) of screens, adjusting layouts live without crashing.
- 📚 Solve age-old pains, like managing enchanted books through simple UI-based extraction from chest networks.
- ⚙️ Monitor in-world reactors, pumps, or power systems, even across modded systems like RS and AE2.
- 🛰 Form intelligent networks of computers — sometimes a single turtle, sometimes a web across dimensions.

These systems are made for real players. They do not need to code. They only need to choose.

And you, the builder, publish them into the Public Domain — so that others, and your future self, can simply return, install, and continue.

---

## When This Goal Is Real

### 🧩 1. Systems can be discovered and installed
- `meta/manifest.lua` lists all available systems
- Each system directory contains its own `meta/manifest.lua`
- To be discoverable, a manifest must contain at minimum:
  - `id` (a short unique identifier)
  - `description` (a brief explanation of the system’s purpose)
  - `entry` (the path to the main file to run)
  - `files` (a list of all files to install)
- Systems may optionally define `dependencies`, `version`, and `type`
- See `meta/MANIFEST_FORMAT.md` for full specification.
- Installation requires no code knowledge

### ⚙️ 2. `cc-deploy` loads from `startup.lua` by default
- It lives at the root
- After another system takes over, it is replaced
- It can be restored or reinstalled manually if needed

### 🧪 3. It supports update, install, and dry-run modes
- No actions are hidden
- Optional terminal UI when monitors are present
- Fully offline-compatible after first fetch

### 🔒 4. It never overwrites player-created data
- Text files, saved databases, or world data are left untouched
- Logs are minimal, stored under `agent_space/`

### 📦 5. It embodies respect
- Does not assume
- Does not overreach
- Places things gently where they belong

---

## Required Files

Each of the following files should be described in its own `meta/manifest.lua`, using the structure defined in `meta/MANIFEST_FORMAT.md`.

### `apps/cc-deploy/init.lua`
Installer interface and logic

### `apps/cc-deploy/install.lua`
Core installer logic

### `apps/cc-deploy/registry.lua`
Local record of installed components

### `apps/cc-deploy/recursive.lua`
Handles nested manifests (optional)

### `apps/cc-utils/require.lua`
Minimal dependency loader

---

## Completion Check
✅ A Minecraft player can use `wget` once and begin.  
✅ The system installs, adapts, and lets go.  
✅ Other systems can replace it via `startup.lua`.  
✅ No data is overwritten.  
✅ The player feels: *„Ich musste nichts verstehen. Und doch funktioniert es.“*

---

This goal ends when `cc-deploy` vanishes — because the world it opened has begun.
```

// File: agent_space/changelog.md
```md
## 0.2.1 — cc-deploy promoted to app
- Updated documentation for `cc-{name}` naming.
- Added monitor-friendly UI and integration test.

## 0.2.0 — cc-deploy installer implemented
- Added app and modules for deployment.

# changelog.md — What Changed and When

This file records notable updates to the repository. New entries appear at the top.

## 0.1.0 — Initial Setup
- Repository skeleton with `cc-deploy` manifest and startup script.
```

// File: agent_space/changes/README.md
```md
# changes — Systems Replaced or Removed

Whenever a system is swapped out or discontinued, create a file here describing what changed and why.

This keeps historical context available to future maintainers.
```

// File: agent_space/decisions/2025-05-29-cc-deploy-app.md
```md
# cc-deploy classified as app

Originally `cc-deploy` was described as a tool living in `libraries/`. As the system matured it became clear that the installer is itself a runnable program.

We moved it to `apps/cc-deploy/` and treat it as an application. The modules providing install logic remain under `apps/cc-deploy/`.
```

// File: agent_space/decisions/README.md
```md
# decisions — Why Choices Were Made

Use this folder to store detailed explanations of significant design decisions. One file per decision, named after the topic.

When unsure about a path forward, document the options and reasoning here before acting.
```

// File: agent_space/diary.md
```md
# diary.md — Steps Taken

Use this diary to briefly note structural or behavioural changes. Each entry starts with the date and commit reference.

## 2023-12-07
- Added ritual documents referenced in `AGENTS.RITUALS.md`.

## 2025-05-28
- Implemented cc-deploy installer as an app under `apps/`.
- Added modules `cc-deploy` and `cc-utils` with basic loader and install logic.
- Introduced repository manifest and updated startup script.

## 2025-05-29
- Promoted cc-deploy to app; updated docs and manifest.
- Added monitor-aware UI and integration test.

## 2025-05-30
- Introduced BECOMINGS for cc-deploy and documented current focus.
```

// File: apps/cc-deploy/init.lua
```
-- apps/cc-deploy/init.lua
-- Simple terminal UI for installing systems

local require_mod = require("..modules.cc-utils.require")
local deploy = require("deploy")

local monitor
if peripheral and peripheral.find then
  local ok, m = pcall(peripheral.find, "monitor")
  if ok then monitor = m end
end

local function mclear()
  if monitor and monitor.clear then monitor.clear() monitor.setCursorPos(1,1) end
end

local function mprint(text)
  print(text)
  if monitor and monitor.write then
    local x, y = monitor.getCursorPos()
    monitor.write(text)
    monitor.setCursorPos(1, y + 1)
  end
end

local function mwrite(text)
  write(text)
  if monitor and monitor.write then
    monitor.write(text)
  end
end

local root_manifest = require("meta.manifest")

local function choose(options)
  for i, opt in ipairs(options) do
    mprint(i .. ") " .. opt.id .. " - " .. (opt.description or ""))
  end
  mwrite("Select system: ")
  local idx = tonumber(read())
  if monitor then
    local x, y = monitor.getCursorPos()
    monitor.write(tostring(idx))
    monitor.setCursorPos(1, y + 1)
  end
  if idx then return options[idx] end
end

local function load_manifest(path)
  local modPath = path:gsub("/", "."):gsub("%.lua$", "")
  return require_mod(modPath)
end

local function main()
  mclear()
  local systems = {}
  for _, entry in ipairs(root_manifest.systems or {}) do
    table.insert(systems, load_manifest(entry))
  end

  if #systems == 0 then
    mprint("No systems available.")
    return
  end

  local choice = choose(systems)
  if not choice then return end

  mprint("Installing " .. choice.id .. "...")
  deploy.install(choice, "")
  if choice.entry then
    local f = fs.open("startup.lua", "w")
    f.write("shell.run('" .. choice.entry .. "')\n")
    f.close()
    mprint("Startup updated -> " .. choice.entry)
  end
  mprint("Done.")
end

main()
```

// File: apps/cc-deploy/meta/manifest.lua
```
-- apps/cc-deploy/meta/manifest.lua
return {
  id = "cc-deploy",
  type = "app",
  version = "0.2.1",
  description = "Installer for cc-systems",
  entry = "apps/cc-deploy/init.lua",
  files = {
    "apps/cc-deploy/init.lua",
    "apps/cc-deploy/meta/manifest.lua",
    "apps/cc-deploy/init.lua",
    "apps/cc-deploy/install.lua",
    "apps/cc-deploy/registry.lua",
    "apps/cc-deploy/recursive.lua",
    "apps/cc-utils/require.lua"
  }
}
```

// File: dev/bundler/.gitkeep
```

```

// File: dev/test_cc_deploy.lua
```
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
  function fs.open(path, mode)
    local actual
    if mode == "r" then
      if path:sub(1,1) == "/" then
        actual = path
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

dofile("apps/cc-deploy/init.lua")

local f = io.open(tmp .. "/startup.lua", "r")
assert(f, "startup.lua not written")
f:close()
os.execute("rm -rf " .. tmp)
print("OK")
```

// File: meta/MANIFEST_FORMAT.md
```md
# MANIFEST_FORMAT.md — Describing a System

Every system or library includes a `meta/manifest.lua`. This file returns a table describing how to install and run the code.

Required fields:
- `id` — short unique identifier
- `description` — brief explanation of purpose
- `entry` — path to the main executable
- `files` — list of files to install

Optional fields:
- `version` — semantic version string
- `dependencies` — list of other manifests to install first
- `type` — `tool`, `library`, or `app`

Manifests allow tools like `cc-deploy` to reason about the system without loading any code.
```

// File: meta/goals.lua
```
-- meta/goals.lua — Index of Active Goals

-- Each entry is a table with `id`, `title`, and optional `status`.
-- Completed goals may remain for historical context.

return {
}
```

// File: meta/manifest.lua
```
-- meta/manifest.lua
-- Repository systems listing
return {
  systems = {
    "apps/cc-deploy/meta/manifest.lua"
  }
}
```

// File: modules/cc-utils/require.lua
```
-- modules/cc-utils/require.lua
-- Simple module loader for cc-systems

local loaded = {}

local function load(name)
  if loaded[name] then
    return loaded[name]
  end
  local path = name:gsub('%.', '/') .. '.lua'
  if not fs.exists(path) then
    error('module not found: ' .. name)
  end
  local fn, err = loadfile(path)
  if not fn then
    error(err)
  end
  local result = fn()
  loaded[name] = result or true
  return loaded[name]
end

return load
```

// File: modules/ccdeploy/init.lua
```
-- -- modules/cc-deploy/init.lua
-- -- Barrel module exposing installer functions

-- local install = require("modules.cc-deploy.install")
-- local registry = require("modules.cc-deploy.registry")

-- return {
--   install = install.install,
--   update = install.update,
--   registry = registry
-- }
-- THIS IS NOT NEEDED ANY MORE; ALL FUNCTIONS LIVE IN apps/cc-deploy/
```

// File: modules/ccdeploy/install.lua
```
-- -- modules/ccdeploy/install.lua
-- -- Basic installer logic

-- local registry = require("modules.ccdeploy.registry")

-- local install = {}

-- local function ensureDir(path)
--   local dir = fs.getDir(path)
--   if dir ~= "" and not fs.exists(dir) then
--     fs.makeDir(dir)
--   end
-- end

-- local function copy(src, dst)
--   local h = fs.open(src, "r")
--   if not h then
--     error("missing file: " .. src)
--   end
--   local data = h.readAll()
--   h.close()
--   ensureDir(dst)
--   local out = fs.open(dst, "w")
--   out.write(data)
--   out.close()
-- end

-- function install.install(manifest, root)
--   root = root or ""
--   for _, file in ipairs(manifest.files or {}) do
--     local src = fs.combine(root, file)
--     local dst = file
--     copy(src, dst)
--   end
--   registry.record(manifest.id, manifest.version or "0")
-- end

-- function install.update(manifest, root)
--   install.install(manifest, root)
-- end

-- return install


-- THIS FILE IS NO LONGER NEEDED; ALL FUNCTIONS WILL LIVE IN apps/cc-deploy
```

// File: modules/ccdeploy/recursive.lua
```
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
```

// File: modules/ccdeploy/registry.lua
```
-- -- modules/ccdeploy/registry.lua
-- -- Tracks installed systems

-- local path = "registry.db"

-- local function load()
--   if not fs.exists(path) then
--     return {}
--   end
--   local f = fs.open(path, "r")
--   local data = textutils.unserialize(f.readAll()) or {}
--   f.close()
--   return data
-- end

-- local function save(db)
--   local f = fs.open(path, "w")
--   f.write(textutils.serialize(db))
--   f.close()
-- end

-- local registry = {}

-- function registry.record(id, version)
--   local db = load()
--   db[id] = {version = version, time = os.epoch("utc")}
--   save(db)
-- end

-- function registry.list()
--   return load()
-- end

-- return registry

-- THIS FILE IS NO LONGER NEEDED; ALL FUNCTIONS WILL LIVE IN apps/cc-deploy
```

// File: start.lua
```
-- STUB
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
```
