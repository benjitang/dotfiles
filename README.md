# dotfiles

My personal configuration files, managed with symlinks so edits here show up live wherever they're used.

Currently includes:
- `nvim/` — Neovim config

## Install

Clone this repo into your home directory:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

This symlinks each config into the place the app expects it (e.g. `nvim/` → `~/.config/nvim`).

## Adding a new config

1. Move the config folder/file into this repo.
   ```bash
   mv ~/.config/starship.toml ~/dotfiles/starship.toml
   ```

2. Open `install.sh` and add a new `ln -sfn` line for it, following the same pattern as the existing ones:
   ```bash
   #!/usr/bin/env bash
   set -e
   DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

   mkdir -p ~/.config

   ln -sfn "$DOTFILES/nvim" ~/.config/nvim
   # ...(more lines)
   ln -sfn "$DOTFILES/starship.toml" ~/.config/starship.toml   # <- new line

   echo "Dotfiles linked."
   ```

3. Run the install script again to create the new link:
   ```bash
   ./install.sh
   ```

4. Commit and push both the moved config and the updated `install.sh`:
   ```bash
   git add .
   git commit -m "Add starship config"
   git push
   ```

From then on, editing `~/.config/starship.toml` and editing `~/dotfiles/starship.toml` are the same thing — it's one file linked in two places.