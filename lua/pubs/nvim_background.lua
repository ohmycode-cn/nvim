-- Theme loader. Switch theme by changing the require target below.
-- Available themes in lua/pubs/theme/: aurora, catppuccin-mocha, cream,
-- cyberpunk, dracula, ember, galaxy, gray-white, gruvbox, matrix, nord,
-- synthwave, tokyo-night.
-- Called after colorscheme is loaded (see opts/setup.lua).

-- require("pubs.theme.gray-white")

-- Disable custom background so the terminal background shows through.
for _, group in ipairs({ "Normal", "NormalNC", "NormalSB", "NormalFloat", "SignColumn", "EndOfBuffer", "FoldColumn" }) do
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  hl.bg = nil
  vim.api.nvim_set_hl(0, group, hl)
end

-- No italic fonts anywhere (comments included).
vim.api.nvim_set_hl(0, "Comment", { fg = "#2e7d32", italic = false })

-- Thin purple-red ruler line at column 80.
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "NONE", sp = "#d7005f", underline = true })
