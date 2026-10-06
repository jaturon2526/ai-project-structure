---
description: Investigate and fix a bug or issue end-to-end
argument-hint: "<issue number, error message or description>"
allowed-tools: Bash, Read, Edit, Write, Grep, Glob
---

Fix: $ARGUMENTS

1. **Reproduce** — find or write the smallest failing test / command. Show the failure.
2. **Locate** — trace to the root cause (not the symptom). State it in one sentence.
3. **Fix** — smallest change that fixes the cause; no drive-by refactors.
4. **Verify** — the new regression test passes; run the full suite and the linter.
5. **Report** — root cause, files changed, how it was verified, anything risky.

If the issue cannot be reproduced, say so and list what you checked instead of guessing.
