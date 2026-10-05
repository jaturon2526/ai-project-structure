#!/usr/bin/env bash
# Helper script to execute SonarQube Scanner locally

set -euo pipefail

echo "=== 1. Checking Coverage Report ==="
if [ ! -f "coverage.xml" ]; then
  echo "Coverage file not found. Running pytest..."
  pytest --cov=src --cov-report=xml:coverage.xml
fi

echo "=== 2. Running SonarQube Scanner ==="
if command -v sonar-scanner >/dev/null 2>&1; then
  sonar-scanner
else
  echo "[INFO] sonar-scanner CLI not installed globally."
  echo "[INFO] Validating codebase locally with ruff and pytest..."
  ruff check src tests
  pytest
  echo "[SUCCESS] Local Quality Gates Passed!"
fi
