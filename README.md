# AI Project Structure Master Templates (Claude & Antigravity)

คลังแม่แบบ (Master Templates) และตัวอย่างโปรเจ็คที่สมบูรณ์ (Production-Ready Examples) สำหรับตั้งค่าและสอนงาน AI Coding Assistants:
1. **Claude Code (Anthropic CLI)**
2. **Google Antigravity (AGY)**

---

## 🌳 ภาพรวมโครงสร้างโปรเจ็คทั้งระบบ (Full Project Tree)

```text
AI-Project-Structure/
├── README.md                                  # สรุปภาพรวมและการเปรียบเทียบการใช้งาน
├── index.html                                 # คู่มือฉบับ Interactive สวยงาม (เปิดผ่านเบราว์เซอร์ได้ทันที)
├── manual/                                    # เอกสารคู่มือฉบับ HTML
│   └── index.html
│
├── claude/                                    # 📂 Master Template เปล่าสำหรับ Claude Code
│   ├── CLAUDE.md                              # คำสั่งหลัก กฎสถาปัตยกรรม และสไตล์โค้ด
│   ├── .claudeignore                          # รายการไฟล์ที่ไม่ต้องการให้ Claude สแกน
│   ├── .claude/
│   │   ├── settings.json                      # การตั้งค่าพฤติกรรม (Permissions, Auto-approve)
│   │   ├── mcp.json                           # การตั้งค่า MCP Servers
│   │   └── commands/                          # Custom Slash Commands (/review, /test, /commit)
│   ├── example -> ../examples/claude          # 🔗 Symlink เชื่อมต่อไปยังตัวอย่างโปรเจ็คเต็ม
│   └── README.md                              # คู่มือการนำ claude template ไปใช้
│
├── antigravity/                               # 📂 Master Template เปล่าสำหรับ Google Antigravity
│   ├── GEMINI.md                              # กฎหลักประจำ Workspace (Always-on Rules)
│   ├── .geminiignore                          # รายการไฟล์ที่ไม่ต้องการให้ Antigravity สแกน
│   ├── .agents/                               # Customization Root Directory
│   │   ├── hooks.json                         # Lifecycle Hooks (Pre/Post tool actions)
│   │   ├── mcp_config.json                    # การตั้งค่า MCP Servers
│   │   ├── rules/                             # กฎแยกหมวดหมู่ (Modular Rules)
│   │   └── skills/                            # On-Demand Workflows (Progressive Disclosure)
│   ├── example -> ../examples/antigravity     # 🔗 Symlink เชื่อมต่อไปยังตัวอย่างโปรเจ็คเต็ม
│   └── README.md                              # คู่มือการนำ antigravity template ไปใช้
│
└── examples/                                  # 🚀 โฟลเดอร์โปรเจ็คตัวอย่างจริง (Fullstack Enterprise Web App)
    ├── claude/                                # ตัวอย่างสำหรับ Claude Code
    │   ├── CLAUDE.md                          # กฎเฉพาะ Python + MSSQL/Postgres + JS/HTML5/CSS Animation + SonarQube
    │   ├── sonar-project.properties           # คอนฟิก SonarQube Scanner ครบวงจร
    │   ├── .claude/commands/                  # คำสั่ง /sonar-scan, /animate, /db-query
    │   ├── src/                               # FastAPI Backend + Semantic HTML5 + 60fps CSS Animations
    │   └── tests/                             # Unit Tests ครอบคลุม >80%
    └── antigravity/                           # ตัวอย่างสำหรับ Google Antigravity
        ├── GEMINI.md                          # กฎเฉพาะทางสำหรับ Antigravity
        ├── sonar-project.properties           # คอนฟิก SonarQube Scanner
        ├── .agents/skills/                    # สกิล sonar-audit และ css-animation
        ├── .agents/rules/                     # กฎ sonarqube-clean-code และ database-standards
        ├── .agents/hooks.json                 # Hooks ตรวจสอบความปลอดภัย SQL และ Lint อัตโนมัติ
        ├── src/                               # โค้ด Web App ตัวอย่าง
        └── tests/                             # Unit Tests ครอบคลุม >80%
```

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

## 🌐 คู่มือฉบับ Interactive สวยงาม

เปิดอ่านคู่มือพร้อมตัวอย่างโค้ดและปุ่ม Copy ในเบราว์เซอร์:
```bash
open index.html
# หรือ
open manual/index.html
```
