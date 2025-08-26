#!/bin/bash
if [ -z "$1" ]; then
    echo "Error: No input provided."
    echo "Usage: bash GDL <input>"
    exit 1
fi

BROWSER_COOKIES="vivaldi"

YT_DIR="$(xdg-user-dir DOWNLOAD)/GalleryDL"
mkdir -p "$GDL_DIR"

gallery-dl -v --cookies-from-browser "$BROWSER_COOKIES" -d "$GDL_DIR" $1
