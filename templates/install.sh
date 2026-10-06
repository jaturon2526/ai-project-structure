#!/usr/bin/env bash
# คัดลอก template ไปใช้ในโปรเจ็คอื่น (ไม่ทับไฟล์เดิม เว้นแต่ใส่ --force)
#   ./install.sh claude       /path/to/project
#   ./install.sh antigravity  /path/to/project
#   ./install.sh all          /path/to/project --force
#   ./install.sh claude /path/to/project --only commands   # เฉพาะ .claude/commands
set -euo pipefail

tool="${1:-}"; target="${2:-}"; shift 2 || true
force=0; only=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --force) force=1 ;;
    --only)  only="${2:-}"; shift ;;
    *) echo "unknown option: $1" >&2; exit 2 ;;
  esac
  shift
done

if [[ -z "$tool" || -z "$target" ]]; then
  sed -n '2,7p' "$0"; exit 2
fi
here="$(cd "$(dirname "$0")" && pwd)"
[[ -d "$target" ]] || { echo "target not found: $target" >&2; exit 1; }

copy_tree() {
  local src="$1" copied=0 skipped=0
  while IFS= read -r -d '' file; do
    local rel="${file#"$src"/}"
    [[ "$rel" == blank/* ]] && continue
    [[ -n "$only" && "$rel" != *"$only"* ]] && continue
    local dest="$target/$rel"
    mkdir -p "$(dirname "$dest")"
    if [[ -e "$dest" && $force -eq 0 ]]; then
      echo "skip   $rel (exists)"; skipped=$((skipped+1))
    else
      cp "$file" "$dest"; echo "copy   $rel"; copied=$((copied+1))
    fi
  done < <(find "$src" -type f -print0 | sort -z)
  echo "== $(basename "$src"): $copied copied, $skipped skipped"
}

case "$tool" in
  claude)      copy_tree "$here/claude" ;;
  antigravity) copy_tree "$here/antigravity" ;;
  all)         copy_tree "$here/claude"; copy_tree "$here/antigravity" ;;
  *) echo "tool must be: claude | antigravity | all" >&2; exit 2 ;;
esac
echo "Next: replace every {{PLACEHOLDER}} -> grep -rn '{{' \"$target\""
