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
