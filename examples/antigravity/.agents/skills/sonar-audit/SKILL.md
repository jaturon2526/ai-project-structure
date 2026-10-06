---
name: sonar-audit
description: >-
  Audits workspace code against SonarQube Clean Code Quality Gates. Use this skill
  when asked to scan code, check for SonarQube violations, verify test coverage,
  or audit cognitive complexity and security hotspots.
---

# SonarQube Quality Gate Audit Skill

This skill guides the agent through running a SonarQube code scan, parsing quality metrics, and rectifying any detected violations.

## Procedure

1. **Run Unit Tests with Coverage Report**:
   Execute the test suite and output XML coverage:
   ```bash
   pytest --cov=src --cov-report=xml:coverage.xml
   ```

2. **Execute SonarQube Scanner**:
   Run the scanner helper script:
   ```bash
   ./.agents/skills/sonar-audit/scripts/run-sonar-scan.sh
   ```

3. **Analyze Quality Gate Metrics**:
   - Check if Quality Gate passed or failed.
   - Inspect [SonarQube Rules Reference](./resources/sonarqube-rules.md) for remediation strategies on:
     - Security Vulnerabilities (CWE-89 SQL Injection, CWE-79 XSS)
     - Cognitive Complexity > 15
     - Duplication > 3%

4. **Remediate Violations**:
   - Refactor identified code smells using minimal, targeted changes.
   - Re-run `pytest` and scanner to confirm zero remaining violations.
