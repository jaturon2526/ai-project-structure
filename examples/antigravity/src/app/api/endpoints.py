"""REST API Endpoints module.

SonarQube Compliance:
- Strict Pydantic input models (preventing unvalidated input).
- Cognitive complexity <= 10.
"""

from typing import Any, Dict, List
from fastapi import APIRouter, HTTPException, Query
from pydantic import BaseModel, Field

from ..db.mssql import mssql_client
from ..db.postgres import postgres_client

router = APIRouter(prefix="/api/v1")


class QueryRequest(BaseModel):
    """Query execution request payload."""

    engine: str = Field(..., description="Target database engine: 'mssql' or 'postgres'")
    limit: int = Field(10, ge=1, le=100, description="Pagination row limit")


class QueryResponse(BaseModel):
    """Query result response payload."""

    engine: str
    count: int
    data: List[Dict[str, Any]]


@router.get("/health", response_model=Dict[str, str])
async def health_check() -> Dict[str, str]:
    """Service health check endpoint."""
    return {"status": "healthy", "service": "DataPulse Enterprise Portal"}


@router.post("/query", response_model=QueryResponse)
async def query_database(payload: QueryRequest) -> QueryResponse:
    """Execute queries safely across MSSQL or PostgreSQL."""
    engine = payload.engine.lower()

    if engine == "mssql":
        rows = await mssql_client.execute_query(
            "SELECT TOP (?) * FROM dbo.Orders ORDER BY id DESC", (payload.limit,)
        )
    elif engine == "postgres":
        rows = await postgres_client.execute_query(
            "SELECT * FROM analytics_metrics ORDER BY timestamp DESC LIMIT $1",
            (payload.limit,),
        )
    else:
        raise HTTPException(
            status_code=400,
            detail=f"Unsupported database engine '{payload.engine}'. Use 'mssql' or 'postgres'.",
        )

    return QueryResponse(engine=engine, count=len(rows), data=rows)
