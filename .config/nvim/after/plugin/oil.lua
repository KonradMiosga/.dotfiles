local ok = pcall(require, 'oil')
if not ok then
  return
end
require('oil').setup {
  lsp_file_methods = { enabled = true, timeout_ms = 1000, autosave_changes = true },
  columns = { 'icon' },
  view_options = { show_hidden = true },
}
