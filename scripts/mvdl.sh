#!/bin/bash
if [ -z "$1" ]; then
	echo "Error: No input provided."
	echo "Usage: bash MVDL <input>"
	exit 1
fi

YT_DIR="$(xdg-user-dir MUSIC)/Youtube"
mkdir -p "$YT_DIR"

yt-dlp -t mp4 --embed-thumbnail  -P "$YT_DIR" $1
