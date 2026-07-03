# Shortcuts & Commands

A cheat sheet of core Neovim/Vim commands worth memorizing. Grouped by category, easiest and most useful first.

> Note: this covers built-in Vim motions and commands, not your custom plugin keybinds (those live in your `plugin_config/` files — check each plugin's setup for its specific mappings).

## Modes

| Key | Action |
|---|---|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `o` / `O` | New line below / above, enter insert mode |
| `Esc` | Back to normal mode |
| `v` | Visual mode (character) |
| `V` | Visual mode (line) |
| `Ctrl+v` | Visual mode (block) |

## Movement

| Key | Action |
|---|---|
| `h j k l` | Left, down, up, right |
| `w` / `b` | Jump forward / backward one word |
| `e` | Jump to end of word |
| `0` | Start of line |
| `^` | First non-blank character of line |
| `$` | End of line |
| `gg` | Top of file |
| `G` | Bottom of file |
| `{number}G` | Go to line number (e.g. `42G`) |
| `Ctrl+d` / `Ctrl+u` | Half page down / up |
| `%` | Jump to matching bracket/paren |

## Editing

| Key | Action |
|---|---|
| `x` | Delete character |
| `dd` | Delete (cut) line |
| `yy` | Yank (copy) line |
| `p` / `P` | Paste after / before cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `.` | Repeat last change |
| `cw` | Change word (delete + insert) |
| `ciw` | Change inner word (works from anywhere in the word) |
| `dw` | Delete word |
| `D` | Delete to end of line |
| `J` | Join line below to current line |

## Combining commands (the real power of Vim)

Most editing commands follow the pattern: **verb + motion/text-object**

| Example | Meaning |
|---|---|
| `d2w` | Delete 2 words |
| `y$` | Yank to end of line |
| `ci"` | Change inside quotes |
| `di(` | Delete inside parentheses |
| `dat` | Delete around tag (HTML/XML) |
| `>>` / `<<` | Indent / unindent line |

## Search & Replace

| Key | Action |
|---|---|
| `/word` | Search forward for "word" |
| `?word` | Search backward |
| `n` / `N` | Next / previous match |
| `*` | Search word under cursor |
| `:%s/old/new/g` | Replace all "old" with "new" in file |
| `:%s/old/new/gc` | Same, but confirm each replacement |

## Files & Buffers

| Key | Action |
|---|---|
| `:w` | Save |
| `:q` | Quit |
| `:wq` or `ZZ` | Save and quit |
| `:q!` | Quit without saving |
| `:e filename` | Open a file |
| `:bnext` / `:bprev` | Next / previous buffer |

## Windows & Splits

| Key | Action |
|---|---|
| `:vsplit` | Split window vertically |
| `:split` | Split window horizontally |
| `Ctrl+w` then `h/j/k/l` | Move between splits |
| `Ctrl+w` then `q` | Close current split |

## Marks & Jumps

| Key | Action |
|---|---|
| `ma` | Set mark "a" at cursor |
| `` `a `` | Jump to mark "a" |
| `Ctrl+o` | Jump back to previous location |
| `Ctrl+i` | Jump forward again |

## Tips for building muscle memory

- Practice `ciw`, `di(`, `dat` — these text-object combos are what make Vim fast once they're automatic.
- Use `.` constantly — repeat your last edit instead of retyping it.
- Avoid the arrow keys and mouse entirely for a week; it forces `hjkl` and word motions to stick.

---

## My custom keybinds

Leader key is `Space` (set in `lua/core/options.lua`). So `<leader>h` below means "press Space, then h."

### Window navigation (`lua/core/keymaps.lua`)

| Key | Action |
|---|---|
| `Ctrl+h/j/k/l` | Move between splits (left/down/up/right) |
| `<leader>h` | Clear search highlight |

### File / project navigation (Telescope)

| Key | Action |
|---|---|
| `Ctrl+p` | Find files |
| `Space Space` | Recently opened files |
| `Space fg` | Live grep (search text across project) |
| `Space fh` | Search help tags |
| `Ctrl+n` | Find current file in NvimTree |
| `-` | Open parent directory (oil.nvim) |

### LSP (when a language server is attached)

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Hover documentation |
| `<space>rn` | Rename symbol |
| `<space>ca` | Code action |
| `<space>D` | Type definition |
| `<space>f` | Format buffer |
| `<space>wa` | Add workspace folder |
| `<space>wr` | Remove workspace folder |
| `<space>wl` | List workspace folders |

### Testing (vim-test)

| Key | Action |
|---|---|
| `<leader>t` | Run nearest test |
| `<leader>T` | Run entire test file |

### Debugging (nvim-dap)

| Key | Action |
|---|---|
| `<leader>dt` | Toggle breakpoint |
| `<leader>dx` | Terminate debug session |
| `<leader>do` | Step over |

### Rust-specific (rust-tools)

| Key | Action |
|---|---|
| `<leader>k` | Hover actions |
| `<leader>a` | Code action group |

> This list reflects keybinds as of when it was written — if you add or change keymaps, update this section (or re-run `grep -rn "vim.keymap.set" ~/.config/nvim` to regenerate it).