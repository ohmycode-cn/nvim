-- LSP configuration for Zig (server: zls).
vim.lsp.config("zls", {
	cmd = { "zls" },
	root_markers = { "build.zig", "zls.json", ".git" },
})
vim.lsp.enable("zls")
