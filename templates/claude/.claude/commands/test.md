---
description: Run the test suite, diagnose failures and fix them
argument-hint: "[path or test name, optional]"
allowed-tools: Bash, Read, Edit, Grep, Glob
---

Run the tests for: $ARGUMENTS (if empty: the whole project)

1. Use the test command from CLAUDE.md (detect the runner if it is missing).
2. If everything passes, report totals and duration — stop.
3. If something fails, for each failure give: test name, `file:line`, root cause (one sentence).
4. Fix the **production code** unless the test itself is wrong; keep the fix minimal.
5. Re-run until green. If still failing after 3 attempts, stop and explain what you tried.
