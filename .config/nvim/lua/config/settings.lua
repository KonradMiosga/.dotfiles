vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- vimwiki
vim.g.vimwiki_list = {
  { path = '~/personal/vimwiki', syntax = 'markdown', ext = '.md' },
}
vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_conceal_pre = 1

vim.g.markdown_folding = 0

vim.g.taskwiki_dont_fold = 1
vim.g.taskwiki_data_location = '~/personal/.task'
