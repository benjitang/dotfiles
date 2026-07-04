#!/usr/bin/env bash
set -e
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config
ln -sfn "$DOTFILES/nvim" ~/.config/nvim
ln -sfn "$DOTFILES/starship.toml" ~/.config/starship.toml

echo "nvim config linked from $DOTFILES/nvim"
echo "starship config linked from $DOTFILES/starship.toml"