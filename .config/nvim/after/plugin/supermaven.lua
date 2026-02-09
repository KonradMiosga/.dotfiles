local ok = pcall(require, 'supermaven-nvim')
if not ok then
  return
end
require('supermaven-nvim').setup {
  ignore_filetypes = { typst = true },
  -- disable_inline_completion = true,
  -- disable_keymaps = true,
}
