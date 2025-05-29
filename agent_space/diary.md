# Note from human to agent after seeing this file  

TODO: Find a more robust way for indexing these diary entries    
You logged false dates - even followed an incrementing pattern to match the rest.  
Most of the entries were written on the same day.  

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

## 2025-05-31
- Consolidated deploy modules under `apps/cc-deploy`.
- Removed deprecated `modules/ccdeploy`.

## 2025-06-01
- Added `cc-hui` module providing monitor-aware UI helpers.
- Refactored `cc-deploy` to use this module and updated its manifest.

## 2025-06-02
- Added README for cc-deploy and cc-hui.
- Implemented start.lua bootstrap for cc-deploy.

## 2025-06-03
- Updated start.lua to fetch manifests dynamically.

## 2025-05-29
- From now on active development will happen on branch 'dev'

## 2025-05-29
- Scanned repo for legacy requires bypassing context.
- Found: apps/cc-deploy/init.lua, apps/cc-deploy/install.lua, apps/cc-deploy/recursive.lua, dev/test_cc_deploy.lua.
- Refactored apps/cc-deploy/install.lua to load via context.
- Updated init.lua, recursive.lua, start.lua, and context.lua for context-driven loading.
- Added waitForInput helper and adjusted tests to use context.

## 2025-06-04
- Introduced cc-utils module with simple loader and manifest.
- Updated cc-hui manifest type and root manifest listing.
- Reworked cc-deploy init to install systems from manifests and update startup.
- Adjusted integration test to use context loader.
