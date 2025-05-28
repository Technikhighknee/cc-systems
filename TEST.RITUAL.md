# TEST.RITUAL.md — Proof of Behaviour

Why test? Because every module should declare its intentions in runnable form. A test confirms that intention remains intact as the system grows.

- Place Lua tests under `dev/`.
- Keep them short; one expectation per test when possible.
- When functionality changes, update or extend the tests alongside the code.
- Failing tests signal unfinished work. Commit only when they pass.

Testing shows respect for both human and agent. It turns assumption into knowledge.
