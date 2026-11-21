# Quick Add Recipes

Step-by-step recipes for common additions.

## Add an LSP Config

**Example: add Python (py3)**

1. Create `lua/opts/lspc/py3.lua`:

   **If server is installed** (enabled):
   ```lua
   -- LSP configuration for Python 3 (server: pyright).
   vim.lsp.config("pyright", {
   	cmd = { "pyright-langserver", "--stdio" },
   	root_markers = { "pyproject.toml", "setup.py", ".git" },
   })
   vim.lsp.enable("pyright")
   ```

   **If server is NOT installed** (commented, documented):
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

2. Register in `lua/opts/lsp.lua`:
   ```lua
   require("opts.lspc.py3")
   ```

3. Update docs:
   - `dirf_struct.txt` — add `py3.lua` under `lspc/`
   - `README.MD` — add to directory tree and language list
   - `doc/dependencies.ini` — add `[python3]` under `[LSP]`:
     ```
     [python3]:
     pyright-langserver
     package: pyright (npm)
     ```

4. Verify: `nvim --headless -c 'lua local ok = pcall(require, "opts.lsp"); print(ok and "OK" or "ERR"); vim.cmd("qa!")'`

## Add a Theme

**Example: add "ocean"**

1. Create `lua/pubs/theme/ocean.lua` (copy the 7 hl-groups pattern):
   ```lua
   -- Theme: ocean (matches .termux/tbk/ocean)
   local bg = "#1A2B3C"
   local fg = "#E0F0FF"

   vim.api.nvim_set_hl(0, "Normal",      { fg = fg, bg = bg })
   vim.api.nvim_set_hl(0, "NormalNC",    { fg = fg, bg = bg })
   vim.api.nvim_set_hl(0, "NormalSB",    { fg = fg, bg = bg })
   vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg, bg = bg })
   vim.api.nvim_set_hl(0, "SignColumn",  { bg = bg })
   vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg })
   vim.api.nvim_set_hl(0, "FoldColumn",  { bg = bg })
   ```

2. Keep `~/.termux/tbk/ocean` in sync (same bg/fg).

3. To activate: edit `lua/pubs/nvim_background.lua`:
   ```lua
   require("pubs.theme.ocean")
   ```

4. Update docs:
   - `dirf_struct.txt` — add `ocean.lua` under `theme/`
   - `README.MD` — add to theme list with bg/fg values

## Add a Keymap

**Example: add a normal-mode mapping**

Add to `lua/core/keyboard.lua`:

```lua
-- Normal mode: description here.
keymap.set("n", "<leader>xx", "<cmd>SomeCommand<CR>", { desc = "Description" })
```

For **hold-to-show** behavior (like diagnostics), use the
`hold_show_diagnostics()` pattern: open float, close on next
cursor move / insert enter / buf leave via autocmd.

Update `README.MD` Usage section with the key and platform.

**Platform notes:**
- Desktop: `Ctrl+Alt+Shift+K` style works
- Termux: avoid `Alt+Shift` (Android keyboard toggle conflict),
  avoid `Ctrl+Shift` (input method switch), avoid `Cmd/Super`
  (terminal does not transmit). Prefer `Alt+K`, `Ctrl+Alt+K`.

## Add a Plugin

1. Add to `lua/opts/setup.lua` `plugins` table:
   ```lua
   {
     "author/plugin-name",
     config = function()
       require("opts.plugin_config")  -- if needed
     end,
   },
   ```

2. Update:
   - `doc/dependencies.ini` `[URL]` and `[LAZY-PLUGIN]`
   - `dependences_list.ini` (short URL list)
   - `README.MD` plugins table

3. Lazy.nvim installs on next `nvim` start (no manual clone needed).

## Merge Daily Logs

At the end of a day (only that day's files):

1. `bash flock.sh unlock`
2. Create `log/<earliest-timestamp>.txt` with all entries:
   ```
   [2026-11-18-01-43-19]
   - entry one

   [2026-11-18-12-51-22]
   - entry two
   ```
3. Delete the other individual `.txt` for **that day only**.
4. `bash flock.sh lock`
5. Commit + push (with permission).

## Verify a Change

```bash
# Lua load check
nvim --headless -c 'lua local ok, err = pcall(require, "core.keyboard"); print(ok and "OK" or ("ERR: " .. err)); vim.cmd("qa!")'

# Shell syntax
bash -n flock.sh

# Check diagnostics work (open a C file with errors)
nvim --headless test.c -c 'lua vim.defer_fn(function() print(#vim.diagnostic.get(0) .. " diagnostics"); vim.cmd("qa!") end, 5000)'
```
