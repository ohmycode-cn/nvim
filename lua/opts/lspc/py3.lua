-- LSP configuration for Python 3 (server: pyright).
--
-- Status: not enabled. The language server is not installed on this device.
-- To enable:
--   1. Install pyright and make sure it is on $PATH:
--        npm install -g pyright
--   2. Uncomment the block below.
--
vim.lsp.config("pyright", {
	cmd = { "pyright-langserver", "--stdio" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
})
vim.lsp.enable("pyright")
