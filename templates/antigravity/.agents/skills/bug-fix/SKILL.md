---
name: bug-fix
description: >-
  Reproduces, diagnoses and fixes a bug with a regression test.
  Use when the user reports an error, failing test, stack trace or unexpected behavior.
---

# Bug Fix

## Procedure
1. **Reproduce** — write the smallest failing test or command; show the failure output.
2. **Diagnose** — trace to the root cause, not the symptom; state it in one sentence.
3. **Fix** — smallest change that removes the cause; no unrelated refactoring.
4. **Verify** — the regression test passes, then run the full test suite and linter.
5. **Report** — root cause, files changed, verification results, residual risk.

If the bug cannot be reproduced, say so and list what was checked instead of guessing.
