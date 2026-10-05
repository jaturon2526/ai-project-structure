# Project Guidelines for Claude Code

> This is a master template for `CLAUDE.md`. Customize the sections below according to your project's stack and needs.

---

## 1. Project Overview & Architecture
- **Project Name**: [Project Name]
- **Description**: [Brief 1-2 sentence description of what this project does]
- **Key Architecture & Patterns**:
  - Architecture style: (e.g., Clean Architecture, MVC, Microservices, Event-Driven)
  - Key modules / directories:
    - `src/core/`: Domain logic and business rules
    - `src/api/`: API handlers, routes, and controllers
    - `src/services/`: External integrations and business services
    - `tests/`: Unit and integration test suites

---

## 2. Tech Stack & Environment
- **Language / Runtime**: [e.g., Node.js 20+ / TypeScript 5.x / Python 3.11+ / Go 1.22+]
- **Frameworks & Libraries**: [e.g., Next.js, FastAPI, NestJS, React]
- **Database / Cache**: [e.g., PostgreSQL, Redis, SQLite]
- **Package Manager**: [e.g., pnpm, npm, poetry, pip, cargo]

---

## 3. Essential Commands

### Build & Run
- Install dependencies: `npm install` (or `pnpm install` / `poetry install`)
- Start development server: `npm run dev`
- Build for production: `npm run build`
- Start production server: `npm start`

### Testing
- Run all tests: `npm test`
- Run single test file: `npm test -- <path/to/test-file>`
- Run tests with coverage: `npm test -- --coverage`
- Run watch mode: `npm test -- --watch`

### Linting & Formatting
- Check lint & formatting: `npm run lint`
- Auto-fix linting issues: `npm run lint:fix`
- Format code: `npm run format`
- Type checking: `npm run type-check`

---

## 4. Coding Standards & Conventions

### General Principles
- Keep functions small, single-purpose, and modular.
- Avoid premature optimization; prefer readability and maintainability.
- Write self-documenting code with meaningful variable and function names.
- Always handle error cases gracefully; do not swallow exceptions silently.

### Naming Conventions
- **Files & Folders**: `kebab-case` (e.g., `user-service.ts`) or `camelCase`
- **Classes & Types/Interfaces**: `PascalCase` (e.g., `UserProfile`, `PaymentService`)
- **Functions & Variables**: `camelCase` (e.g., `getUserById`, `isAuthenticated`)
- **Constants & Enums**: `UPPER_SNAKE_CASE` (e.g., `MAX_RETRY_COUNT`)

### Types & Contracts
- Strict typing enabled; avoid using `any` (prefer `unknown` or specific generics).
- Define explicit interfaces or types for all function inputs and outputs.
- Keep domain models decoupled from persistence/database schemas.

### Testing Guidelines
- Write unit tests for all domain and service logic.
- Place unit tests adjacent to source files (`*.spec.ts` or `*.test.ts`) or under `tests/`.
- Mock external APIs, databases, and third-party dependencies in unit tests.

---

## 5. Git & Workflow Guidelines
- **Branch Naming**:
  - Feature: `feat/<feature-name>`
  - Bugfix: `fix/<issue-description>`
  - Refactor: `refactor/<scope>`
- **Commit Messages**: Follow Conventional Commits:
  - `feat: add user authentication endpoint`
  - `fix: resolve race condition in token refresh`
  - `docs: update API setup instructions`
  - `test: add unit tests for billing service`
- Always verify tests and linter pass before opening a Pull Request or committing changes.

---

## 6. Safety & Security Rules
- **NEVER** commit secrets, API keys, passwords, or credentials.
- Use `.env` or environment secrets; reference `.env.example` for required keys.
- Do not run destructive database commands (e.g., `DROP TABLE`) without explicit confirmation.
- Validate and sanitize all external user inputs before processing.
