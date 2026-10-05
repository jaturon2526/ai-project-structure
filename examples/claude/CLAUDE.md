# Claude Code Guidelines: Fullstack Web App (Python, MSSQL, PostgreSQL, JS/HTML5/CSS Animation & SonarQube)

> This document defines architectural patterns, operational commands, and strict SonarQube clean code rules for this enterprise fullstack application.

---

## 1. Project Overview & Architecture
- **Project Name**: DataPulse Enterprise Portal
- **Description**: High-performance multi-database analytical web application integrating MSSQL (Legacy/ERP) and PostgreSQL (Transactional/Analytics) with a modern HTML5 + CSS Animated UI and Python FastAPI backend.
- **Layered Architecture**:
  - `src/app/api/`: REST API endpoints, Pydantic schemas, and input validation.
  - `src/app/db/`: Database connection engines and repositories:
    - `mssql.py`: Microsoft SQL Server connection pool & queries (pyodbc / SQLAlchemy).
    - `postgres.py`: PostgreSQL connection pool & queries (asyncpg / psycopg).
  - `src/app/core/`: Application settings, logging, and security configurations.
  - `src/static/`: Frontend web assets:
    - `index.html`: Semantic HTML5 layout.
    - `css/style.css`: Base design system & responsive layout.
    - `css/animations.css`: GPU-accelerated 60fps CSS animations (transform & opacity).
    - `js/app.js`: Vanilla ES6+ modular JavaScript.
  - `tests/`: Pytest unit and integration test suite.

---

## 2. Tech Stack & Versions
- **Backend**: Python 3.12+ / FastAPI 0.115+ / Pydantic v2
- **Databases**:
  - **MSSQL**: Microsoft SQL Server 2019/2022 (Driver: ODBC Driver 18 for SQL Server / `pyodbc`)
  - **PostgreSQL**: PostgreSQL 16+ (`asyncpg` / `psycopg3`)
- **Frontend**: HTML5, CSS3 (Custom Properties & Keyframe Animations), Vanilla JavaScript (ES2023)
- **Code Quality**: SonarQube Scanner 6.x / SonarCloud (Clean as You Code quality gate)
- **Package Management**: `uv` or `pip` (Python)

---

## 3. Essential Commands

### Development & Execution
- Install dependencies: `pip install -r requirements.txt` (or `uv sync`)
- Start development server: `uvicorn src.main:app --reload --port 8000`
- Open web portal: Navigate to `http://localhost:8000`

### Testing & Coverage
- Run all unit tests: `pytest`
- Run single test file: `pytest tests/test_api.py -v`
- Generate SonarQube XML coverage: `pytest --cov=src --cov-report=xml:coverage.xml`

### SonarQube Code Scanning & Verification
- Run local SonarQube scan: `sonar-scanner -Dsonar.projectKey=datapulse-portal`
- Check Python code style: `ruff check src tests`
- Format code: `ruff format src tests`

---

## 4. Database Rules: MSSQL vs PostgreSQL

### Multi-Database Guidelines
1. **Parameterized Queries Only**: NEVER concatenate raw SQL strings. Always use parameterized queries (`:param` or `%s` depending on driver) to eliminate SQL Injection (CWE-89).
2. **MSSQL Specifics**:
   - Use `TOP (N)` or `OFFSET x ROWS FETCH NEXT y ROWS ONLY` for pagination.
   - Use `SCOPE_IDENTITY()` for last inserted ID.
   - Enforce schema qualification (e.g., `dbo.Transactions`).
3. **PostgreSQL Specifics**:
   - Use `LIMIT N OFFSET x` for pagination.
   - Use `RETURNING id, created_at` for insert outputs.
   - Utilize PostgreSQL JSONB fields where flexible metadata is needed.
4. **Connection Pooling**: Always acquire connections from the pool and release them in `finally:` blocks or async context managers (`async with`).

---

## 5. Frontend & CSS Animation Standards
- **HTML5**: Use strict semantic tags (`<header>`, `<main>`, `<section>`, `<article>`, `<nav>`, `<dialog>`). No obsolete tags.
- **CSS Animations**:
  - **60 FPS Performance**: Only animate `transform` and `opacity` to avoid layout thrashing and repaints.
  - Do NOT animate `width`, `height`, `top`, `left`, or `margin`.
  - Use `will-change` selectively on animated elements.
  - Always support `prefers-reduced-motion` media queries for accessibility.
- **JavaScript**:
  - Strict mode enabled (`"use strict";`).
  - No `eval()`, `document.write()`, or unchecked `innerHTML` (prevents XSS - CWE-79).
  - Use `textContent` or `DOMPurify` when rendering dynamic data.

---

## 6. Strict SonarQube Compliance Rules (Zero Vulnerabilities)
All code generated or modified by Claude MUST pass SonarQube Quality Gates:
- **0 Vulnerabilities & 0 Bugs**:
  - No hardcoded credentials, IP addresses, or secrets.
  - No broad exception catching (`except Exception: pass` is prohibited; must catch specific exceptions and log with context).
- **Cognitive Complexity**:
  - Maximum cognitive complexity per function is **15**. Break down complex logic into helper functions.
- **Code Duplication**:
  - Duplication density must remain **under 3%**. Extract repeated logic into reusable utility functions.
- **Test Coverage**:
  - Any new feature or bugfix must have corresponding unit tests targeting **>= 80% coverage**.

---

## 7. Custom Slash Commands
- `/sonar-scan`: Run SonarQube scanner, parse `sonar-project.properties`, and report any quality gate violations.
- `/animate`: Generate modern, GPU-optimized CSS keyframe animations for UI components.
- `/db-query`: Test and benchmark SQL queries across both MSSQL and PostgreSQL.
