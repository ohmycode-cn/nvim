-- LSP configuration for Python 3 (server: pyright).
--
-- Status: enabled. pyright is installed globally via npm (pyright-langserver on $PATH).
--
vim.lsp.config("pyright", {
	cmd = { "pyright-langserver", "--stdio" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
})
vim.lsp.enable("pyright")
