---
description: Refactor code without changing behavior
argument-hint: "<file, symbol or area> [goal]"
allowed-tools: Bash, Read, Edit, Grep, Glob
---

Refactor: $ARGUMENTS

Rules:
- **Behavior must not change.** Public APIs and outputs stay identical unless stated.
- Make sure tests exist first; if coverage is missing, add characterization tests **before** touching code.
- Small steps; run tests after each step.
- Typical goals: split long functions, reduce nesting / cognitive complexity, remove duplication, improve names, separate layers.

Finish with: what changed, why it is safer/clearer, and test results.
