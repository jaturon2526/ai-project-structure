---
trigger: model_decision
description: Apply when adding or changing behavior, fixing a bug, or writing/reviewing tests.
---

# Testing Rules

- Every bug fix starts with a failing regression test that reproduces it.
- New logic ships with unit tests; target >= {{80}}% coverage on changed code.
- Test behavior (inputs → outputs), not implementation details.
- Mock only external boundaries (network, DB, clock, filesystem).
- One reason to fail per test; descriptive names: `test_<unit>_<condition>_<expected>`.
- Run the full suite before declaring a task done.
