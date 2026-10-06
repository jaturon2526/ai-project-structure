---
description: Review current uncommitted changes against project guidelines
argument-hint: "[focus area, optional]"
allowed-tools: Bash(git status:*), Bash(git diff:*), Read, Grep, Glob
---

Review the working-tree changes. Focus: $ARGUMENTS

## Context
- Status: !`git status --short`
- Diff: !`git diff HEAD`

## Check
1. **Correctness** — logic errors, null/empty handling, edge cases, async/await misuse.
2. **Security** — secrets, injection (SQL/XSS/command), missing authz, unvalidated input.
3. **Design** — single responsibility, layering, unnecessary coupling.
4. **Tests** — is new/changed behavior covered? Are bug fixes backed by a regression test?
5. **Style** — follows the conventions in CLAUDE.md; no dead code.

## Output
- **Summary** (2-4 bullets)
- **Blockers** — must fix, with `file:line` and a concrete fix
- **Suggestions** — optional improvements
- **Verdict**: Approve / Request changes

Do not modify files. Report only.
