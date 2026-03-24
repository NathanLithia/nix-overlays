#!/usr/bin/env bash
set -e

VENV_DIR=".venv"

# Run everything inside a Nix shell with python3
nix-shell -p python3 --run "
  if [ ! -d \"$VENV_DIR\" ]; then
    echo 'Creating virtual environment in $VENV_DIR...'
    python -m venv \"$VENV_DIR\"
  fi

  echo 'Activating virtual environment...'
  source \"$VENV_DIR/bin/activate\"
  alias python=\"$VENV_DIR/bin/python\"
  alias pip=\"$VENV_DIR/bin/pip\"

  # Custom prompt:
  # [VENV] = bold yellow
  # [user@host:path] = bold blue
  # $ = bold yellow
  export PS1=\"\[\e[1;33m\][VENV]\[\e[1;34m\][\u@\h:\w]\[\e[1;33m\]\$\[\e[0m\] \"

  exec \$SHELL
"
