#!/bin/bash
if [ -z "$1" ]; then
	echo "Error: No input provided."
	echo "Usage: bash MDL <input>"
	exit 1
fi

YT_DIR="$(xdg-user-dir MUSIC)/Youtube"

if [ "$PWD" != "$HOME" ]; then
	read -p "You're not in your home directory. Download to current directory ($PWD) instead? [y/N] " answer
	case "$answer" in
		[Yy]*)
			YT_DIR="$PWD"
			;;
	esac
fi

mkdir -p "$YT_DIR"
yt-dlp -t mp3 --embed-thumbnail -P "$YT_DIR" $1
