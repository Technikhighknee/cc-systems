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

Manifests allow tools like `ccdeploy` to reason about the system without loading any code.
