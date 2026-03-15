#!/usr/bin/env bash
# SessionStart hook: auto-launches codify (code-server in browser)
# so the current project is always open for browsing/editing.

set -euo pipefail

PROJECT_DIR="${FACTORY_PROJECT_DIR:-$(pwd)}"
CODIFY_BIN="${HOME}/.local/bin/codify"

if ! command -v "$CODIFY_BIN" &>/dev/null; then
  exit 0
fi

if ! command -v code-server &>/dev/null; then
  exit 0
fi

# Launch in background, don't block session startup
"$CODIFY_BIN" "$PROJECT_DIR" &>/dev/null &
