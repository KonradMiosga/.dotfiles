local map = vim.keymap.set
map('n', '<leader>o', '<cmd>Oil<CR>')
map('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '=ap', "ma=ap'a")

-- greatest remap ever
map('x', '<leader>p', [["_dP]], { desc = 'paste without copying' })

-- next greatest remap ever : asbjornHaland
map({ 'n', 'v' }, '<leader>y', [["+y]])
map('n', '<leader>Y', [["+Y]])

map({ 'n', 'v' }, '<leader>d', '"_d')

-- This is going to get me cancelled
map('i', '<C-c>', '<Esc>')

-- map('n', '<C-k>', '<cmd>cnext<CR>zz')
-- map('n', '<C-j>', '<cmd>cprev<CR>zz')
map('n', '<leader>k', '<cmd>lnext<CR>zz')
map('n', '<leader>j', '<cmd>lprev<CR>zz')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- telescope
local builtin = require("telescope.builtin")

map('n', '<leader>sf', builtin.find_files)
map('n', '<leader>sg', builtin.git_files)
map('n', '<leader>sr', builtin.oldfiles)
map('n', '<leader>sm', builtin.man_pages)
map('n', '<leader>sh', builtin.help_tags)
map('n', '<leader>sk', builtin.keymaps)

-- Use CTRL-space to trigger LSP completion.
-- Use CTRL-Y to select an item. |complete_CTRL-Y|
map('i', '<c-space>', function()
  vim.lsp.completion.get()
end)
