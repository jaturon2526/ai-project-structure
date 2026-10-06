---
trigger: always_on
---

# Workspace Coding Standards & Quality Gates

This rule file provides detailed coding conventions and quality checks for the workspace.

## 1. Type Safety & Contracts
- All new code must be fully type-annotated.
- Avoid escape hatches like `any` or untyped dictionaries/maps for core domain models.
- Validate external input contracts using schema validation libraries (e.g. Zod, Pydantic).

## 2. Error Handling
- Never suppress exceptions with empty `catch` or `except: pass` blocks.
- Throw or return typed errors with clear contextual messages and error codes.
- Ensure all resources (file handles, database connections, streams) are properly closed or disposed.

## 3. Testing Standards
- All bug fixes must be accompanied by a regression test reproducing the issue before the fix.
- New domain or utility logic must achieve unit test coverage.
- Avoid testing implementation details; test behaviors, inputs, and outputs.
