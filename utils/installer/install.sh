#!/bin/sh

XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

NVIM_CONFIG_DIR="$XDG_CONFIG_HOME/nvim"
REMOTE=git@github.com:peterhpchen/nvim.git

if [ ! "$(command -v git)" ]; then
  echo "Please install Git first."
  exit 1
fi

if [ ! "$(command -v nvim)" ]; then
  echo "Please install Neovim first."
  exit 1
fi

if [ -d "$NVIM_CONFIG_DIR" ]; then
  echo "The $NVIM_CONFIG_DIR folder already exists. Please remove it."
  exit 1
fi

git clone --quiet "$REMOTE" "$NVIM_CONFIG_DIR"

if [ ! -d "$XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim" ]; then
  echo "packer.nvim not installed. Installing."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim "$XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim"
fi

echo "packer.nvim setup."
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
