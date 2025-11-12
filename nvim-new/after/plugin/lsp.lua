require('mason').setup()
require('fidget').setup {}

vim.lsp.enable {
  'lua_ls',
  'tinymist',
  'clangd',
  'stylua',
}

vim.lsp.config['tinymist'] = {
  settings = {
    formatterMode = 'typstyle',
    exportPdf = 'onType',
    semanticTokens = 'disable',
  },
}

vim.diagnostic.config {
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'if_many',
    header = '',
    prefix = '',
  },
}
