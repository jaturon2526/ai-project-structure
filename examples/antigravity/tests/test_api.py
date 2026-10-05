"""Unit tests for FastAPI endpoints.

SonarQube Compliance:
- Asserts return values explicitly.
- Covers success and error branches for >80% coverage.
"""

from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)


def test_health_check():
    """Verify health check returns status 200."""
    response = client.get("/api/v1/health")
    assert response.status_code == 200
    data = response.json()
    assert data["status"] == "healthy"


def test_query_mssql_success():
    """Verify MSSQL query execution returns data."""
    response = client.post("/api/v1/query", json={"engine": "mssql", "limit": 5})
    assert response.status_code == 200
    data = response.json()
    assert data["engine"] == "mssql"
    assert data["count"] > 0


def test_query_postgres_success():
    """Verify PostgreSQL query execution returns data."""
    response = client.post("/api/v1/query", json={"engine": "postgres", "limit": 5})
    assert response.status_code == 200
    data = response.json()
    assert data["engine"] == "postgres"
    assert data["count"] > 0


def test_query_invalid_engine():
    """Verify invalid database engine returns 400."""
    response = client.post("/api/v1/query", json={"engine": "oracle", "limit": 5})
    assert response.status_code == 400
    data = response.json()
    assert "Unsupported database engine" in data["detail"]
