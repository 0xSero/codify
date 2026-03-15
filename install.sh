#!/usr/bin/env bash
set -euo pipefail

REPO="0xSero/codify"
INSTALL_DIR="${CODIFY_INSTALL_DIR:-/usr/local/bin}"

echo "Installing codify..."

# Download the script
if command -v curl &>/dev/null; then
  curl -fsSL "https://raw.githubusercontent.com/$REPO/main/bin/codify" -o /tmp/codify
elif command -v wget &>/dev/null; then
  wget -qO /tmp/codify "https://raw.githubusercontent.com/$REPO/main/bin/codify"
else
  echo "Error: curl or wget required"
  exit 1
fi

chmod +x /tmp/codify

# Install to bin directory
if [ -w "$INSTALL_DIR" ]; then
  mv /tmp/codify "$INSTALL_DIR/codify"
else
  echo "Need sudo to install to $INSTALL_DIR"
  sudo mv /tmp/codify "$INSTALL_DIR/codify"
fi

echo "Installed codify to $INSTALL_DIR/codify"

# Check for code-server
if ! command -v code-server &>/dev/null; then
  echo ""
  echo "code-server is not installed. Install it:"
  echo "  brew install code-server          # macOS"
  echo "  curl -fsSL https://code-server.dev/install.sh | sh   # Linux/macOS"
fi

echo ""
echo "Done! Run 'codify' in any project directory to open it in the browser."
