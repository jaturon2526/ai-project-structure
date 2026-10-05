# Google Antigravity Master Project Template

โฟลเดอร์ต้นแบบ (Master Template) สำหรับตั้งค่าและใช้งานร่วมกับ **Google Antigravity (AGY)**

---

## 📁 โครงสร้างโปรเจ็ค (Project Tree)

```text
antigravity/
├── GEMINI.md                                  # กฎหลักประจำ Workspace (Always-on Rules, Architecture, Commands)
├── .geminiignore                              # ระบุไฟล์หรือโฟลเดอร์ที่ไม่ต้องการให้ Antigravity สแกนหรือค้นหา
├── .agents/                                   # โฟลเดอร์ Customization Root ของโปรเจ็ค
│   ├── hooks.json                             # Lifecycle Hooks (รันคำสั่งอัตโนมัติ Pre/Post Tool Execution)
│   ├── mcp_config.json                        # กำหนดค่าเชื่อมต่อ Model Context Protocol (MCP) servers
│   ├── rules/                                 # กฎแบบแยกหมวดหมู่ (Modular Rules)
│   │   └── coding-standards.md                # ตัวอย่างกฎด้านมาตรฐานโค้ดและการทดสอบ
│   └── skills/                                # On-Demand Workflows / Runbooks (โหลดเมื่อถูกเรียกใช้)
│       └── code-review/
│           ├── SKILL.md                       # คำสั่งหลักของ Skill (พร้อม YAML Frontmatter: name & description)
│           ├── references/                    # เอกสารอ้างอิงแบบละเอียด (โหลดแบบ Progressive Disclosure)
│           │   └── checklist.md               # เช็คลิสต์ตรวจสอบความถูกต้องและช่องโหว่ความปลอดภัย
│           └── scripts/                       # สคริปต์ตัวช่วยสำหรับการทำงาน
│               └── check-clean-tree.sh        # สคริปต์ตรวจสอบ Git Working Tree
└── README.md                                  # คู่มือการใช้งานโฟลเดอร์ Master นี้
```

---

## ⚙️ ระบบ Customization ของ Antigravity ทำงานอย่างไร

1. **`GEMINI.md` (Workspace Rules)**:
   - Antigravity จะสแกนหาไฟล์ `GEMINI.md` (หรือ `AGENTS.md`) จากโฟลเดอร์ปัจจุบันขึ้นไปยัง Root ของโปรเจ็ค
   - เนื้อหาในไฟล์นี้จะถูกโหลดเข้าสู่บริบทการทำงานตลอดเวลา (Always-on) เหมาะสำหรับคำสั่ง Build, Run, Test และข้อห้ามสำคัญ

2. **`skills/` (Modular Skills)**:
   - สกิลจะถูกโหลดแบบ **Progressive Disclosure** เพื่อประหยัด Token Context
   - Agent จะมองเห็นเฉพาะ `name` และ `description` ในช่วงแรก และจะอ่านไฟล์ฉบับเต็มเมื่อบริบทตรงกับความต้องการของคำสั่ง

3. **`hooks.json` (Lifecycle Hooks)**:
   - สั่งให้ Agent รันคำสั่งภายนอกอัตโนมัติ เช่น Linting หรือ Safety Check ก่อน/หลังการใช้ Tool

4. **`mcp_config.json` (MCP Tools)**:
   - เชื่อมต่อเครื่องมือภายนอกผ่านโปรโตคอลมาตรฐาน MCP (Stdio หรือ SSE)

---

## 🚀 วิธีนำไปใช้งานกับโปรเจ็คใหม่

1. **คัดลอกไฟล์ทั้งหมดไปยังโปรเจ็คของคุณ**:
   ```bash
   cp -r antigravity/GEMINI.md antigravity/.geminiignore antigravity/.agents /path/to/your-project/
   ```

2. **ปรับแต่ง `GEMINI.md`**:
   - อัปเดตข้อมูล Tech Stack, Framework, คำสั่ง Run/Build/Test ประจำโปรเจ็ค

3. **เพิ่มหรือแก้ไข Skills ใน `.agents/skills/`**:
   - เพิ่ม Runbook เฉพาะทาง เช่น deployment, database migration, api-generator
