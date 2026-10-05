# DataPulse Enterprise Web App (Google Antigravity Example)

โปรเจ็คตัวอย่าง Fullstack Web Application สำหรับ **Google Antigravity (AGY)** ที่ตั้งค่าระบบ Customization ให้ AI มีความเชี่ยวชาญพิเศษด้าน:
1. **Python (FastAPI)**: RESTful architecture, Pydantic schemas, Dependency injection
2. **Multi-Database (MSSQL & PostgreSQL)**: Dual connection pooling, Dialect differences, Parameterized queries
3. **HTML5, CSS & CSS Animations**: 60fps GPU-accelerated keyframe animations, Reduced motion support
4. **JavaScript (ES6+)**: XSS prevention, Strict mode, Clean DOM manipulation
5. **SonarQube Quality Gate**: Zero vulnerabilities (CWE-89, CWE-79), Cognitive complexity <= 15, Test coverage >= 80%

---

## 📁 โครงสร้าง Customization ของ Antigravity ในตัวอย่างนี้

```text
examples/antigravity/
├── GEMINI.md                                  # กฎหลักประจำ Workspace (Always-on Rules)
├── .geminiignore                              # กรองไฟล์ที่ไม่ต้องการให้ Agent สแกน
├── sonar-project.properties                   # ไฟล์คอนฟิก SonarQube Scanner
├── requirements.txt                           # รายการ dependencies ของ Python
├── .agents/
│   ├── hooks.json                             # Lifecycle Hooks (Lint on change, SQL safety guard)
│   ├── mcp_config.json                        # เชื่อมต่อ MCP Postgres & Filesystem
│   ├── rules/
│   │   ├── sonarqube-clean-code.md            # กฎ SonarQube Clean Code (Complexity, Vulnerability)
│   │   └── database-standards.md              # กฎการเขียน Query MSSQL & PostgreSQL
│   └── skills/
│       ├── sonar-audit/                       # สกิลตรวจสอบโค้ดด้วย SonarQube
│       │   ├── SKILL.md                       # รันบุ๊กคำสั่งตรวจสอบและแก้ปัญหา
│       │   ├── references/sonarqube-rules.md  # เอกสารอ้างอิง Clean Code Taxonomy
│       │   └── scripts/run-sonar-scan.sh      # สคริปต์รันสแกนอัตโนมัติ
│       └── css-animation/                     # สกิลออกแบบ CSS Animation ระดับ 60fps
│           ├── SKILL.md                       # รันบุ๊กสร้าง Keyframes แบบใช้ GPU
│           └── references/gpu-rules.md        # เอกสารอ้างอิง Browser Rendering Pipeline
├── src/                                       # โค้ด Web App (FastAPI + HTML5/CSS Animations)
└── tests/                                     # Unit Tests ครอบคลุม >80%
```

---

## 🚀 วิธีการทดสอบรัน

1. **ติดตั้ง Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```
2. **รัน Unit Tests & ตรวจสอบ Coverage**:
   ```bash
   pytest --cov=src --cov-report=xml:coverage.xml
   ```
3. **เริ่ม Web Server**:
   ```bash
   uvicorn src.main:app --reload --port 8000
   ```
