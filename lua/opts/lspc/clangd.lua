-- Shared clangd language-server definition for C and C++
-- (consumed by opts/lspc/c.lua and opts/lspc/cpp.lua).
-- clangd is provided by the Termux package "clang"; no extra installer needed.

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
  capabilities = cmp_lsp.default_capabilities()
end

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--header-insertion-decorators",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
    "--pch-storage=memory",
    "--log=error",
  },
  root_markers = {
    ".clangd",
    ".clang-tidy",
    ".clang-format",
    "compile_commands.json",
    "compile_flags.txt",
    "Makefile",
    "CMakeLists.txt",
    ".git",
  },
  capabilities = capabilities,
})
