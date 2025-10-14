vim.keymap.set("n", "<leader>p", ":OpenPdf<CR>", { buffer = 0 })

vim.cmd([[
	setlocal wrapmargin=10
	setlocal formatoptions+=t
	setlocal linebreak
	"setlocal spell
	setlocal wrap
	setlocal textwidth=100
	setlocal colorcolumn=100
]])
