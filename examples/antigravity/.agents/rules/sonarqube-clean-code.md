---
trigger: always_on
---

# SonarQube Clean Code Quality Gates

This workspace enforces strict SonarQube Clean as You Code compliance:

## 1. Cognitive Complexity Thresholds
- Every function in Python and JavaScript must have a Cognitive Complexity score of **<= 15**.
- Avoid nested loops with multiple conditional statements (`if inside for inside if`).
- Refactor conditional branching using lookup tables, early returns (`guard clauses`), or polymorphic dispatch.

## 2. Security Vulnerabilities & Hotspots (OWASP Top 10)
- **SQL Injection (CWE-89)**: Always bind parameters; never format queries with f-strings (`f"SELECT...{val}"` is blocked).
- **Cross-Site Scripting (CWE-79)**: Do not inject unsanitized HTML via `innerHTML`. Use `textContent` or sanitized templates.
- **Hardcoded Credentials (CWE-798)**: Secret keys, database passwords, and auth tokens must be loaded exclusively via environment variables.

## 3. Code Duplication
- Maintain duplication density below **3%**.
- Consolidate identical SQL result mapping logic into centralized data mappers.
