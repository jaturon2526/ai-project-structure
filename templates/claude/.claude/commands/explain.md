---
description: Explain how a piece of code or a flow works
argument-hint: "<file, function or question>"
allowed-tools: Read, Grep, Glob
---

Explain: $ARGUMENTS

Structure the answer as:
1. **Purpose** — one sentence.
2. **Flow** — numbered steps following the real call path (`file:line` references).
3. **Key data / contracts** — inputs, outputs, important types.
4. **Gotchas** — side effects, hidden coupling, error paths.
5. **Where to change it** — if the user wanted to modify behavior X, where to start.

Read-only: do not edit files. Say clearly when you are inferring rather than reading.
