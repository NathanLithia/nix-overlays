#!/usr/bin/env bash
set -e

VENV_DIR=".venv"

# Create venv if it doesn't exist
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment in $VENV_DIR..."
    python3 -m venv "$VENV_DIR"
fi

# Activate the venv
echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

# Optional: make python/pip point to venv binaries
alias python="$VENV_DIR/bin/python"
alias pip="$VENV_DIR/bin/pip"

# Drop into an interactive shell
exec "$SHELL"
