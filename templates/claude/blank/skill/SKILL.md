---
# Skill = ความรู้/ขั้นตอนที่ Claude โหลดเองเมื่อ "description" ตรงกับงาน (หรือเรียกด้วย /ชื่อ)
# วางที่ .claude/skills/<name>/SKILL.md  — โฟลเดอร์ชื่อเดียวกับ name
name: {{skill-name-in-kebab-case}}
description: >-
  {{What it does}}. Use when {{trigger situations / phrases the user might say}}.
# allowed-tools: Read, Grep, Bash(git diff:*)
# disable-model-invocation: true   # ให้เรียกเองด้วย /ชื่อ เท่านั้น
# argument-hint: "{{<arg>}}"
---

# {{Skill title}}

## When to use
- {{situation}}

## Procedure
1. {{step}}
2. {{step — for details link a supporting file: see [checklist](./checklist.md)}}
3. {{verify}}

## Output
{{format}}

## Notes
<!-- ไฟล์เสริม (scripts/, checklist.md, examples/) วางข้าง SKILL.md แล้วลิงก์ด้วย relative path -->
