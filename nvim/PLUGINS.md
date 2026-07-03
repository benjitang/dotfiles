# nvim config

My personal Neovim configuration, managed with [lazy.nvim](https://lazy.folke.io/).

## File structure

```
nvim/
├── init.lua                          # entry point, loads everything below
└── lua/
    └── core/
        ├── plugins.lua                # declares every plugin (lazy.nvim spec list)
        └── plugin_config/
            ├── init.lua                # requires each file below
            ├── telescope.lua           # setup/config for telescope
            ├── gitsigns.lua            # setup/config for gitsigns
            └── ...                     # one file per plugin that needs configuring
```

- **`plugins.lua`** — the master list. Every plugin has to be listed here or lazy.nvim won't install it.
- **`plugin_config/`** — one file per plugin, used to call that plugin's `.setup({...})` with custom options (keybinds, behavior, etc.). Not every plugin needs one of these — only ones you're configuring beyond defaults.
- **`plugin_config/init.lua`** — just a list of `require(...)` lines, one per file in that folder, so they actually run.

## Installing a new plugin

1. Open `lua/core/plugins.lua` and add an entry to the list:
   ```lua
   require("lazy").setup({
     -- ...existing plugins above...

     "author/plugin-name",              -- simple plugin, no options needed

     {
       "author/other-plugin",            -- plugin with options
       opts = {},
     },

     -- ...rest of the list...
   })
   ```

2. Restart Neovim and run:
   ```
   :Lazy sync
   ```

3. Confirm it installed:
   ```
   :Lazy
   ```
   Check that the plugin shows up as "Loaded."

## Adding custom config for a plugin

If a plugin needs specific settings (not just defaults), give it its own file instead of cramming options into `plugins.lua`:

1. Create `lua/core/plugin_config/plugin-name.lua`:
   ```lua
   require("plugin-name").setup({
     -- options here
   })
   ```

2. Add it to `lua/core/plugin_config/init.lua`:
   ```lua
   require("core.plugin_config.plugin-name")
   ```

3. Restart Neovim.

## Removing a plugin

1. Delete its entry from `plugins.lua`.
2. If it had a config file, delete it from `plugin_config/` and remove its `require(...)` line from `plugin_config/init.lua`.
3. Restart Neovim and run:
   ```
   :Lazy clean
   ```
   to uninstall it.

## Useful commands

| Command | What it does |
|---|---|
| `:Lazy` | Open the plugin manager UI (see status of all plugins) |
| `:Lazy sync` | Install new plugins / update existing ones |
| `:Lazy clean` | Remove plugins no longer in `plugins.lua` |
| `:Lazy restore` | Reinstall exact versions from `lazy-lock.json` |