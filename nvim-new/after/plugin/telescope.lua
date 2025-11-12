local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

telescope.setup {
  defaults = {
    preview = { treesitter = false },
    color_devicons = true,
    sorting_strategy = 'ascending',
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    path_displays = { 'smart' },
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = 'top',
      preview_cutoff = 40,
    },
  },
}

local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>sf', builtin.find_files)
vim.keymap.set('n', '<leader>sg', builtin.git_files)
vim.keymap.set('n', '<leader>sr', builtin.oldfiles)
vim.keymap.set('n', '<leader>sm', builtin.man_pages)
vim.keymap.set('n', '<leader>sh', builtin.help_tags)
vim.keymap.set('n', '<leader>sk', builtin.keymaps)
