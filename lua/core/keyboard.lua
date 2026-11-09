-- Keyboard mappings.
-- All key combinations of the config live in this file so conflicts are easy to review.
vim.g.mapleader = " "

local M = {}

local keymap = vim.keymap

-- Insert mode: quick escape.
keymap.set("i", "jk", "<ESC>")

-- Visual mode: move the selected block up / down.
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Normal mode: window splits.
keymap.set("n", "<leader>sv", "<C-w>v") -- Split vertically (side by side).
keymap.set("n", "<leader>sh", "<C-w>s") -- Split horizontally (top / bottom).

-- Normal mode: clear search highlight.
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- LSP mappings: buffer-local, active only while a language server is attached.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
  callback = function(event)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = event.buf, silent = true, desc = desc })
    end

    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("gr", vim.lsp.buf.references, "List references")
    map("gi", vim.lsp.buf.implementation, "Go to implementation")
    map("gt", vim.lsp.buf.type_definition, "Go to type definition")
    map("K", vim.lsp.buf.hover, "Hover documentation")
    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, "Format buffer")
    map("<leader>e", vim.diagnostic.open_float, "Show diagnostics")
    map("[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, "Previous diagnostic")
    map("]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, "Next diagnostic")
  end,
})

-- Completion mappings for nvim-cmp (consumed by opts/cmp.lua).
-- Built through a function because core modules load before plugins.
function M.cmp_mappings(cmp, luasnip)
  return cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  })
end

return M
