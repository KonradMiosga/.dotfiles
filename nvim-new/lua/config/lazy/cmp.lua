return {
  'hrsh7th/nvim-cmp',
  lazy = false,
  priority = 100,
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind.nvim',

    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'folke/lazydev.nvim',
  },
  config = function()
    vim.opt.completeopt = 'menu,menuone,noselect'
    vim.opt.shortmess:append 'c'

    local lspkind = require 'lspkind'
    lspkind.init {}

    local cmp = require 'cmp'

    local luasnip = require 'luasnip'

    cmp.setup {
      sources = {
        { name = 'lazydev', group_index = 0 },
        { name = 'supermaven' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer' }, -- text within current buffer
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item {
          behavior = cmp.SelectBehavior.Select,
        }, -- previous suggestion
        ['<C-n>'] = cmp.mapping.select_next_item {
          behavior = cmp.SelectBehavior.Select,
        }, -- next suggestion
        ['<C-y>'] = cmp.mapping(
          cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
          { 'i', 'c' }
        ),
        ['<C-Space>'] = cmp.mapping.complete(),
      },

      formatting = {
        fields = { 'kind', 'abbr', 'menu' }, -- order: icon, text, source
        format = function(entry, vim_item)
          -- Use lspkind to render a single symbol (no duplicate)
          -- with_text = true produces "icon <space> text"
          local kind = lspkind.symbolic(vim_item.kind, { with_text = true })
          -- Add custom symbol for the Supermaven source
          if entry.source.name == 'supermaven' then
            kind = ' Supermaven'
          end
          -- shorten long abbrs
          local max_width = 50
          if #vim_item.abbr > max_width then
            vim_item.abbr = vim_item.abbr:sub(1, max_width - 1) .. '…'
          end

          -- custom source labels (optional)
          local source_names = {
            nvim_lsp = '[LSP]',
            luasnip = '[SNIP]',
            buffer = '[BUF]',
            path = '[PATH]',
            lazydev = '[LDEV]',
            supermaven = '[SM]',
          }
          vim_item.menu = source_names[entry.source.name] or ('[' .. entry.source.name .. ']')

          -- set the kind field to the lspkind result (this replaces whatever the source provided)
          vim_item.kind = kind

          return vim_item
        end,
      },
    }

    vim.api.nvim_set_hl(0, 'CmpItemKindSupermaven', { fg = '#44bdff' })
  end,
}
