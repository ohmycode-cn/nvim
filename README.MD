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
    └── opts/
        ├── api_interface.lua # Opts module loader
        ├── setup.lua         # lazy.nvim bootstrap & plugin declarations
        ├── cmp.lua           # nvim-cmp auto completion config
        ├── lsp.lua           # LSP client config loader
        ├── treesitters.lua   # Treesitter parser config
        └── lspc/             # Per-language LSP configs
            ├── clangd.lua    # Shared clangd server definition (C/C++)
            ├── c.lua
            ├── cpp.lua
            ├── rust.lua
            ├── go.lua
            └── bash.lua
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
