---
name: release-notes
description: >-
  Generates release notes or a changelog entry from git history.
  Use when asked for release notes, a changelog, or a summary of changes between two tags or commits.
---

# Release Notes

## Procedure
1. Determine the range (default: last tag → `HEAD`): `git describe --tags --abbrev=0`, then `git log <range> --oneline`.
2. Group commits by Conventional Commit type: Features, Fixes, Performance, Docs, Refactor, Chore.
3. Rewrite each entry in user-facing language (what changed for the user, not the code).
4. Call out **Breaking changes** and **Migration steps** at the top when present.
5. Output in Keep-a-Changelog style:

```
## [x.y.z] - YYYY-MM-DD
### Added / Changed / Fixed / Removed
- ...
```

Do not invent changes that are not in the git history.
