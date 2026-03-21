#!/usr/bin/env bash
# Install caido-bb — symlink to ~/.local/bin
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="${HOME}/.local/bin"

# Create install dir if needed
mkdir -p "$INSTALL_DIR"

# Symlink
ln -sf "${SCRIPT_DIR}/caido-bb" "${INSTALL_DIR}/caido-bb"

echo "✅ caido-bb installed to ${INSTALL_DIR}/caido-bb"

# Check PATH
if ! echo "$PATH" | tr ':' '\n' | grep -q "${INSTALL_DIR}"; then
    echo ""
    echo "⚠️  ${INSTALL_DIR} is not in your PATH. Add it:"
    echo ""
    echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc"
    echo "  source ~/.bashrc"
    echo ""
else
    echo "🎯 Run from anywhere: caido-bb -t <url> --instruction \"...\""
fi
