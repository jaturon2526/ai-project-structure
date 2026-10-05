# /review Command

Review the recent code changes in the workspace against project guidelines.

## Instructions
1. Run `git diff` or `git status` to identify modified and untracked files.
2. Review the changes for:
   - **Correctness**: Potential bugs, logic errors, null/undefined safety, unhandled edge cases.
   - **Code Quality**: Readability, adherence to naming conventions, DRY principle, single responsibility.
   - **Security**: Hardcoded secrets, SQL injection, XSS, unvalidated inputs, permission checks.
   - **Performance**: Unnecessary re-renders, unindexed queries, blocking loops, memory leaks.
   - **Test Coverage**: Are there unit/integration tests covering the new logic or bug fixes?
3. Provide a structured review report:
   - **Summary**: Concise bullet points of what changed.
   - **Strengths**: Good patterns observed.
   - **Critical Issues (Blockers)**: Must be fixed before merging.
   - **Suggestions / Improvements**: Optional nitpicks or optimization ideas.
   - **Verdict**: Approve / Request Changes.
