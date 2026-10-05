# /commit Command

Prepare a clean, well-formatted Conventional Commit message for staged changes.

## Instructions
1. Check `git status` and `git diff --cached` (or `git diff` if nothing is staged).
2. Group related changes logically.
3. Formulate a commit message following the Conventional Commits specification:
   - Format: `<type>(<scope>): <short summary in imperative mood>`
   - Common types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`.
   - Keep the first line under 72 characters and do not end with a period.
   - If breaking changes are present, include `BREAKING CHANGE:` in the body.
4. If appropriate, include a concise body explaining *why* the change was made.
5. Present the proposed commit command to the user for confirmation (e.g., `git commit -m "..."`).
