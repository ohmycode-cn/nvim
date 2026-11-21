-- LSP configuration for Bash (server: bash-language-server).
--
-- Status: enabled. bash-language-server is installed globally via npm.
--
vim.lsp.config("bashls", {
	cmd = { "bash-language-server", "start" },
	root_markers = { ".git" },
})
vim.lsp.enable("bashls")
