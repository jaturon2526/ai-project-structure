---
description: Draft a Conventional Commit message for the current changes
argument-hint: "[scope or hint, optional]"
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*)
---

## Context
- Status: !`git status --short`
- Staged diff: !`git diff --cached`
- Unstaged diff: !`git diff`
- Recent style: !`git log --oneline -8`

## Task
Write ONE commit message for the staged changes (or all changes if nothing is staged). Hint: $ARGUMENTS

Rules:
- Format `<type>(<scope>): <imperative summary>`; types: feat, fix, docs, style, refactor, perf, test, build, ci, chore
- Subject <= 72 chars, no trailing period
- Body (optional): explain **why**, not what
- `BREAKING CHANGE:` footer when relevant
- Mention unrelated changes mixed in and suggest splitting the commit

Show the message and the exact `git commit` command. **Do not run it** until the user confirms.
