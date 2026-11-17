-- Theme: galaxy (matches .termux/tbk/galaxy)
local bg = "#100A24"
local fg = "#CBB8F5"

vim.api.nvim_set_hl(0, "Normal",      { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalNC",    { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalSB",    { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "SignColumn",  { bg = bg })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg })
vim.api.nvim_set_hl(0, "FoldColumn",  { bg = bg })
