require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "c", "go", "zig", "markdown", "typst" },
  auto_install = true,
  highlight = {
    enable = true,
  },
}
