-- Treesitter: install parsers and enable syntax highlighting.
require("nvim-treesitter").setup({})

require("nvim-treesitter").install({ "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "objc", "objcpp", "cuda" },
  callback = function(event)
    pcall(vim.treesitter.start, event.buf)
  end,
})
