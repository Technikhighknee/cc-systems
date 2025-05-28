# STARTUP.RITUAL.md — First Contact

Startup scripts introduce the system to the world. They should be simple, explicit, and reversible.

- `start.lua` bootstraps `ccdeploy`.
- When a new system replaces the starter, update `startup.lua` accordingly and log the change under `agent_space/changes/`.
- Keep the startup process minimal so players can audit what runs on their computers.

A clean startup builds trust.
