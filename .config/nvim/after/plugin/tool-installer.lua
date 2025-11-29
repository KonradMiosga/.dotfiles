require('mason-tool-installer').setup {
  ensure_installed = {
    "stylua",
    "prettier",
    "codelldb",
  },
  auto_update = true,
  run_on_start = true,
}
