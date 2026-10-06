---
# ชื่อไฟล์ = ชื่อคำสั่ง  (เช่น deploy.md -> /deploy)
description: {{one line shown in the / menu}}
argument-hint: "{{<required> [optional]}}"
# จำกัดเครื่องมือที่ใช้ได้โดยไม่ถามสิทธิ์ (ลบบรรทัดนี้ถ้าไม่ต้องการ)
allowed-tools: Read, Grep, Bash(git status:*)
# model: {{optional model override}}
---

{{Goal in one sentence. Use $ARGUMENTS for everything the user types after the command,
or $1 $2 for positional arguments.}}

## Context
<!-- บรรทัดที่ขึ้นต้นด้วย !` รันคำสั่งก่อนส่งให้ Claude แล้วแทนที่ด้วยผลลัพธ์ -->
- Current status: !`git status --short`

## Steps
1. {{step}}
2. {{step}}
3. {{verify step}}

## Output
{{Exact format you want back: sections, table columns, length.}}

## Boundaries
- {{e.g. read-only / do not commit / ask before deleting}}
