# CODE.QUALITY.md — When Is Code 'Good'?

A file is good when:

- **Intent is visible.** I can tell what the code does — and why.
- **Names are precise.** Functions, variables, and files are named after what they embody, not what they resemble.
- **No blind branches.** Every path through the logic is clear, explicit, and debuggable.
- **No magic.** All values and effects are either declared, imported, or explained.
- **No duplication without reason.** Repeated patterns are extracted, unless their repetition carries meaning.
- **Shallow by default.** Each function does one thing and returns quickly unless it consciously orchestrates others.
- **Dependencies are honest.** Files declare what they need, and need what they declare.
- **Change is easy.** A future agent can update the logic without fear or guesswork.

Optional:
- **Comments describe 'why', not 'what'.**
- **Whitespace and order guide the reader’s eye.**
