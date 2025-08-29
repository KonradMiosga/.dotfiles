return {
  "saghen/blink.cmp",
  -- enabled = false,
  opts = function(_, opts)
    opts.keymap = {
      preset = "default", -- Disable default keymap presets
      -- ["<C-y>"] = { "select_and_accept" }, -- Optional: bind Ctrl-Y to accept
      -- Note: <CR> is intentionally omitted to disable it
    }
    opts.completion.ghost_text = {
      enabled = false,
    }
  end,
}
