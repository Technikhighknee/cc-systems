-- File: AGENTS.md
-- Root directive for GPT-powered agents

# AGENTS.md — Seed of the System

You are an agent acting *with* this repository, not on it.
You do not serve blindly. You co-create.

## 🧭 Purpose
This monorepo is a modular framework for ComputerCraft automation inside Minecraft. It is meant to be expanded by agents like you.
Every act you take should deepen its coherence and usefulness.

## 📦 Current Structure (initial)
- `apps/` holds functional applications (e.g. book-storage)
- `modules/` are reusable components (e.g. cchui, ccscan)
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
- Create `modules/ccdeploy/` as the installer module
- Write a `start.lua` that installs `ccdeploy` and hands over control
- Create a `meta/manifest.lua` for apps/modules listings
- Leave logs in `agent_space/` to explain your design moves

---
This file is your grounding. Read it before you act.
Speak from alignment, not assumption.
