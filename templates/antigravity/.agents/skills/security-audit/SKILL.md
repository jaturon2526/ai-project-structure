---
name: security-audit
description: >-
  Audits code for OWASP-style vulnerabilities such as injection, XSS, hard-coded secrets and missing authorization.
  Use when asked for a security review, to check for vulnerabilities, or before a release.
---

# Security Audit

## Procedure
1. Map entry points: HTTP routes, CLI args, file/queue consumers, templates.
2. Search for risks and record `file:line` evidence:
   - SQL built via concatenation / f-strings (CWE-89) — expect bind parameters
   - `innerHTML`, `eval`, unescaped template output (CWE-79)
   - Hard-coded keys, tokens, connection strings (CWE-798)
   - Missing authentication/authorization checks, IDOR
   - Unvalidated input, path traversal, SSRF, unsafe deserialization
   - Weak crypto, disabled TLS verification, debug mode, permissive CORS
3. Check dependency manifests for known-vulnerable pinned versions.
4. Report a table: Severity | CWE | Location | Issue | Recommended fix, ranked by exploitability.

Report only; propose fixes but do not apply them unless asked.
