#!/usr/bin/env bash
# Preview local de la landing — corre Python http.server en :8000
# Uso: ./preview.sh

set -e

PORT="${PORT:-8000}"
DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "  ╔════════════════════════════════════════════════╗"
echo "  ║  CASA CARRIZALEJO · Preview local             ║"
echo "  ║                                                ║"
echo "  ║  → http://localhost:$PORT                        ║"
echo "  ║                                                ║"
echo "  ║  Ctrl+C para detener                          ║"
echo "  ╚════════════════════════════════════════════════╝"
echo ""

cd "$DIR"

# Try python3, fall back to python
if command -v python3 > /dev/null; then
  python3 -m http.server "$PORT"
elif command -v python > /dev/null; then
  python -m http.server "$PORT"
else
  echo "Error: Python no encontrado. Instala Python 3 o usa otro servidor:"
  echo "  npx serve"
  exit 1
fi
