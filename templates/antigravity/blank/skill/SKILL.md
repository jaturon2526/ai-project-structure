---
# วางที่ .agents/skills/<name>/SKILL.md  — โหลดแบบ progressive disclosure
# เห็นแค่ name + description ก่อน แล้วค่อยอ่านเนื้อหาเมื่อตรงงาน
# `description` จำเป็น; `name` ไม่ใส่ก็ใช้ชื่อโฟลเดอร์ (ตัวเล็ก + ขีดกลาง)
name: {{skill-name-in-kebab-case}}
description: >-
  {{What it does}}. Use this skill when {{trigger phrases and situations}}.
---

# {{Skill title}}

## Procedure
1. {{step}}
2. {{step — long reference material → link `./resources/<file>.md`}}
3. {{step — automation → run `./scripts/<script>.sh`}}
4. {{verify}}

## Output
{{exact format expected}}

## Folder layout (optional parts)
- `scripts/`   — helper scripts the agent can run
- `resources/` — detailed reference docs (loaded only when linked)
- `examples/`  — sample inputs/outputs
