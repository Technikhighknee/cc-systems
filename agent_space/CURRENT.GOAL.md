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
