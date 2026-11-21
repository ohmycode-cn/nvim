# Code Conventions

Coding style and module patterns for this Neovim configuration.

## Module Layout

```
lua/
├── core/          # Editor core: options, keymaps
├── opts/          # Plugin + LSP config
│   └── lspc/      # Per-language LSP configs
└── pubs/          # UI: background, themes
    └── theme/     # Color themes
```

## Require Chain

`init.lua` loads only `api_interface` modules:

```lua
require("core.api_interface")
require("opts.api_interface")
require("pubs.api_interface")
```

Each `api_interface.lua` only contains `require()` calls:

```lua
-- lua/core/api_interface.lua
require("core.basic")
require("core.keyboard")
```

**Rule:** `init.lua` and `api_interface.lua` must contain **only** `require("target")`.

## Module Naming

- Files: `snake_case.lua`
- Directories: `snake_case`
- One logical unit per file
- `api_interface.lua` = loader for that directory

## Adding a Module

1. Create `lua/<area>/<name>.lua`
2. Add `require("<area>.<name>")` to the relevant `api_interface.lua`
3. If it is a public loader, wire from `init.lua`

## LSP Config Pattern (`lua/opts/lspc/`)

**Enabled** (server installed):

```lua
-- LSP configuration for Zig (server: zls).
vim.lsp.config("zls", {
	cmd = { "zls" },
	root_markers = { "build.zig", "zls.json", ".git" },
})
vim.lsp.enable("zls")
```

**Not enabled** (server not installed — comment out, document how to enable):

```lua
-- LSP configuration for Python 3 (server: pyright).
--
-- Status: not enabled. The language server is not installed on this device.
-- To enable:
--   1. Install pyright and make sure it is on $PATH.
--   2. Uncomment the block below.
--
-- vim.lsp.config("pyright", {
--   cmd = { "pyright-langserver", "--stdio" },
--   root_markers = { "pyproject.toml", ".git" },
-- })
-- vim.lsp.enable("pyright")
```

**Register in `lua/opts/lsp.lua`:**

```lua
require("opts.lspc.py3")
```

**Shared server config** (e.g. `clangd.lua` for C/C++):

- Put the `vim.lsp.config()` in a shared file (e.g. `lspc/clangd.lua`)
- Each language file `require`s it and calls `vim.lsp.enable()`
- Avoids duplicate config and circular-ish paths

**Tabs for indentation** in lspc files (existing style).

## Theme Pattern (`lua/pubs/theme/`)

Each theme file sets 7 highlight groups:

```lua
-- Theme: dracula (matches .termux/tbk/dracula)
local bg = "#282A36"
local fg = "#F8F8F2"

vim.api.nvim_set_hl(0, "Normal",      { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalNC",    { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalSB",    { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "SignColumn",  { bg = bg })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg })
vim.api.nvim_set_hl(0, "FoldColumn",  { bg = bg })
```

Active theme is set in `lua/pubs/nvim_background.lua`:

```lua
require("pubs.theme.dracula")
```

Themes match `~/.termux/tbk/` 1:1. Keep them in sync.

## General Lua Style

- `local opt = vim.opt`, `local keymap = vim.keymap` shorthand
- 2-space indent (see `.stylua.toml`)
- Double quotes preferred
- Annotations/comments in standard computer English
- Keep maintainability and readability

## Shell Script Style (`flock.sh`)

- Google-style function names: `lower_snake_case` verbs
- e.g. `lock_log_files()`, `unlock_log_files()`, `main()`
- Use `[[ ]]` for tests, `"${var}"` quoting
- Tab indentation

## Documentation Sync

When structure or behavior changes, update **in the same change**:

| Change | Update |
|--------|--------|
| Add/remove/rename file or dir | `dirf_struct.txt`, `README.MD` |
| New dependency | `doc/dependencies.ini` |
| New LSP config | `doc/dependencies.ini` `[LSP]`, `dirf_struct.txt`, `README.MD` |
| New theme | `dirf_struct.txt`, `README.MD` |
| New keymap | `README.MD` Usage section |

## Hard Constraints

- **Do NOT debug `core/keyboard.lua`** — user scoped it out.
- **Do NOT delete** `.stylua.toml`, `lazy-lock.json`.
- **`log/` is tracked** — never add to `.gitignore`.
- **`pkg/` is ignored** — nested git repo, do not track.
