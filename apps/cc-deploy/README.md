# cc-deploy

`cc-deploy` is the entry point for ComputerCraft systems managed in this repository. It presents a simple menu to choose a system from `meta/manifest.lua`, installs the selected files, and updates `startup.lua` so the chosen system can take over.

The installer detects monitors when available and mirrors terminal output using `cc-hui` helpers. Installed systems are recorded in `apps/cc-deploy/registry.db`.

Use `wget` to fetch `start.lua`, run it once, and follow the prompts.
