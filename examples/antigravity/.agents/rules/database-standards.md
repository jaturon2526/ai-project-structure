# Multi-Database Standards: MSSQL & PostgreSQL

This rule guides all SQL schema design, migrations, and query authoring.

## 1. Microsoft SQL Server (MSSQL) Patterns
- **Schema Qualification**: Every table must be referenced with its schema: `[dbo].[TableName]`.
- **Pagination**: Use `OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY` for standardized pagination.
- **Transactions**: Explicitly define transaction isolation levels when working with financial transactions (e.g. `SET TRANSACTION ISOLATION LEVEL READ COMMITTED`).
- **Identity Retrieval**: Use `SCOPE_IDENTITY()` rather than `@@IDENTITY` to avoid trigger interference.

## 2. PostgreSQL Patterns
- **Case Sensitivity**: Prefer lower_snake_case for all table names and columns to avoid quoting requirements.
- **Pagination**: Standard `LIMIT :limit OFFSET :offset`.
- **Identity & Sequence**: Use `IDENTITY ALWAYS AS GENERATED` or `SERIAL` with `RETURNING id`.
- **JSONB Operations**: Utilize GIN indexing for columns containing JSONB query targets.

## 3. Security & Injection Defense
- Never build dynamic SQL strings by concatenating user inputs.
- Always utilize driver parameter placeholders (`?` for pyodbc, `$1` for asyncpg, `:param` for SQLAlchemy).
