#!/usr/bin/env bash
set -e
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config
ln -sfn "$DOTFILES/nvim" ~/.config/nvim

echo "nvim config linked from $DOTFILES/nvim"