# /sonar-scan Command

Execute and verify SonarQube static code analysis and quality gates.

## Instructions
1. Run pytest with coverage export:
   ```bash
   pytest --cov=src --cov-report=xml:coverage.xml
   ```
2. Trigger the SonarQube scanner using `sonar-project.properties`:
   ```bash
   sonar-scanner
   ```
3. Evaluate the results:
   - Check if Quality Gate passed or failed.
   - List any **Bugs**, **Vulnerabilities**, or **Security Hotspots** (Severity: Blocker / Critical / Major).
   - Verify that all newly modified Python and JavaScript functions have Cognitive Complexity <= 15.
   - Verify code duplication is <= 3%.
4. If issues or smells are found:
   - Provide concrete refactoring code snippets fixing the violation directly.
   - Explain why the change satisfies SonarQube clean code requirements.
