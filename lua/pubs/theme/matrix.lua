-- Theme: matrix (matches .termux/tbk/matrix)
local bg = "#000000"
local fg = "#00FF41"

vim.api.nvim_set_hl(0, "Normal",      { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalNC",    { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalSB",    { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "SignColumn",  { bg = bg })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg })
vim.api.nvim_set_hl(0, "FoldColumn",  { bg = bg })
