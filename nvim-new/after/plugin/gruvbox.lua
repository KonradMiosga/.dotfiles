local ok = pcall(require, 'gruvbox')
if not ok then
  return
end
require('gruvbox').setup {
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = { strings = true, emphasis = true, comments = true, operators = false, folds = true },
  strikethrough = true,
  inverse = true,
  contrast = '',
  dim_inactive = false,
  transparent_mode = false,
}
vim.cmd 'colorscheme gruvbox'
