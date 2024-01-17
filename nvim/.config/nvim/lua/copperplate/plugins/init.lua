return {
    {
        'numToStr/Comment.nvim',
        -- opts = {},
        config = function()
            require("Comment").setup()
        end
    },
    {
        'sainnhe/gruvbox-material',
        config = function()
            vim.g.gruvbox_material_transparent_background = 1
            vim.cmd('colorscheme gruvbox-material')
        end
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require("gitsigns").setup()
        end
    },
}
