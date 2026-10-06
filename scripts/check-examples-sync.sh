#!/usr/bin/env bash
# examples/claude และ examples/antigravity ใช้โค้ดแอป (src/, tests/, requirements.txt,
# sonar-project.properties) ชุดเดียวกัน -- สคริปต์นี้ตรวจว่ายังตรงกันอยู่
#   ./scripts/check-examples-sync.sh          # ตรวจอย่างเดียว (exit 1 ถ้าต่าง)
#   ./scripts/check-examples-sync.sh --fix    # คัดลอกจาก claude -> antigravity
set -euo pipefail
cd "$(dirname "$0")/.."

SRC=examples/claude
DST=examples/antigravity
SHARED=(src tests requirements.txt sonar-project.properties)
status=0

for item in "${SHARED[@]}"; do
  if ! diff -rq --exclude=__pycache__ "$SRC/$item" "$DST/$item" >/dev/null 2>&1; then
    status=1
    if [[ "${1:-}" == "--fix" ]]; then
      rm -rf "$DST/$item" 2>/dev/null || true
      cp -R "$SRC/$item" "$DST/$item"
      echo "synced: $item"
    else
      echo "DIFF: $item"
    fi
  fi
done

if [[ $status -eq 0 ]]; then echo "OK: shared example code is in sync"; fi
[[ "${1:-}" == "--fix" ]] && exit 0
exit $status
