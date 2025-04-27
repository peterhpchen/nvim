#!/bin/sh

XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

NVIM_CONFIG_DIR="$XDG_CONFIG_HOME/nvim"
REMOTE=https://github.com/peterhpchen/nvim.git

VSCODE_CONFIG_DIR="$XDG_CONFIG_HOME/Code"

if [ ! "$(command -v git)" ]; then
  echo "Please install Git first."
  exit 1
fi

if [ ! "$(command -v nvim)" ]; then
  echo "Please install Neovim first."
  exit 1
fi

if [ ! "$(command -v code)" ]; then
  echo "Please install Visual Studio Code first."
  exit 1
fi

if [ "$(uname)" = "Darwin" ]; then
  if [ ! "$(command -v im-select)" ]; then
    echo "Please install im-select first."
    exit 1
  fi
fi

if [ -d "$NVIM_CONFIG_DIR" ]; then
  echo "The $NVIM_CONFIG_DIR folder already exists. Please remove it."
  exit 1
fi

if [ -d "$VSCODE_CONFIG_DIR" ]; then
  echo "The $VSCODE_CONFIG_DIR folder already exists. Please remove it."
  exit 1
fi

git clone --quiet "$REMOTE" "$NVIM_CONFIG_DIR"

. "$NVIM_CONFIG_DIR/vscode/.scripts/setup.ubuntu.sh"