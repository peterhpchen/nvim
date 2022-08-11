#!/bin/sh

XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

if [ ! "$(command -v git)" ]; then
  echo "Please install Git first."
  exit 1
fi

if [ ! "$(command -v nvim)" ]; then
  echo "Please install Neovim first."
  exit 1
fi

if [ ! -d "$XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim" ]; then
  echo "packer.nvim not installed. Installing."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim "$XDG_DATA_HOME/nvim/site/pack/packer/start/packer.nvim"
fi

echo "packer.nvim setup."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
