#!/bin/bash
if [ -z "$1" ]; then
	echo "Error: No input provided."
	echo "Usage: bash VDL <input>"
	exit 1
fi

YT_DIR="$(xdg-user-dir VIDEOS)/Youtube"
mkdir -p "$YT_DIR"

yt-dlp -t mp4 --embed-thumbnail  -P "$YT_DIR" $1
