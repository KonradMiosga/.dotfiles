return {
  {
    'saghen/blink.cmp',
    enabled = false,
    dependencies = 'rafamadriz/friendly-snippets',

    version = 'v0.*',

    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      completion = {
        menu = { auto_show = false },
        list = {
          selection = {
            preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
          }
        }
      },

      signature = { enabled = true }
    },
  },
}
