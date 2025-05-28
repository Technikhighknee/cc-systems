# cc-hui

`cc-hui` offers lightweight UI helpers for ComputerCraft programs. When initialized it looks for a connected monitor and mirrors terminal output there.

Functions include:
- `init()` – detect a monitor
- `clear()` – clear screen and monitor
- `print()` – write a line on both displays
- `write()` – write without newline
- `choose(options, prompt)` – present a numbered menu and return the selected table

These primitives keep apps friendly for players with or without external screens.
