-- Auto completion (nvim-cmp).
local cmp = require("cmp")
local luasnip = require("luasnip")
local keyboard = require("core.keyboard")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- Key mappings live in core/keyboard.lua (M.cmp_mappings).
  mapping = keyboard.cmp_mappings(cmp, luasnip),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})
