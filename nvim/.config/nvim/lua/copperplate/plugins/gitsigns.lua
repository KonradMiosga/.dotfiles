return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require("gitsigns").setup()
        -- opts = {
        --     -- See `:help gitsigns.txt`
        --     signs = {
        --         add = { text = '+' },
        --         change = { text = '~' },
        --         delete = { text = '_' },
        --         topdelete = { text = '‾' },
        --         changedelete = { text = '~' },
        --     },
        -- }
    end
}
