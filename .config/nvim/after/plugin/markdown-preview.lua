-- after/plugin/markdown-preview.lua
-- Configuration for nvim-markdown-preview

vim.g.mkdp_auto_start = 0 -- Do not auto-start, user can toggle
vim.g.mkdp_auto_close = 1 -- Auto-close preview when closing markdown file
vim.g.mkdp_filetypes = { 'markdown', 'vimwiki' } -- Enable for markdown and vimwiki files

-- Keymaps for toggling markdown preview
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "vimwiki" },
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>mp', ':MarkdownPreviewToggle<CR>', { noremap = true, silent = true })
  end,
})
