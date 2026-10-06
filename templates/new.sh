#!/usr/bin/env bash
# สร้าง command / skill / rule ใหม่จาก blank template
#   ./new.sh claude command deploy            [project-dir]   -> .claude/commands/deploy.md
#   ./new.sh claude skill   api-design        [project-dir]   -> .claude/skills/api-design/SKILL.md
#   ./new.sh antigravity skill db-migration   [project-dir]   -> .agents/skills/db-migration/SKILL.md (+scripts/resources/examples)
#   ./new.sh antigravity rule  naming         [project-dir]   -> .agents/rules/naming.md
set -euo pipefail
tool="${1:-}"; kind="${2:-}"; name="${3:-}"; dir="${4:-.}"
here="$(cd "$(dirname "$0")" && pwd)"
[[ -n "$tool" && -n "$kind" && -n "$name" ]] || { sed -n '2,6p' "$0"; exit 2; }
[[ "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]] || { echo "name must be kebab-case (a-z, 0-9, -)" >&2; exit 2; }

case "$tool/$kind" in
  claude/command)      src="$here/claude/blank/command.md";      dest="$dir/.claude/commands/$name.md" ;;
  claude/skill)        src="$here/claude/blank/skill";           dest="$dir/.claude/skills/$name" ;;
  antigravity/skill)   src="$here/antigravity/blank/skill";      dest="$dir/.agents/skills/$name" ;;
  antigravity/rule)    src="$here/antigravity/blank/rule.md";    dest="$dir/.agents/rules/$name.md" ;;
  *) echo "unsupported: $tool $kind" >&2; exit 2 ;;
esac

[[ -e "$dest" ]] && { echo "already exists: $dest" >&2; exit 1; }
mkdir -p "$(dirname "$dest")"
cp -R "$src" "$dest"
if [[ -d "$dest" ]]; then sed -i "s/{{skill-name-in-kebab-case}}/$name/" "$dest/SKILL.md"; fi
echo "created $dest  — now fill in the {{placeholders}}"
