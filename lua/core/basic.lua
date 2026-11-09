-- Basic editor options.
local opt = vim.opt

-- Line numbers.
opt.relativenumber = true
opt.number = true

-- Indentation.
opt.tabstop = 4 -- Tab display width: 4 columns.
opt.shiftwidth = 4 -- Indent width: 4 columns.
opt.expandtab = false -- Indent with tab characters, not spaces.
opt.autoindent = true

-- Do not soft-wrap long lines.
opt.wrap = false

-- Do not highlight the current line.
opt.cursorline = false

-- Enable mouse support in all modes.
opt.mouse:append("a")

-- Share the system clipboard with the unnamed register.
opt.clipboard:append("unnamedplus")

-- Open new splits on the right / below.
opt.splitright = true
opt.splitbelow = true

-- Case-insensitive search unless the pattern contains uppercase.
opt.ignorecase = true
opt.smartcase = true

-- Appearance.
opt.termguicolors = true
opt.signcolumn = "yes"
