local ok, cmp = pcall(require, 'cmp')
if not ok then
  return
end

local autopairs_ok, autopairs_cmp = pcall(require, 'nvim-autopairs.completion.cmp')
if not autopairs_ok then
  return
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm { select = true },
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'supermaven' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
}

cmp.event:on(
  'confirm_done',
  autopairs_cmp.on_confirm_done()
)
