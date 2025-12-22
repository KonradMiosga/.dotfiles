require('mason-tool-installer').setup {
  ensure_installed = {
    "stylua",
    "prettier",
    "codelldb",
    "typescript-language-server",
  },
  auto_update = true,
  run_on_start = true,
}
