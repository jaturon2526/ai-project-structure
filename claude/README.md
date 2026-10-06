# Claude Code Master Project Template

โฟลเดอร์ต้นแบบ (Master Template) สำหรับตั้งค่าและใช้งานร่วมกับ **Claude Code (Anthropic CLI)**

---

## 📁 โครงสร้างโปรเจ็ค (Project Tree)

```text
claude/
├── CLAUDE.md                 # เอกสารหลักสำหรับ Claude Code (แนวทางการเขียนโค้ด, สถาปัตยกรรม, คำสั่งสำคัญ)
├── .claudeignore             # (แนวทางเสริม ไม่อยู่ในเอกสารทางการ — ใช้ permissions.deny เป็นตัวบังคับจริง)
├── .mcp.json                 # MCP servers ระดับโปรเจ็ค (ต้องอยู่ที่ root)
├── .claude/
│   ├── settings.json         # permissions (allow / deny) และ env
│   └── commands/             # Custom Slash Commands ประจำโปรเจ็ค
│       ├── review.md         # คำสั่ง /review สำหรับตรวจสอบโค้ดตามเกณฑ์
│       ├── test.md           # คำสั่ง /test สำหรับรันเทสต์และวิเคราะห์ข้อผิดพลาด
│       └── commit.md         # คำสั่ง /commit สำหรับสร้าง Git Conventional Commit
└── README.md                 # คู่มือการใช้งานโฟลเดอร์ Master นี้
```

---

## 🚀 วิธีนำไปใช้งานกับโปรเจ็คใหม่

1. **คัดลอกไฟล์ทั้งหมดไปยังโปรเจ็คของคุณ**:
   ```bash
   cp -r claude/CLAUDE.md claude/.mcp.json claude/.claude /path/to/your-project/
   # หรือใช้ ../templates/install.sh เพื่อคัดลอกแบบไม่ทับไฟล์เดิม
   ```

2. **ปรับแต่ง `CLAUDE.md`**:
   - ใส่ชื่อโปรเจ็คและเป้าหมายของระบบ
   - ระบุ Tech Stack, Runtime, Library ที่โปรเจ็คใช้งาน
   - ใส่คำสั่งจริงสำหรับ Build, Run, Test, Lint
   - เพิ่ม Coding Conventions หรือ Security Rules เฉพาะทางของทีม

3. **ปรับแต่ง `permissions.deny`** ใน `.claude/settings.json`:
   - เพิ่ม Path ที่เป็น Sensitive Data (เช่น `Read(./secrets/**)`)

4. **ปรับแต่ง `.mcp.json`** (ที่ root โปรเจ็ค):
   - เปิดใช้งานหรือเพิ่ม MCP Server ที่ต้องการ (เช่น Database, Git, Fetch)

5. **ใช้งาน Slash Commands ผ่าน Claude CLI**:
   - พิมพ์ `/review` เพื่อให้ Claude รีวิวการเปลี่ยนแปลง
   - พิมพ์ `/test` เพื่อให้ Claude รันชุดทดสอบ
   - พิมพ์ `/commit` เพื่อให้ Claude สรุป Commit Message
