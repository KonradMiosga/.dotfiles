-- LSP Support
return {
    -- LSP Configuration
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    -- event = 'VeryLazy',
    dependencies = {
        -- LSP Management
        -- https://github.com/williamboman/mason.nvim
        { 'williamboman/mason.nvim' },
        -- https://github.com/williamboman/mason-lspconfig.nvim
        { 'williamboman/mason-lspconfig.nvim' },
        -- Auto-Install LSPs, linters, formatters, debuggers
        -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
        { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
        -- Useful status updates for LSP
        -- https://github.com/j-hui/fidget.nvim
        { 'j-hui/fidget.nvim',                        opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        -- https://github.com/folke/neodev.nvim
        { 'folke/neodev.nvim' },
    },
    config = function()
        require("fidget").setup({})
        require('mason').setup()
        require('mason-lspconfig').setup({
            -- Install these LSPs automatically
            ensure_installed = {
                'clangd',
                -- 'bashls', -- requires npm to be installed
                -- 'cssls', -- requires npm to be installed
                -- 'html', -- requires npm to be installed
                'lua_ls',
                -- 'jsonls', -- requires npm to be installed
                'lemminx',
                'marksman',
                'quick_lint_js',
                -- 'tsserver', -- requires npm to be installed
                -- 'yamlls', -- requires npm to be installed
                -- 'jdtls',
                'zls',
            }
        })
        require('mason-tool-installer').setup({
            -- Install these linters, formatters, debuggers automatically
            ensure_installed = {
                'java-debug-adapter',
                'java-test',
            },
        })

        -- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
        -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
        vim.api.nvim_command('MasonToolsInstall')

        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lsp_attach = function(client, bufnr)
            -- Create your keybindings here...
        end

        -- Call setup on each LSP server
        require('mason-lspconfig').setup_handlers({
            function(server_name)
                -- Don't call setup for JDTLS Java LSP because it will be setup from a separate config
                if server_name ~= 'jdtls' then
                    lspconfig[server_name].setup({
                        on_attach = lsp_attach,
                        capabilities = lsp_capabilities,
                    })
                end
            end
        })

        lspconfig.jdtls.setup({})

        lspconfig.zls.setup {
            root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    enable_snippets = true,
                    warn_style = true,
                },
            },
        }
        -- Lua LSP settings
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                },
            },
        }

        -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
        local open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or "rounded" -- Set border to rounded
            return open_floating_preview(contents, syntax, opts, ...)
        end

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
