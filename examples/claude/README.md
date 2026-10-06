# DataPulse Enterprise Web App (Claude Code Example)

โปรเจ็คตัวอย่าง Fullstack Web Application ที่ตั้งค่าและสอนให้ **Claude Code** มีความเชี่ยวชาญพิเศษด้าน:
1. **Python (FastAPI)**: REST API, Pydantic validation, Async handling
2. **Multi-Database (MSSQL & PostgreSQL)**: Parameterized queries, Connection pools, Syntax nuances
3. **HTML5, CSS & CSS Animations**: Semantic HTML, 60fps GPU-accelerated keyframe animations
4. **JavaScript (ES6+)**: Clean modular frontend, ปลอดภัยจาก XSS
5. **SonarQube Quality Gate**: สแกนโค้ดผ่าน 0 Bugs, 0 Vulnerabilities, Cognitive Complexity <= 15

---

## 📁 โครงสร้างโปรเจ็คตัวอย่าง

```text
examples/claude/
├── CLAUDE.md                          # กฎและคำสั่งเฉพาะทางสำหรับ Claude Code
├── .claudeignore                      # (แนวทางเสริม — บังคับจริงด้วย permissions.deny)
├── .mcp.json                          # MCP Postgres & Filesystem (อ่านค่า ${POSTGRES_URL} จาก env)
├── sonar-project.properties           # ไฟล์คอนฟิก SonarQube Scanner
├── requirements.txt                   # รายการ dependencies ของ Python
├── .claude/
│   ├── settings.json                  # permissions: allow คำสั่งทดสอบ/สแกน, deny อ่าน .env
│   └── commands/
│       ├── sonar-scan.md              # คำสั่ง /sonar-scan
│       ├── animate.md                 # คำสั่ง /animate สำหรับสร้าง CSS Keyframes
│       └── db-query.md                # คำสั่ง /db-query ทดสอบคิวรี MSSQL & Postgres
├── src/
│   ├── main.py                        # Entrypoint ของ FastAPI และ Static Files
│   ├── app/
│   │   ├── core/config.py             # จัดการ Environment Settings
│   │   ├── db/mssql.py                # โมดูลเชื่อมต่อ MSSQL (pyodbc / SQLAlchemy)
│   │   ├── db/postgres.py             # โมดูลเชื่อมต่อ PostgreSQL (asyncpg)
│   │   └── api/endpoints.py           # REST Endpoints พร้อม Pydantic Schema
│   └── static/
│       ├── index.html                 # Semantic HTML5 Layout
│       ├── css/style.css              # Base Responsive CSS
│       ├── css/animations.css         # 60fps Keyframe Animations (Pulse, Float, Shimmer)
│       └── js/app.js                  # Modular Vanilla JavaScript (Strict Mode)
└── tests/
    └── test_api.py                    # Unit Tests ครอบคลุม >80% สำหรับ SonarQube
```

---

## 🚀 วิธีการทดสอบรัน

1. **ติดตั้ง Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```
2. **รัน Unit Tests & สร้าง Coverage สำหรับ SonarQube**:
   ```bash
   pytest --cov=src --cov-report=xml:coverage.xml
   ```
3. **เริ่ม Web Server**:
   ```bash
   uvicorn src.main:app --reload --port 8000
   ```
   เปิดบราวเซอร์ที่ `http://localhost:8000` เพื่อดูหน้า Web UI พร้อม CSS Animations
