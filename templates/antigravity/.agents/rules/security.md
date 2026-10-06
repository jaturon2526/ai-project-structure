---
trigger: always_on
---

# Security Baseline

- Never output, log, commit or hard-code secrets, tokens, passwords or connection strings. Read them from environment variables.
- Do not read or modify `.env*`, `*.pem`, `*.key`, `credentials.json`, `token.json` unless the user explicitly asks.
- SQL: bind parameters only (`?`, `$1`, `:name`). Never build SQL with string concatenation or f-strings (CWE-89).
- HTML/JS: no `innerHTML`/`eval()` with untrusted data; use `textContent` or a sanitizer (CWE-79).
- Validate and sanitize every external input (HTTP, CLI, files, queues) at the boundary.
- Ask for confirmation before destructive commands: `rm -rf`, `git reset --hard`, `git push --force`, `DROP`, `TRUNCATE`.
