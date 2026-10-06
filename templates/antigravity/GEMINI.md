# {{PROJECT_NAME}} — Workspace Rules

<!--
  TEMPLATE: GEMINI.md  (หรือ AGENTS.md — Antigravity อ่านได้ทั้งสองชื่อ, always-on ทุก turn)
  - แทนที่ทุก {{PLACEHOLDER}} แล้วลบบรรทัดคอมเมนต์นี้
  - เก็บให้สั้น: ไฟล์นี้ถูกยัดเข้า context ทุกครั้ง
  - เรื่องเฉพาะทาง → แยกเป็น .agents/rules/*.md (ต้องมี frontmatter `trigger`)
  - ขั้นตอนงานเฉพาะ → แยกเป็น .agents/skills/<name>/SKILL.md (โหลดเมื่อจำเป็น)
-->

**Mission:** {{ONE_OR_TWO_SENTENCES}}

## Tech stack
- Runtime: {{e.g. Python 3.12 | Node 20 | .NET 8}}
- Framework: {{e.g. FastAPI | Next.js | ASP.NET Core}}
- Database: {{e.g. PostgreSQL 16 | SQL Server 2022}}
- Tooling: {{e.g. uv, pnpm, docker compose}}

## Commands
- Install: `{{install}}`
- Run dev: `{{dev}}`
- Test all: `{{test}}`  ·  single: `{{test single}}`
- Lint / format: `{{lint}}` / `{{format}}`
- Type check: `{{typecheck}}`

## Architecture
- `{{src/api/}}` — {{transport layer only}}
- `{{src/services/}}` — {{business logic}}
- `{{src/data/}}` — {{persistence}}
- `{{tests/}}` — {{layout}}

## How the agent should work
1. State the intent briefly before editing files or running risky commands.
2. Make minimal, targeted changes; keep unrelated code and comments intact.
3. Verify every change: run tests and lint, and report the result honestly.
4. Preserve public APIs and schemas unless asked to change them.
5. Ask before destructive actions (`rm -rf`, `git reset --hard`, `DROP`, force-push).

## Hard rules
- Never print, log or commit secrets; use environment variables (`.env.example` lists keys).
- Validate all external input at boundaries.
- {{project-specific rule, e.g. never edit generated files under src/gen/}}

## Skills & rules available
<!-- ช่วยให้ agent รู้ว่ามีอะไร (ลบแถวที่ไม่ใช้) -->
- Rules: `security` (always on), `coding-standards` (always on), `testing` (model decision)
- Skills: `code-review`, `bug-fix`, `write-tests`, `security-audit`, `release-notes`
