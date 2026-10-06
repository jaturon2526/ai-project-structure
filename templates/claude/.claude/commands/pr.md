---
description: Write a pull-request title and description from the branch diff
argument-hint: "[base branch if not main]"
allowed-tools: Bash(git log:*), Bash(git diff:*), Bash(git branch:*)
---

## Context
- Branch: !`git branch --show-current`
- Commits: !`git log --oneline main..HEAD`
- Files changed: !`git diff --stat main...HEAD`

## Task
The commands above compare against `main`. If the user passed a different base ("$ARGUMENTS"), re-run them against that base first.

Produce a PR description in this format:

**Title** — Conventional-Commit style, <= 70 chars

**Summary** — what and why (3-5 lines)

**Changes** — bullets grouped by area

**Testing** — what was run / how a reviewer can verify

**Risks & rollout** — migrations, config, breaking changes, rollback

Base it only on the actual diff; do not invent test results.
