#!/usr/bin/env python3
"""Static guard against SQL built by string formatting (CWE-89).

Usage:
    python sql-guard.py [paths...]          # report only (exit 0) - for hooks
    python sql-guard.py --strict [paths...] # exit 1 on findings   - for CI

Flags a line when it contains an SQL keyword inside a string that is built with
an f-string placeholder, "+" concatenation, "%" formatting or ".format(".
Heuristic, not a replacement for SonarQube - it just gives the agent fast feedback.
"""
import re
import sys
from pathlib import Path

SQL = r"\b(select|insert\s+into|update|delete\s+from|exec|merge)\b"
PATTERNS = {
    "f-string": re.compile(rf"""\bf(["'])[^"']*{SQL}[^"']*\{{""", re.I),
    "concatenation": re.compile(rf"""["'][^"']*{SQL}[^"']*["']\s*\+""", re.I),
    "percent-format": re.compile(rf"""["'][^"']*{SQL}[^"']*%s?[^"']*["']\s*%\s*[\(\w]""", re.I),
    ".format()": re.compile(rf"""["'][^"']*{SQL}[^"']*["']\s*\.format\(""", re.I),
}
SKIP_DIRS = {".venv", "venv", "__pycache__", "node_modules", ".git", ".scannerwork"}


def scan_file(path: Path) -> list[str]:
    findings = []
    for number, line in enumerate(path.read_text(encoding="utf-8", errors="ignore").splitlines(), 1):
        if line.lstrip().startswith("#"):
            continue
        for kind, pattern in PATTERNS.items():
            if pattern.search(line):
                findings.append(f"{path}:{number}: SQL built via {kind} - use bind parameters (CWE-89)")
                break
    return findings


def iter_files(roots: list[str]):
    for root in roots:
        base = Path(root)
        candidates = [base] if base.is_file() else base.rglob("*.py")
        for file in candidates:
            if not SKIP_DIRS.intersection(file.parts):
                yield file


def main() -> int:
    args = [a for a in sys.argv[1:] if a != "--strict"]
    strict = "--strict" in sys.argv[1:]
    if not sys.stdin.isatty():  # hooks pass JSON on stdin; drain it
        sys.stdin.read()
    findings = [f for file in iter_files(args or ["src"]) for f in scan_file(file)]
    for finding in findings:
        print(finding, file=sys.stderr)
    print("{}")  # valid empty hook response on stdout
    return 1 if (findings and strict) else 0


if __name__ == "__main__":
    sys.exit(main())
