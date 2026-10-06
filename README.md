# AI Project Structure Master Templates (Claude & Antigravity)

คลังแม่แบบ (Master Templates) และตัวอย่างโปรเจ็คที่สมบูรณ์ (Production-Ready Examples) สำหรับตั้งค่าและสอนงาน AI Coding Assistants:
1. **Claude Code (Anthropic CLI)**
2. **Google Antigravity (AGY)**

---

## 🧭 เริ่มจากตรงไหนดี

| อยากได้อะไร | ไปที่ |
|---|---|
| **แม่แบบพร้อมคัดลอกไปโปรเจ็คอื่น** (`CLAUDE.md`, `GEMINI.md`, commands, skills, rules) | [`templates/`](templates/README.md) |
| โครงเริ่มต้นแบบเต็มชุดต่อเครื่องมือ | `claude/`, `antigravity/` |
| ดูของจริงในแอปตัวอย่าง (FastAPI + MSSQL/Postgres + SonarQube) | `examples/` |
| คู่มือ Interactive | `index.html` |

---

## 🌳 ภาพรวมโครงสร้างโปรเจ็คทั้งระบบ (Full Project Tree)

```text
AI-Project-Structure/
├── README.md                                  # ภาพรวมและการเปรียบเทียบการใช้งาน
├── index.html                                 # คู่มือฉบับ Interactive (เปิดผ่านเบราว์เซอร์ได้ทันที)
├── manual/index.html                          # redirect ไปที่ ../index.html (ไม่เก็บไฟล์ซ้ำ)
├── .gitattributes                             # บังคับ LF (สำคัญกับ *.sh) ป้องกัน CRLF ปน
├── scripts/
│   └── check-examples-sync.sh                 # ตรวจ/ซิงก์โค้ดที่ใช้ร่วมกันของ examples ทั้งสองฝั่ง
│
├── templates/                                 # 📚 คลังแม่แบบนำกลับมาใช้ซ้ำ (แยกตามเครื่องมือ)
│   ├── install.sh · install.ps1 · new.sh      # คัดลอก preset / สร้างของใหม่จาก blank
│   ├── claude/                                # CLAUDE.md, .mcp.json, .claude/{settings.json,commands/*}, blank/
│   └── antigravity/                           # GEMINI.md, .agents/{hooks.json,rules/*,skills/*}, blank/
│
├── claude/                                    # 📂 Starter เปล่าสำหรับ Claude Code
│   ├── CLAUDE.md                              # คำสั่งหลัก กฎสถาปัตยกรรม และสไตล์โค้ด
│   ├── .claudeignore                          # (แนวทางเสริม — ไม่ใช่กลไกความปลอดภัย)
│   ├── .mcp.json                              # MCP Servers ระดับโปรเจ็ค
│   ├── .claude/
│   │   ├── settings.json                      # permissions (allow / deny) และ env
│   │   └── commands/                          # Slash Commands (/review, /test, /commit)
│   ├── example -> ../examples/claude          # 🔗 Symlink ไปยังตัวอย่างเต็ม
│   └── README.md
│
├── antigravity/                               # 📂 Starter เปล่าสำหรับ Google Antigravity
│   ├── GEMINI.md                              # กฎหลักประจำ Workspace (Always-on)
│   ├── .geminiignore                          # (ของ Gemini CLI — Antigravity ไม่รองรับอย่างเป็นทางการ)
│   ├── .agents/
│   │   ├── hooks.json                         # Lifecycle Hooks
│   │   ├── mcp_config.json                    # MCP Servers (ตัวอย่าง)
│   │   ├── rules/                             # กฎแยกหมวด (ต้องมี frontmatter `trigger`)
│   │   └── skills/                            # On-Demand Skills (scripts/ resources/)
│   ├── example -> ../examples/antigravity     # 🔗 Symlink ไปยังตัวอย่างเต็ม
│   └── README.md
│
└── examples/                                  # 🚀 แอปตัวอย่างจริง (Fullstack Enterprise Web App)
    ├── claude/                                # CLAUDE.md, .mcp.json, .claude/commands (/sonar-scan /animate /db-query)
    └── antigravity/                           # GEMINI.md, .agents/{rules,skills,hooks,hooks.json}
        └── .agents/hooks/sql-guard.py         # ตรวจ SQL ที่ต่อสตริง (CWE-89) แบบทำงานจริง
        # src/ และ tests/ ของสองฝั่งเหมือนกัน → ตรวจด้วย scripts/check-examples-sync.sh
```

