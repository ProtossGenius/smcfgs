#!/bin/bash

INSTALL_DIR="$HOME/.local/share/esquery"
BIN_DIR="$HOME/.local/bin"

echo "Uninstalling esquery..."

rm -rf "$INSTALL_DIR"
rm -f "$BIN_DIR/esquery"

SHELL_TYPE=$(basename "$SHELL")
if [ "$SHELL_TYPE" == "bash" ]; then
    RC_FILE="$HOME/.bashrc"
elif [ "$SHELL_TYPE" == "zsh" ]; then
    RC_FILE="$HOME/.zshrc"
fi

if [ ! -z "$RC_FILE" ] && [ -f "$RC_FILE" ]; then
    echo "Removing completion from $RC_FILE..."
    # Remove the lines added by install.sh
    sed -i '/# esquery completion/d' "$RC_FILE"
    sed -i "/source .*esquery_completion.bash/d" "$RC_FILE"
fi

echo "Uninstallation complete."
