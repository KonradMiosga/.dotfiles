vim.pack.add {
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim', version = '0.1.8' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/chomosuke/typst-preview.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/LinArcX/telescope-env.nvim' },
  { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
  { src = 'https://github.com/supermaven-inc/supermaven-nvim' },
  { src = 'https://github.com/hrsh7th/nvim-cmp' },
  { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
  { src = 'https://github.com/hrsh7th/cmp-buffer' },
  { src = 'https://github.com/hrsh7th/cmp-path' },
  { src = 'https://github.com/hrsh7th/cmp-cmdline' },
  { src = 'https://github.com/stevearc/conform.nvim' },
}

local function pack_clean()
  local active_plugins = {}
  local unused_plugins = {}

  for _, plugin in ipairs(vim.pack.get()) do
    active_plugins[plugin.spec.name] = plugin.active
  end

  for _, plugin in ipairs(vim.pack.get()) do
    if not active_plugins[plugin.spec.name] then
      table.insert(unused_plugins, plugin.spec.name)
    end
  end

  if #unused_plugins == 0 then
    print 'No unused plugins.'
    return
  end

  local choice = vim.fn.confirm('Remove unused plugins?', '&Yes\n&No', 2)
  if choice == 1 then
    vim.pack.del(unused_plugins)
  end
end

vim.keymap.set('n', '<leader>cc', pack_clean)

require('mason').setup()

local telescope = require 'telescope'
telescope.setup {
  defaults = {
    preview = { treesitter = false },
    color_devicons = true,
    sorting_strategy = 'ascending',
    borderchars = {
      '─', -- top
      '│', -- right
      '─', -- bottom
      '│', -- left
      '┌', -- top-left
      '┐', -- top-right
      '┘', -- bottom-right
      '└', -- bottom-left
    },
    path_displays = { 'smart' },
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = 'top',
      preview_cutoff = 40,
    },
  },
}

require('oil').setup {
  lsp_file_methods = {
    enabled = true,
    timeout_ms = 1000,
    autosave_changes = true,
  },
  columns = {
    'icon',
  },
  view_options = {
    show_hidden = true,
  },
}

-- Default options:
require('gruvbox').setup {
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = '', -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
}
vim.cmd 'colorscheme gruvbox'

vim.lsp.enable {
  'lua_ls',
  'tinymist',
  'clangd',
  'stylua',
}

local cmp = require 'cmp'
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm { select = true },
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = cmp.config.sources({
    { name = 'supermaven', group_index = 2 },
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
}

require('supermaven-nvim').setup {
  ignore_filetypes = { typst = true }, -- or { "typst", }
  disable_inline_completion = true, -- disables inline completion for use with cmp
  disable_keymaps = true, -- disables built in keymaps for more manual control
}

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    -- Conform can also run multiple formatters sequentially
    -- python = { "isort", "black" },
    --
    -- You can use 'stop_after_first' to run the first available formatter from the list
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
  },
}

vim.keymap.set('n', '<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end)
