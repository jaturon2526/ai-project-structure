---
# ต้องมี `trigger` เสมอ ไม่เช่นนั้น Antigravity จะข้ามไฟล์นี้เงียบ ๆ
# trigger: always_on       → ยัดเข้า context ทุก turn
# trigger: model_decision  → โหลดเมื่อโมเดลเห็นว่า description ตรงกับงาน (ต้องมี description)
# trigger: glob            → โหลดเมื่อแตะไฟล์ที่ตรงแพทเทิร์น (ตรวจชื่อ key ของแพทเทิร์นในเอกสารก่อนใช้)
# trigger: manual          → โหลดเมื่อ @-mention เท่านั้น
trigger: model_decision
description: {{Apply when ... (one sentence the model uses to decide)}}
---

# {{Rule title}}

- {{imperative, checkable rule}}
- {{imperative, checkable rule}}

<!-- วางที่ .agents/rules/<name>.md  (อ่านเฉพาะไฟล์ .md ชั้นตรงของโฟลเดอร์ ไม่อ่านโฟลเดอร์ย่อย) -->
