---
name: code-review
description: >-
  Systematic code review runbook for checking modified files against quality,
  security, and architectural standards. Use this skill when asked to review code,
  verify a pull request, or audit changes before committing.
---

# Code Review Skill

This skill guides the agent through a thorough, objective review of workspace code modifications.

## Procedure

1. **Inspect Working Tree & Staged Changes**:
   - Check status and diff using git commands:
     ```bash
     git status
     git diff
     ```
2. **Review Against Architectural & Quality Standards**:
   - Consult the detailed [Review Checklist](./references/checklist.md) for quality, performance, and security rules.
   - Verify that all new logic includes appropriate unit/integration tests.
3. **Run Automated Quality Checks**:
   - Execute project linter and test suite to ensure no regressions.
4. **Formulate Review Feedback**:
   - **Summary**: Concise bullet points describing the intent and scope of changes.
   - **Critical Findings**: Bugs, security vulnerabilities, or breaking changes that must be resolved.
   - **Recommendations**: Optional improvements for style, performance, or clarity.
   - **Approval Status**: `Approve`, `Comment`, or `Request Changes`.
