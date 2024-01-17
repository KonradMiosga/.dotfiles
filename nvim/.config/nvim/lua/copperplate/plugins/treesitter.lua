return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = { 'c', 'lua', 'python', 'rust', 'elm', 'java', 'vimdoc', 'vim', 'bash', "markdown", "markdown_inline" },
            modules = {},
            sync_install = {},
            ignore_install = {},

            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = true,

            highlight = {
                enable = true,
                disable = { 'latex' } },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<c-space>',
                    node_incremental = '<c-space>',
                    scope_incremental = '<c-s>',
                    node_decremental = '<M-space>',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
            },
        }
    end
}
