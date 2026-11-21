-- LSP configuration for Java (server: jdtls).
--
-- Status: enabled. jdtls is installed at ~/.java-lsp (launcher: bin/jdtls).
--
vim.lsp.config("jdtls", {
	cmd = { "jdtls" },
	root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", ".git" },
})
vim.lsp.enable("jdtls")
