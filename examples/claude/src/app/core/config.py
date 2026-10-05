"""Core application configuration module.

SonarQube Compliance:
- No hardcoded credentials. All secrets loaded from environment variables.
"""

import os
from dataclasses import dataclass


@dataclass(frozen=True)
class Settings:
    """Application immutable settings."""

    app_name: str = "DataPulse Enterprise Portal"
    environment: str = os.getenv("APP_ENV", "development")
    port: int = int(os.getenv("PORT", "8000"))

    # MSSQL Database Settings
    mssql_host: str = os.getenv("MSSQL_HOST", "localhost")
    mssql_port: int = int(os.getenv("MSSQL_PORT", "1433"))
    mssql_database: str = os.getenv("MSSQL_DATABASE", "datapulse_erp")
    mssql_user: str = os.getenv("MSSQL_USER", "sa")
    mssql_password: str = os.getenv("MSSQL_PASSWORD", "")

    # PostgreSQL Database Settings
    postgres_host: str = os.getenv("POSTGRES_HOST", "localhost")
    postgres_port: int = int(os.getenv("POSTGRES_PORT", "5432"))
    postgres_database: str = os.getenv("POSTGRES_DATABASE", "datapulse_analytics")
    postgres_user: str = os.getenv("POSTGRES_USER", "postgres")
    postgres_password: str = os.getenv("POSTGRES_PASSWORD", "")

    def get_postgres_dsn(self) -> str:
        """Construct PostgreSQL connection string securely."""
        return (
            f"postgresql://{self.postgres_user}:{self.postgres_password}@"
            f"{self.postgres_host}:{self.postgres_port}/{self.postgres_database}"
        )


settings = Settings()
