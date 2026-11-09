-- Lazy.nvim bootstrap and plugin declarations.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Color scheme.
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd("colorscheme tokyonight-moon")
      -- Override background/foreground to match Termux (colors.properties).
      vim.api.nvim_set_hl(0, "Normal",     { fg = "#1A1A1A", bg = "#FFF7D5" })
      vim.api.nvim_set_hl(0, "NormalNC",   { fg = "#1A1A1A", bg = "#FFF7D5" })
      vim.api.nvim_set_hl(0, "NormalSB",   { fg = "#1A1A1A", bg = "#FFF7D5" })
      vim.api.nvim_set_hl(0, "NormalFloat",{ fg = "#1A1A1A", bg = "#FFF7D5" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "#FFF7D5" })
      vim.api.nvim_set_hl(0, "EndOfBuffer",{ bg = "#FFF7D5" })
      vim.api.nvim_set_hl(0, "FoldColumn", { bg = "#FFF7D5" })
    end,
  },

  -- Language Server Protocol client configs (see opts/lsp.lua and opts/lspc/).
  "neovim/nvim-lspconfig",

  -- Auto completion.
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("opts.cmp")
    end,
  },

  -- Syntax highlighting (C/C++ parsers).
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("opts.treesitters")
    end,
  },
}

require("lazy").setup(plugins, {})
