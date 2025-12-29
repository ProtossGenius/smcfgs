#!/bin/bash

REPO_BASE="https://raw.githubusercontent.com/ProtossGenius/smcfgs/master/mytools/esquery"
INSTALL_DIR="$HOME/.local/share/esquery"
BIN_DIR="$HOME/.local/bin"

echo "Installing esquery..."

# Check dependencies
for cmd in curl jq; do
    if ! command -v $cmd >/dev/null 2>&1; then
        echo "Error: $cmd is not installed. Please install it first."
        exit 1
    fi
done

if ! command -v fzf >/dev/null 2>&1; then
    echo "Warning: fzf is not installed. Completion will be less interactive."
fi

mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$HOME/.config/esenv"

# Use the directory of the script if it exists on disk
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

files=("esquery" "commands.conf" "esquery_completion.bash" "es.snippets" "uninstall.sh")

for file in "${files[@]}"; do
    if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/$file" ]; then
        echo "Copying $file from local..."
        cp "$SCRIPT_DIR/$file" "$INSTALL_DIR/"
    elif [ -f "$file" ]; then
        echo "Copying $file from current directory..."
        cp "$file" "$INSTALL_DIR/"
    else
        echo "Downloading $file..."
        curl -sSL "$REPO_BASE/$file" -o "$INSTALL_DIR/$file"
    fi
done

chmod +x "$INSTALL_DIR/esquery"
ln -sf "$INSTALL_DIR/esquery" "$BIN_DIR/esquery"

# Completion setup
SHELL_TYPE=$(basename "$SHELL")
COMP_LINE="source $INSTALL_DIR/esquery_completion.bash"

if [ "$SHELL_TYPE" == "bash" ]; then
    RC_FILE="$HOME/.bashrc"
elif [ "$SHELL_TYPE" == "zsh" ]; then
    RC_FILE="$HOME/.zshrc"
fi

if [ ! -z "$RC_FILE" ] && [ -f "$RC_FILE" ]; then
    if ! grep -q "$COMP_LINE" "$RC_FILE"; then
        echo "Adding completion to $RC_FILE..."
        echo "" >> "$RC_FILE"
        echo "# esquery completion" >> "$RC_FILE"
        echo "$COMP_LINE" >> "$RC_FILE"
    fi
fi

echo "Installation complete. Please restart your shell or run: source $RC_FILE"
echo "Don't forget to create your environment files in ~/.config/esenv/ (e.g., dev.env)"
echo "Example dev.env:"
echo 'ES_HOST="http://localhost:9200"'
echo 'ES_USER="admin"'
echo 'ES_PASS="password"'
