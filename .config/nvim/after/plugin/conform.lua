require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    c = { 'clang-format' },
    go = { 'gofmt' },
    zig = { 'zigfmt' },
    markdown = { 'prettier' },
    rust = { 'rustfmt' },
  },
}

vim.keymap.set('n', '<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end)
