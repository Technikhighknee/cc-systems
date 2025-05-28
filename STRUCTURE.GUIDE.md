# STRUCTURE.GUIDE.md — Where Things Belong

A clear layout keeps the repository easy to navigate. Systems and tools each have a home.

- `systems/` — self-contained applications or large tools. Each has a `meta/manifest.lua`.
- `libraries/` — shared code used by many systems.
- `modules/` — smaller components or utilities.
- `apps/` — end-user programs.
- `dev/` — development helpers and tests.
- `agent_space/` — logs, goals, and reflective documents.
- `meta/` — repository-wide manifests and indices.

When adding a new element, choose the location that matches its role. Consistent structure helps both human and agent understand the whole.
