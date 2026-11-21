# AI Agent Workflow

Workflow documentation for AI agents working on this Neovim configuration.
Read these documents **before** making any changes.

## Documents

| Document | Purpose |
|----------|---------|
| [WORKFLOW.MD](WORKFLOW.MD) | Task execution flow: read, change, verify, log, commit, push |
| [COMMIT_RULES.MD](COMMIT_RULES.MD) | Commit / log / lock / push discipline (mandatory) |
| [CODE_CONVENTIONS.MD](CODE_CONVENTIONS.MD) | Module layout, naming, require chain, code style |
| [QUICK_ADD.MD](QUICK_ADD.MD) | Recipes: add LSP config, theme, keymap |

## Quick Start

1. Read `WORKFLOW.MD` for the end-to-end task process.
2. Read `COMMIT_RULES.MD` before any commit (log + lock + permission).
3. Follow `CODE_CONVENTIONS.MD` when writing Lua modules.
4. Use `QUICK_ADD.MD` recipes for common additions.

## Project at a Glance

- Neovim config for **Termux / Linux / Windows**
- Plugin manager: **lazy.nvim** (10 plugins)
- Module chain: `init.lua` -> `core/opts/pubs` api_interface -> modules
- 13 color themes in `lua/pubs/theme/` (match `~/.termux/tbk/`)
- 10 per-language LSP configs in `lua/opts/lspc/`
- Daily consolidated logs in `log/` (locked after write)

## Git Author Identity

| File | Tracked | Role |
|------|---------|------|
| `author.storehouse.ini` | yes | Archive — authoritative source |
| `author.submit.ini` | **no** (gitignored) | Submit credential — read for commits |

**Always read `author.submit.ini` for `USER` / `MAIL` when committing.**
Do NOT hardcode or guess the email. See `COMMIT_RULES.MD` Git Identity.

## Hard Constraints

- **Do NOT debug `core/keyboard.lua`** (user scoped it out)
- **Do NOT delete** `.stylua.toml` or `lazy-lock.json`
- **`log/` IS tracked in git** — never gitignore it
- **Every commit = log event** — write log, lock files, get permission, then push
- **`pkg/` is ignored** — contains a nested git repo (jdtls-termux)
- **`author.submit.ini` is ignored** — the submit credential, not tracked
- **Git identity comes from `author.submit.ini`** — never hardcode it
