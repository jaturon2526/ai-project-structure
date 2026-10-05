# Google Antigravity Rules: Enterprise Fullstack Web App

> Workspace rules for DataPulse Enterprise Portal (Python, MSSQL, PostgreSQL, JS/HTML5, CSS Animation & SonarQube Compliance).

---

## 1. Project Mission & Architecture
- **Application**: DataPulse Multi-Database Enterprise Analytics Portal.
- **Layers**:
  - `src/app/api/`: FastAPI REST endpoints and Pydantic schemas.
  - `src/app/db/`:
    - `mssql.py`: Microsoft SQL Server connection pool (pyodbc / SQLAlchemy).
    - `postgres.py`: PostgreSQL connection pool (asyncpg / psycopg).
  - `src/app/core/`: Configuration and environment validation.
  - `src/static/`: Semantic HTML5 layout, CSS3 design system, GPU-accelerated keyframe animations, and ES6+ vanilla JavaScript.
  - `tests/`: Pytest automated test suites with SonarQube coverage exports.

---

## 2. Standard Operational Commands
- Install Dependencies: `pip install -r requirements.txt` (or `uv sync`)
- Start Development Server: `uvicorn src.main:app --reload --port 8000`
- Run Tests with Sonar Coverage: `pytest --cov=src --cov-report=xml:coverage.xml`
- Run SonarQube Scanner: `sonar-scanner`
- Code Formatting & Linting: `ruff check src tests` && `ruff format src tests`

---

## 3. Database Standards: MSSQL & PostgreSQL
1. **Zero SQL Injection (CWE-89)**: Every single query MUST use parameterized placeholders (`?`, `:param`, or `$1`). String concatenation into SQL strings is strictly forbidden.
2. **MSSQL Specifics**:
   - Qualify all tables with schema (e.g., `dbo.Orders`).
   - Use `TOP (N)` or `OFFSET x ROWS FETCH NEXT y ROWS ONLY`.
   - Use `SCOPE_IDENTITY()` for last inserted ID.
3. **PostgreSQL Specifics**:
   - Use `LIMIT N OFFSET x` for pagination.
   - Use `RETURNING id, created_at` for inserts.
   - Use JSONB operators for flexible attribute querying.
4. **Connection Life-Cycle**: Always release database connections back to the pool inside context managers or `finally` blocks.

---

## 4. CSS Animation & Frontend Standards
- **60 FPS Rule**: Only animate `transform` and `opacity`. Anitmating layout properties (`width`, `height`, `margin`, `top`, `left`) is prohibited because it triggers CPU repaints.
- **Accessibility**: Include `@media (prefers-reduced-motion: reduce)` rules for all animated classes.
- **Security (XSS Prevention)**:
  - Do not use `innerHTML` with unsanitized server data. Use `textContent` or DOM methods.
  - Keep `"use strict";` at the top of JavaScript files.

---

## 5. SonarQube Clean Code Quality Gates
All code written or modified MUST pass the SonarQube quality gate:
- **0 Vulnerabilities & 0 Security Hotspots**.
- **0 Bugs**.
- **Cognitive Complexity**: Must not exceed **15** per function. Refactor complex branches into small, testable helper functions.
- **Code Duplication**: Must remain under **3%**.
- **Unit Test Coverage**: Maintain **>= 80% coverage** for any new backend services.

---

## 6. Antigravity Agent Behavioral Constraints
1. **Explain Rationale**: State the architectural intent before performing any file modification.
2. **Minimal & Targeted Changes**: Modify only the necessary lines. Preserve comments and unrelated code.
3. **Verify Every Edit**: Always run `pytest` and verify linting before concluding a task.
4. **Zero Secrets**: Never print, log, or hardcode credentials or connection strings in source code.
