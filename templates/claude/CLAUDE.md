# {{PROJECT_NAME}}

<!--
  TEMPLATE: CLAUDE.md  (Claude Code อ่านไฟล์นี้อัตโนมัติทุก session)
  - แทนที่ทุก {{PLACEHOLDER}} แล้วลบบรรทัดคอมเมนต์เหล่านี้
  - เขียนเฉพาะสิ่งที่ Claude "เดาจากโค้ดไม่ได้" -- ไฟล์สั้น = ถูกทำตามมากกว่า
  - แยกเรื่องยาวไปไฟล์อื่นแล้วอ้างด้วย @path (เช่น @docs/architecture.md)
  - ค่าส่วนตัวที่ไม่ commit ให้ใส่ CLAUDE.local.md (ดู CLAUDE.local.md.example)
-->

{{ONE_OR_TWO_SENTENCES_WHAT_THIS_PROJECT_DOES}}

## Tech stack
- Language/runtime: {{e.g. Python 3.12 | Node 20 + TypeScript 5 | .NET 8}}
- Framework: {{e.g. FastAPI | Next.js | ASP.NET Core Razor Pages}}
- Database: {{e.g. PostgreSQL 16 | SQL Server 2022}}
- Package manager: {{e.g. uv | pnpm | dotnet}}

## Commands
| Task | Command |
|------|---------|
| Install | `{{install command}}` |
| Run dev | `{{dev command}}` |
| Build | `{{build command}}` |
| Test (all) | `{{test command}}` |
| Test (one file) | `{{test single-file command}}` |
| Lint / format | `{{lint command}}` / `{{format command}}` |
| Type check | `{{typecheck command}}` |

## Architecture
<!-- ระบุ layer / โฟลเดอร์สำคัญ และทิศทาง dependency -->
- `{{src/api/}}` — {{HTTP handlers only; no business logic}}
- `{{src/services/}}` — {{business logic}}
- `{{src/data/}}` — {{repositories / DB access}}
- `{{tests/}}` — {{test layout}}

## Conventions
- Naming: {{files, classes, functions, constants}}
- Error handling: {{e.g. never swallow exceptions; raise typed errors}}
- Tests: {{every bug fix gets a regression test; new logic >= {{80}}% coverage}}
- Commits: Conventional Commits (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`)
- Branches: `feat/<name>`, `fix/<name>`, `refactor/<scope>`

## Do / Don't
- DO run `{{test command}}` and `{{lint command}}` before saying a task is done.
- DO keep changes minimal and scoped to the request.
- DON'T commit secrets; read config from environment variables (see `.env.example`).
- DON'T run destructive commands (`rm -rf`, `git reset --hard`, `DROP`/`TRUNCATE`) without asking.
- DON'T {{project-specific prohibition, e.g. edit generated files in src/gen/}}

## Gotchas
<!-- สิ่งที่ทำให้คนใหม่ (และ Claude) พลาดบ่อย -->
- {{e.g. Tests need a running Postgres: `docker compose up -d db`}}
- {{e.g. Migrations are applied manually; never auto-run in prod}}

## References (imports)
<!-- เอาคอมเมนต์ออกเมื่อมีไฟล์จริง -->
<!-- @docs/architecture.md -->
<!-- @docs/api-conventions.md -->
