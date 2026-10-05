#!/usr/bin/env bash
# Helper script to check git status and modified files

set -euo pipefail

echo "=== Git Working Tree Status ==="
git status -s

echo ""
echo "=== Summary of Changed Files ==="
git diff --stat HEAD 2>/dev/null || git diff --stat
