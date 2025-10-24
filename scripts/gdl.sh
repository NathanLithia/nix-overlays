#!/bin/bash
CONFIG_FILE="$HOME/.config/gdl.conf"

if [ -z "$1" ]; then
    echo "Error: No input provided."
    echo "Usage: bash GDL <input>"
    exit 1
fi

# Default values
BROWSER_COOKIES="vivaldi"
DEFAULT_DIR="$(xdg-user-dir DOWNLOAD)/GalleryDL"

# Load config file if it exists
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
fi

# If GDL_DIR wasn't set in config, use default
GDL_DIR="${GDL_DIR:-$DEFAULT_DIR}"

gallery-dl -v --cookies-from-browser "$BROWSER_COOKIES" -d "$GDL_DIR" "$1"
