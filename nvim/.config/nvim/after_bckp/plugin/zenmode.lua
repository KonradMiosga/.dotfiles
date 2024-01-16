vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 90,
            options = {}
        },
        plugins = {
            -- tmux = { enabled = true },
            gitsigns = { enabled = true },
            alacritty = {
                enabled = true,
                font = "18", -- font size
            },
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
end, { desc = 'Zen Mode' })
