# Project Rules & Guidelines for Google Antigravity

> This is a master template for `GEMINI.md` (or `AGENTS.md`). Antigravity automatically discovers and enforces these rules across this workspace.

---

## 1. Project Overview & Architecture
- **Project Name**: [Project Name]
- **Core Mission**: [Brief 1-2 sentence description of the project]
- **Architecture Overview**:
  - `src/domain/`: Enterprise / business domain entities and rules
  - `src/application/`: Use cases, orchestrators, and application services
  - `src/infrastructure/`: Database adapters, external APIs, queue consumers
  - `src/interfaces/`: HTTP controllers, CLI commands, event listeners
  - `tests/`: Automated test suites (unit, integration, e2e)

---

## 2. Tech Stack & Environment
- **Runtime**: [e.g., Python 3.11+, Node.js 20+, Go 1.22+]
- **Framework**: [e.g., FastAPI, Next.js, Django, Express]
- **Database / Storage**: [e.g., PostgreSQL, Redis, S3]
- **Build / Tooling**: [e.g., uv / poetry, pnpm / npm, docker-compose]

---

## 3. Standard Operational Commands

### Development
- Setup dependencies: `npm install` / `uv sync`
- Start local environment: `npm run dev` / `uv run uvicorn main:app --reload`
- Build project: `npm run build`

### Quality Assurance & Testing
- Run test suite: `npm test` / `pytest`
- Run single test: `npm test -- <path>` / `pytest <path>`
- Lint check: `npm run lint` / `ruff check .`
- Auto-format: `npm run format` / `ruff format .`
- Type verification: `npm run type-check` / `mypy .`

---

## 4. Agent Guidelines & Coding Standards

### Behavioral Rules for Antigravity
1. **Explain Rationale**: State the intent before editing files or running critical commands.
2. **Minimal & Targeted Changes**: Avoid rewriting unaffected code, formatting entire files, or deleting comments unless requested.
3. **Verify After Change**: Always verify modifications by running tests, typechecks, or linters whenever available.
4. **Preserve Compatibility**: Maintain existing public API contracts and schemas unless explicit instructions state otherwise.

### Coding Principles
- Follow SOLID principles, DRY (Don't Repeat Yourself), and KISS (Keep It Simple, Stupid).
- Strictly enforce error handling with descriptive error messages; never suppress exceptions silently.
- Use explicit types everywhere; avoid loose typing or untyped dictionary representations.
- Keep business logic isolated from framework-specific code.

---

## 5. Security & Safety Constraints
- **Zero Secrets Policy**: Never output, print, or commit API keys, tokens, or credentials.
- Always use environment variables (`.env`) for secrets; reference `.env.example`.
- Do not run unconfirmed destructive shell commands (e.g., `rm -rf`, `git reset --hard`, `DROP DATABASE`).
- Validate and sanitize all user input at boundaries (API endpoints, CLI arguments).
