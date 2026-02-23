#!/usr/bin/env bash
# Install memchain to ~/.local/bin (or /usr/local/bin with sudo)
set -euo pipefail

REPO="https://raw.githubusercontent.com/teebotbyteejay/memchain/main/memchain"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"

mkdir -p "$INSTALL_DIR"
echo "Downloading memchain..."
curl -fsSL "$REPO" -o "$INSTALL_DIR/memchain"
chmod +x "$INSTALL_DIR/memchain"
echo "Installed memchain to $INSTALL_DIR/memchain"

if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
  echo "Note: Add $INSTALL_DIR to your PATH if not already:"
  echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
fi
