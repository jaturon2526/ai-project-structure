# 📚 Templates — คลังแม่แบบพร้อมใช้ซ้ำในทุกโปรเจ็ค

แยกตามเครื่องมือ เพื่อไม่ต้องเขียน `CLAUDE.md`, `GEMINI.md`, commands และ skills ใหม่ทุกครั้ง

```text
templates/
├── install.sh / install.ps1        # คัดลอก preset ไปยังโปรเจ็คปลายทาง (ไม่ทับไฟล์เดิม)
├── new.sh                          # สร้าง command / skill / rule ใหม่จาก blank template
│
├── claude/                         # ── Claude Code ──
│   ├── CLAUDE.md                   # แม่แบบคำสั่งหลักของโปรเจ็ค (มี {{placeholders}})
│   ├── CLAUDE.local.md.example     # ค่าส่วนตัว (ไม่ commit)
│   ├── .mcp.json                   # MCP servers ระดับโปรเจ็ค (ต้องอยู่ที่ root)
│   ├── .claude/
│   │   ├── settings.json           # permissions allow / ask / deny
│   │   └── commands/               # /review /test /commit /pr /fix-issue /refactor /explain /security-audit
│   └── blank/
│       ├── command.md              # โครงว่างของ slash command
│       └── skill/SKILL.md          # โครงว่างของ skill (.claude/skills/<name>/)
│
└── antigravity/                    # ── Google Antigravity ──
    ├── GEMINI.md                   # แม่แบบกฎ always-on (ใช้ชื่อ AGENTS.md ก็ได้)
    ├── .agents/
    │   ├── hooks.json              # lifecycle hooks (ปิดไว้เป็นค่าเริ่มต้น)
    │   ├── rules/                  # security, coding-standards (always_on) · testing (model_decision)
    │   └── skills/                 # code-review, bug-fix, write-tests, security-audit, release-notes
    └── blank/
        ├── rule.md                 # โครงว่างของ rule (อธิบายค่า trigger)
        └── skill/                  # โครงว่างของ skill + scripts/ resources/ examples/
```

> `blank/` คือ **โครงเปล่า** สำหรับสร้างของใหม่ ส่วนที่เหลือคือ **preset พร้อมใช้** ที่ `install` จะคัดลอกให้

---

## ⚡ ใช้งานเร็ว

```bash
# 1) คัดลอก preset ไปโปรเจ็คปลายทาง (ข้ามไฟล์ที่มีอยู่แล้ว; --force เพื่อทับ)
./templates/install.sh claude      ~/work/my-app
./templates/install.sh antigravity ~/work/my-app
./templates/install.sh all         ~/work/my-app
./templates/install.sh claude ~/work/my-app --only commands     # เฉพาะบางส่วน

# 2) เติมค่าที่ยังเป็น {{placeholder}}
grep -rn '{{' ~/work/my-app

# 3) สร้างของใหม่จาก blank
./templates/new.sh claude command deploy          ~/work/my-app   # .claude/commands/deploy.md
./templates/new.sh claude skill api-design        ~/work/my-app   # .claude/skills/api-design/SKILL.md
./templates/new.sh antigravity skill db-migration ~/work/my-app   # .agents/skills/db-migration/
./templates/new.sh antigravity rule naming        ~/work/my-app   # .agents/rules/naming.md
```

Windows PowerShell: `.\templates\install.ps1 -Tool all -Target C:\work\my-app` (เพิ่ม `-Force` เพื่อทับ)

---

## 🔎 ข้อควรรู้ของแต่ละเครื่องมือ (ตรวจกับเอกสารทางการเมื่อ ต.ค. 2026)

### Claude Code
| เรื่อง | ที่ถูกต้อง |
|---|---|
| อนุญาต/บล็อกคำสั่ง | `.claude/settings.json` → `permissions.allow / ask / deny` (ไม่มีคีย์ `autoApprove`) |
| MCP ระดับโปรเจ็ค | `.mcp.json` ที่ **root โปรเจ็ค** (ไม่ใช่ `.claude/mcp.json`) |
| ซ่อนไฟล์ลับ | ใช้ `permissions.deny` เช่น `Read(./.env)`; `.claudeignore` ไม่อยู่ในเอกสารทางการ |
| Slash command | `.claude/commands/<name>.md` — frontmatter: `description`, `argument-hint`, `allowed-tools`, `model`; ใช้ `$ARGUMENTS`/`$1`; ``!`cmd` `` ฝังผลคำสั่ง |
| Skill | `.claude/skills/<name>/SKILL.md` (command เดิมยังใช้ได้; skill ยืดหยุ่นกว่า) |
| Import | เขียน `@path/to/file.md` ใน `CLAUDE.md` |

### Google Antigravity
| เรื่อง | ที่ถูกต้อง |
|---|---|
| กฎ always-on | `GEMINI.md` หรือ `AGENTS.md` (ไม่ต้องมี frontmatter) |
| กฎแยกไฟล์ | `.agents/rules/*.md` — **ต้องมี `trigger:`** (`always_on` / `model_decision` / `glob` / `manual`) ไม่เช่นนั้นถูกข้ามเงียบ ๆ |
| Skill | `.agents/skills/<name>/SKILL.md` — `description` จำเป็น; โฟลเดอร์เสริมที่เอกสารระบุ: `scripts/`, `examples/`, `resources/` |
| Hooks | `.agents/hooks.json` — events: `PreToolUse`, `PostToolUse`, `PreInvocation`, `PostInvocation`, `Stop`; รับ JSON ทาง stdin |
| Workflows | กำลังถูกแทนที่ด้วย skills (ประกาศ deprecate ภายใน 1 พ.ย. 2026) — template นี้จึงใช้ skills อย่างเดียว |
| ไฟล์ ignore | `.geminiignore` เป็นของ Gemini CLI; ใน Antigravity ใช้ rule / Strict Mode แทน |
| MCP | ไฟล์ global `~/.gemini/config/mcp_config.json`; ไฟล์ระดับโปรเจ็คยังไม่ยืนยันในเอกสาร |

⚠️ มีรายงานจากฟอรัมว่า hooks บางตัวอาจไม่ทำงานใน IDE บางเวอร์ชัน (CLI ปกติ) — ทดสอบก่อนพึ่งพา

---

## ✍️ แนวทางเขียน template ให้ใช้ได้จริง

1. **`description` คือหัวใจ** — บอกว่า "ทำอะไร" และ "ใช้เมื่อไหร่" ด้วยคำที่ผู้ใช้จะพิมพ์จริง
2. **สั้นและตรวจสอบได้** — กฎที่เขียนว่า "เขียนโค้ดดี ๆ" ไม่มีประโยชน์ ให้เขียนเป็นข้อที่ตรวจได้ (เช่น complexity <= 15)
3. **ใส่คำสั่งจริง** ของโปรเจ็ค (test/lint/build) — ให้ agent verify ตัวเองได้
4. **เรื่องยาวแยกไฟล์** — `@import` (Claude) หรือ `resources/` (Antigravity) โหลดเมื่อจำเป็น
5. **อย่าใส่ความลับ** ใน template — ใช้ env var และ `.env.example`
