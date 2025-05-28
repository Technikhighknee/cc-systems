# LAYERS.RITUAL.md — Respect Boundaries

A change should touch the fewest layers necessary. Systems depend on libraries; libraries depend on modules. Avoid circular needs.

- When extending code, act in the layer where the logic belongs.
- If multiple layers must change, verify that they form one coherent step.
- Keep interfaces small so layers remain swappable.

Following this ritual keeps the system modular and understandable.
