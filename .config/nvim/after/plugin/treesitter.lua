require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "c", "go", "zig", "markdown", "typst", "rust" },
  auto_install = true,
  highlight = {
    enable = true,
  },
}
