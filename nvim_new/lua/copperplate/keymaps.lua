vim.g.mapleader = " "

local map = vim.keymap.set

local builtin = require('telescope.builtin')
map("n", "<leader>o", "<cmd>Oil<cr>")
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<C-p>", builtin.git_files, {})
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
