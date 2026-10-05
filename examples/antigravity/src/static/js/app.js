/**
 * DataPulse Frontend Application Script
 * SonarQube Compliance:
 * - "use strict"; enabled
 * - No eval(), no document.write()
 * - No unchecked innerHTML to prevent XSS (CWE-79)
 */

"use strict";

document.addEventListener("DOMContentLoaded", () => {
  const outputBox = document.getElementById("output-box");
  const loadingIndicator = document.getElementById("loading");
  const btnMssql = document.getElementById("btn-mssql");
  const btnPostgres = document.getElementById("btn-postgres");

  /**
   * Fetch query data from API safely.
   * @param {string} engine - Target database engine ('mssql' | 'postgres').
   */
  async function runQuery(engine) {
    if (!outputBox || !loadingIndicator) {
      return;
    }

    loadingIndicator.style.display = "block";
    outputBox.textContent = "Processing query...";

    try {
      const response = await fetch("/api/v1/query", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ engine: engine, limit: 5 }),
      });

      if (!response.ok) {
        throw new Error(`HTTP Error: ${response.status}`);
      }

      const result = await response.json();
      outputBox.textContent = JSON.stringify(result, null, 2);
    } catch (error) {
      outputBox.textContent = JSON.stringify(
        {
          error: "Query Failed",
          message: error instanceof Error ? error.message : "Unknown error",
        },
        null,
        2
      );
    } finally {
      loadingIndicator.style.display = "none";
    }
  }

  if (btnMssql) {
    btnMssql.addEventListener("click", () => runQuery("mssql"));
  }

  if (btnPostgres) {
    btnPostgres.addEventListener("click", () => runQuery("postgres"));
  }
});
