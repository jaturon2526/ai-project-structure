# /db-query Command

Design and test queries across Microsoft SQL Server (MSSQL) and PostgreSQL.

## Instructions
1. Identify the target database engine: MSSQL or PostgreSQL.
2. Formulate parameterized query patterns:
   - Always use bind parameters (`?` or `:param` or `%s`) to satisfy SonarQube SQL injection checks (CWE-89).
3. If writing for **MSSQL**:
   - Use `TOP (N)` or `OFFSET x ROWS FETCH NEXT y ROWS ONLY`.
   - Use schema qualification: `[schema].[table]`.
   - Use `SCOPE_IDENTITY()` for generated IDs.
4. If writing for **PostgreSQL**:
   - Use `LIMIT N OFFSET x`.
   - Use `RETURNING id, created_at` for insert responses.
   - Leverage JSONB operators (`->`, `->>`) where applicable.
5. Provide query execution plan advice and index recommendations.
