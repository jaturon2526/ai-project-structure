#!/usr/bin/env bash
# ==============================================================================
# DataPulse Enterprise Web App - Auto Setup & Start Script
# ==============================================================================

set -e

# Change directory to script folder
cd "$(dirname "$0")"

echo "========================================================"
echo "🚀 Starting DataPulse Web App (Google Antigravity Example)"
echo "========================================================"

# 1. Detect Python executable
PYTHON_CMD=""
if command -v python3.12 >/dev/null 2>&1; then
    PYTHON_CMD="python3.12"
elif command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD="python3"
else
    echo "❌ Error: python3 not found. Please install Python 3.10+."
    exit 1
fi

echo "✓ Using Python: $($PYTHON_CMD --version) ($PYTHON_CMD)"

# 2. Setup Virtual Environment (.venv) to bypass PEP 668 restriction
if [ ! -d ".venv" ]; then
    echo "📦 Creating virtual environment (.venv)..."
    $PYTHON_CMD -m venv .venv
fi

# 3. Activate Virtual Environment
# shellcheck disable=SC1091
source .venv/bin/activate
echo "✓ Virtual environment activated: $(which python)"

# 4. Install Dependencies if uvicorn is missing
if ! command -v uvicorn >/dev/null 2>&1; then
    echo "📥 Installing requirements into .venv..."
    pip install --upgrade pip --quiet
    pip install -r requirements.txt
    echo "✓ Dependencies installed successfully!"
fi

# 5. Start Uvicorn Server
echo ""
echo "========================================================"
echo "🌐 Web App running at: http://localhost:8000"
echo "📚 API Docs available at: http://localhost:8000/docs"
echo "Press Ctrl+C to stop the server."
echo "========================================================"
echo ""

exec uvicorn src.main:app --reload --port 8000
