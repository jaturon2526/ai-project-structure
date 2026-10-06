---
description: Audit code for common security vulnerabilities (OWASP-oriented)
argument-hint: "[path, default whole repo]"
allowed-tools: Read, Grep, Glob, Bash(git ls-files:*)
---

Audit: $ARGUMENTS (if empty: the whole repository)

Look for, with `file:line` evidence:
- **Injection** — SQL built by concatenation/f-strings (CWE-89), command injection, template injection
- **XSS** — `innerHTML`, `dangerouslySetInnerHTML`, unescaped output (CWE-79)
- **Secrets** — hard-coded keys, tokens, connection strings (CWE-798)
- **AuthN/AuthZ** — missing checks, IDOR, weak session/JWT handling
- **Input validation** — unvalidated bodies/params, path traversal, SSRF, unsafe deserialization
- **Crypto & transport** — weak hashing, disabled TLS verification
- **Dependencies & config** — debug mode on, permissive CORS, vulnerable pinned versions

Output a table: Severity | CWE | Location | Issue | Fix.
Rank by exploitability. Report only; do not edit files unless asked.
