-- LSP configuration for Rust (server: rust-analyzer).
--
-- Status: enabled. rust-analyzer is installed and on $PATH.
--
vim.lsp.config("rust_analyzer", {
	cmd = { "rust-analyzer" },
	root_markers = { "Cargo.toml", "rust-project.json", ".git" },
})
vim.lsp.enable("rust_analyzer")
