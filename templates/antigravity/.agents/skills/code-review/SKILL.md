---
name: code-review
description: >-
  Reviews modified code against quality, security and architecture standards.
  Use when asked to review code, check a diff or pull request, or audit changes before committing.
---

# Code Review

## Procedure
1. Inspect changes: run `./scripts/check-clean-tree.sh`, then `git diff` (and `git diff --cached`).
2. Walk the diff against [the checklist](./resources/checklist.md).
3. Run the project's lint and test commands (see GEMINI.md); note any failure.
4. Report:
   - **Summary** — intent and scope in 2-4 bullets
   - **Blockers** — bugs, vulnerabilities, breaking changes (`file:line` + concrete fix)
   - **Suggestions** — optional improvements
   - **Verdict** — `Approve` / `Comment` / `Request changes`

Report only; do not edit files unless asked.
