---
trigger: always_on
---

# Coding Standards

- Type everything that crosses a function boundary; avoid `any` / untyped dicts for domain models.
- Functions are small and single-purpose; cognitive complexity <= {{15}}; prefer guard clauses over deep nesting.
- Never swallow exceptions (`except: pass`, empty `catch`); raise/return typed errors with context.
- Release resources deterministically (context managers, `using`, `finally`).
- No dead code, no commented-out code, no TODO without an owner or issue link.
- Keep business logic independent of the framework.
