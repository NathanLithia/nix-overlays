#!/usr/bin/env bash
set -e

VENV_DIR=".venv"

nix-shell -p python3 --run "
  if [ ! -d \"$VENV_DIR\" ]; then
    echo 'Creating virtual environment in $VENV_DIR...'
    python -m venv \"$VENV_DIR\"
  fi

  echo 'Activating virtual environment...'
  export VIRTUAL_ENV_DISABLE_PROMPT=1
  source \"$VENV_DIR/bin/activate\"
  alias python=\"$VENV_DIR/bin/python\"
  alias pip=\"$VENV_DIR/bin/pip\"

  # Start an interactive shell and run PS1 setup immediately
  exec \$SHELL -i -c '
    export PS1=\"\[\e[1;33m\][VENV]\[\e[1;34m\][\u@\h:\w]\[\e[1;33m\]\$\[\e[0m\] \";
    alias python=\"$VENV_DIR/bin/python\";
    alias pip=\"$VENV_DIR/bin/pip\";
    exec \$SHELL
  '
"