> **Windows:** `example` เป็น symlink จริงใน git แต่ถ้า clone โดยไม่เปิด symlink จะกลายเป็นไฟล์ข้อความสั้น ๆ
> แก้ด้วย `git config core.symlinks true` (ต้องเปิด Developer Mode) แล้ว checkout ใหม่ — หรือเปิดโฟลเดอร์ `examples/<tool>` ตรง ๆ

---

## ⚖️ เปรียบเทียบ Claude Code กับ Antigravity

| หัวข้อ | Claude Code | Google Antigravity |
|---|---|---|
| กฎหลัก (always-on) | `CLAUDE.md` (+ `@import`, `CLAUDE.local.md`) | `GEMINI.md` / `AGENTS.md` |
| กฎแยกไฟล์ | — (ใช้ `@import` ใน CLAUDE.md) | `.agents/rules/*.md` + `trigger:` (`always_on`, `model_decision`, `glob`, `manual`) |
| คำสั่งที่ผู้ใช้เรียก | `.claude/commands/<name>.md` → `/name` | skill ถูกเรียกเป็น `/name` ได้ใน CLI; (workflows กำลังถูกยกเลิก) |
| ขั้นตอนงานแบบโหลดเมื่อจำเป็น | `.claude/skills/<name>/SKILL.md` | `.agents/skills/<name>/SKILL.md` (+ `scripts/`, `resources/`, `examples/`) |
| อนุญาต / บล็อกคำสั่ง | `.claude/settings.json` → `permissions.allow/ask/deny` | Strict Mode / deny rules ในการตั้งค่า |
| Hooks | `hooks` ใน `settings.json` | `.agents/hooks.json` (`PreToolUse`, `PostToolUse`, `Stop`, …) |
| MCP | `.mcp.json` (root โปรเจ็ค) | `mcp_config.json` (global `~/.gemini/config/`) |
| ซ่อนไฟล์จาก agent | `permissions.deny` → `Read(...)` | rule / Strict Mode (`.geminiignore` เป็นของ Gemini CLI) |
| แนวคิดโหลด context | โหลด CLAUDE.md ทุก session | Progressive disclosure: เห็น name+description ก่อน แล้วค่อยอ่านเต็ม |

รายละเอียดและข้อควรระวัง: [`templates/README.md`](templates/README.md)

---

## 🎯 ความสามารถของ AI ในโปรเจ็คตัวอย่าง (Enterprise Stack)

ตัวอย่างในโฟลเดอร์ `examples/claude/` และ `examples/antigravity/` ถูกออกแบบขึ้นเพื่อให้ AI เชี่ยวชาญงานด้าน:
1. **Python (FastAPI)**: REST API สถาปัตยกรรมแยกเลเยอร์, Pydantic v2 validation, และ Asynchronous database access
2. **Multi-Database Support (MSSQL & PostgreSQL)**:
   - ป้องกัน SQL Injection 100% ด้วย Parameterized Queries (CWE-89)
   - จัดการความต่างของไวยากรณ์: `TOP (N)` / `OFFSET-FETCH` (MSSQL) เทียบกับ `LIMIT/OFFSET` (PostgreSQL)
3. **HTML5, CSS3 & CSS Animations**:
   - Semantic HTML5 structure (Header, Main, Section, Article)
   - **GPU-Accelerated 60fps CSS Animations**: ควบคุมเฉพาะ `transform` และ `opacity` ป้องกัน Layout Reflow พร้อมรองรับ `prefers-reduced-motion`
4. **JavaScript (ES6+)**:
   - ป้องกัน XSS ด้วยการไม่ใช้ `innerHTML` และ `eval()` (CWE-79)
5. **SonarQube Quality Gates**:
   - Zero Vulnerabilities & Zero Bugs
   - Cognitive Complexity <= 15 ต่อฟังก์ชัน
   - Code Duplication < 3%
   - Unit Test Coverage >= 80% พร้อมส่งออก `coverage.xml`

---

## 🌐 คู่มือฉบับ Interactive

```bash
open index.html        # macOS  (Windows: start index.html)
```
