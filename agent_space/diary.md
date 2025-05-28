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
