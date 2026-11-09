# nvim

Neovim configuration for Termux.

## Directory Structure

```
~/.config/nvim/
├── init.lua                  # Entry point, loads core and opts modules
├── LICENSE                   # MIT License
├── README.MD                 # This file
├── dependences_list.ini      # Plugin dependency URLs
├── lazy-lock.json            # lazy.nvim plugin version lock
├── .stylua.toml              # StyLua formatter configuration
├── dirf_struct.txt           # Directory structure reference
├── mimo-agent-task.txt       # Task notes
├── log/                      # Change logs
├── hty/                      # Historical modified files
└── lua/
    ├── core/
    │   ├── api_interface.lua # Core module loader
    │   ├── basic.lua         # Basic editor options
    │   └── keyboard.lua      # Key mappings
    ├── opts/
    │   ├── api_interface.lua # Opts module loader
    │   ├── setup.lua         # lazy.nvim bootstrap & plugin declarations
    │   ├── cmp.lua           # nvim-cmp auto completion config
    │   ├── lsp.lua           # LSP client config loader
    │   ├── treesitters.lua   # Treesitter parser config
    │   └── lspc/             # Per-language LSP configs
    │       ├── clangd.lua    # Shared clangd server definition (C/C++)
    │       ├── c.lua
    │       ├── cpp.lua
    │       ├── rust.lua
    │       ├── go.lua
    │       └── bash.lua
    └── pubs/
        ├── api_interface.lua # Pubs module loader
        ├── nvim_background.lua # Theme loader (switch active theme here)
        └── theme/            # Background themes matching .termux/tbk/
            ├── cream.lua     # bg=#FFF7D5 fg=#1A1A1A (light, Termux default)
            ├── catppuccin-mocha.lua # bg=#1E1E2E fg=#CDD6F4 (dark)
            ├── dracula.lua   # bg=#282A36 fg=#F8F8F2 (dark)
            ├── gray-white.lua # bg=#F0F0F0 fg=#2B2B2B (light)
            ├── gruvbox.lua   # bg=#282828 fg=#EBDBB2 (dark)
            └── nord.lua      # bg=#2E3440 fg=#D8DEE9 (dark)
```

## Plugins

| Plugin | Purpose |
|--------|---------|
| lazy.nvim | Plugin manager |
| tokyonight.nvim | Color scheme |
| nvim-lspconfig | LSP client configurations |
| nvim-cmp | Auto completion |
| cmp-nvim-lsp | LSP completion source |
| cmp-buffer | Buffer completion source |
| cmp-path | Path completion source |
| LuaSnip | Snippet engine |
| cmp_luasnip | Snippet completion source |
| nvim-treesitter | Syntax highlighting |
