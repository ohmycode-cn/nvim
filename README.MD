# nvim

> Cross-platform Neovim configuration for **Termux**, **Linux**, and **Windows**.

![platform](https://img.shields.io/badge/platform-Termux%20%7C%20Linux%20%7C%20Windows-blue)
![license](https://img.shields.io/badge/license-MIT-green)
![neovim](https://img.shields.io/badge/Neovim-0.9%2B-57A143)

One config tree, three platforms. It bootstraps [lazy.nvim](https://github.com/folke/lazy.nvim)
on startup, wires up LSP / completion / treesitter, and ships 13 ready-to-use color themes.
Platform-specific tweaks (e.g. diagnostics keymaps) are pre-adapted — see [Usage](#usage).

## Features

- **Zero-touch plugin management** — `lua/opts/setup.lua` auto-installs lazy.nvim and all plugins
- **Per-language LSP** — C / C++ (clangd), Rust, Go, Bash, Python in `lua/opts/lspc/`
- **Completion stack** — nvim-cmp + LuaSnip + buffer/path/LSP sources
- **13 color themes** — light & dark, switchable in one line
- **Hold-to-show diagnostics** — release the key to close, adapted per platform
- **Change log discipline** — daily logs in `log/`, lockable via `flock.sh`

## Requirements

| Package | Purpose |
|---------|---------|
| Neovim 0.9+ | Editor |
| git | Plugin cloning |
| curl | Downloads |
| clang | clangd / gcc / cc |
| make | Treesitter parser build |
| nodejs | npm (pyright, bash-language-server) |
| python | Python LSP tooling |
| tar / unzip | Archive extraction |
| stylua | Lua formatter (see `.stylua.toml`) |

## Installation

```bash
# Linux / Termux
git clone https://github.com/ohmycode-cn/nvim ~/.config/nvim

# Windows (PowerShell)
git clone https://github.com/ohmycode-cn/nvim $LOCALAPPDATA\nvim
```

Start `nvim` — lazy.nvim bootstraps itself and installs the plugin set on first launch.

## Directory Structure

```
~/.config/nvim/
├── init.lua                  # Entry point (require only)
├── LICENSE                   # MIT License
├── README.MD                 # This file
├── .gitignore
├── .stylua.toml              # StyLua formatter configuration
├── dependences_list.ini      # Plugin dependency URLs (short list)
├── dirf_struct.txt           # Directory structure reference
├── flock.sh                  # Log file lock / unlock helper
├── lazy-lock.json            # lazy.nvim plugin version lock
├── doc/
│   └── dependencies.ini      # Full dependency audit (system / plugin / LSP)
├── log/                      # Daily change logs (locked after write)
├── hty/                      # Historical snapshots
│   └── dirfs/                # Directory structure dumps (dated)
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
    │       ├── bash.lua
    │       └── py3.lua
    └── pubs/
        ├── api_interface.lua # Pubs module loader
        ├── nvim_background.lua # Theme loader (switch active theme here)
        └── theme/            # 13 color themes (bg / fg pairs)
            ├── cream.lua     # #FFF7D5 / #1A1A1A (light)
            ├── gray-white.lua # #F0F0F0 / #2B2B2B (light)
            ├── catppuccin-mocha.lua # #1E1E2E / #CDD6F4 (dark)
            ├── dracula.lua   # #282A36 / #F8F8F2 (dark)
            ├── gruvbox.lua   # #282828 / #EBDBB2 (dark)
            ├── nord.lua      # #2E3440 / #D8DEE9 (dark)
            ├── aurora.lua    # #0F111A / #E0E6F0 (dark)
            ├── cyberpunk.lua # #0B0B1A / #E0E0FF (dark)
            ├── ember.lua     # #181210 / #F2D8C4 (dark)
            ├── galaxy.lua    # #100A24 / #CBB8F5 (dark)
            ├── matrix.lua    # #000000 / #00FF41 (dark)
            ├── synthwave.lua # #2B213A / #FFFFFF (dark)
            └── tokyo-night.lua # #1A1B26 / #C0CAF5 (dark)
```

## Usage

### Switch theme

Edit the require target in `lua/pubs/nvim_background.lua`:

```lua
require("pubs.theme.dracula")   -- pick any theme from lua/pubs/theme/
```

### Hold-to-show diagnostics

| Key | Platform | Note |
|-----|----------|------|
| `Ctrl+Alt+Shift+K` | Desktop (Linux / Windows) | Default desktop mapping |
| `Alt+K` | Termux | Avoids Android Alt+Shift keyboard conflict |
| `Ctrl+Alt+K` | Both | Alternative mapping |

Hold the key to show diagnostics in a float, release to close.

### Lock log files (`flock.sh`)

`log/` stores one consolidated change log per day. After writing a log entry,
lock the files to prevent accidental edits:

```bash
bash flock.sh lock     # chmod u-w log/*.txt  (default if no argument)
bash flock.sh unlock   # chmod u+w log/*.txt  (before writing a new entry)
```

> Run from the repository root. Uses `chmod`, so it targets Termux / Linux / macOS;
> on Windows the script is a no-op for permissions.

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

## License

[MIT](LICENSE)
