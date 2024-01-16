return {
    -- {
    --     "nvim-lua/plenary.nvim"
    -- },
    { 'numToStr/Comment.nvim', opts = {} },
    --colorscheme
    {
        'sainnhe/gruvbox-material',
        -- as = 'gruvbox-material',
        config = function()
            vim.g.gruvbox_material_transparent_background = 1
            vim.cmd('colorscheme gruvbox-material')
        end
    },
    --lazygit
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}
