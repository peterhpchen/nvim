#!/bin/sh

if [ ! "$(command -v git)" ]; then
  echo "Please install Git first."
  exit 1
fi

if [ ! "$(command -v nvim)" ]; then
  echo "Please install Neovim first."
  exit 1
fi

if [ ! "$(command -v hadolint)" ]; then
  echo "Please install hadolint first."
  exit 1
fi

if [ ! "$(command -v shellcheck)" ]; then
  echo "Please install ShellCheck first."
  exit 1
fi

if [ ! "$(command -v shfmt)" ]; then
  echo "Please install shfmt first."
  exit 1
fi

if [ ! "$(command -v stylua)" ]; then
  echo "Please install StyLua first."
  exit 1
fi
