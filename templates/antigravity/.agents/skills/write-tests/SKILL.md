---
name: write-tests
description: >-
  Writes unit tests for existing code and raises coverage on changed files.
  Use when asked to add tests, improve coverage, or cover an untested function or module.
---

# Write Tests

## Procedure
1. Read the target code and its existing tests; copy the project's test style and fixtures.
2. List behaviors to cover: happy path, boundaries (0, empty, max), invalid input, error paths.
3. Write tests as `test_<unit>_<condition>_<expected>`; one reason to fail per test.
4. Mock only external boundaries (network, DB, clock, filesystem).
5. Run the new tests, then the full suite; run with coverage if configured and report the delta.
6. If a test exposes a real bug, report it — do not weaken the assertion to make it pass.
