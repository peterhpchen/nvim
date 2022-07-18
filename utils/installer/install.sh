#!/bin/sh

if [ ! "$(command -v git)" ]; then
  echo "Please install Git first."
  exit 1
fi

if [ ! "$(command -v nvim)" ]; then
  echo "Please install Neovim first."
  exit 1
fi
