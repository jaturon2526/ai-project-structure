# SonarQube Clean Code Taxonomy & Remediation

Use this reference to remediate SonarQube findings:

### 1. Cognitive Complexity
- **Problem**: Deeply nested logic makes code unmaintainable.
- **Rule**: Max score is 15.
- **Remediation**:
  - Convert `if-elif-elif` chains into dictionary lookup tables.
  - Invert conditionals to use early `return` statements (guard clauses).
  - Extract inner loop bodies into standalone pure helper functions.

### 2. SQL Injection (CWE-89)
- **Problem**: Dynamic string formatting inside queries (`f"SELECT...{user_input}"`).
- **Remediation**: Always use query parameter binding (`?` for pyodbc, `$1` for asyncpg).

### 3. XSS Protection (CWE-79)
- **Problem**: Direct assignment to `element.innerHTML` with untrusted data.
- **Remediation**: Use `element.textContent` or pre-compiled sanitized DOM structures.
