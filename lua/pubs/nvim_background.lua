-- Theme loader. Switch theme by changing the require target below.
-- Available themes in lua/pubs/theme/: aurora, catppuccin-mocha, cream,
-- cyberpunk, dracula, ember, galaxy, gray-white, gruvbox, matrix, nord,
-- synthwave, tokyo-night.
-- Called after colorscheme is loaded (see opts/setup.lua).

require("pubs.theme.catppuccin-mocha")

-- No italic fonts anywhere (comments included).
vim.api.nvim_set_hl(0, "Comment", { fg = "#2e7d32", italic = false })

-- Thin purple-red ruler line at column 80.
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "NONE", sp = "#d7005f", underline = true })
