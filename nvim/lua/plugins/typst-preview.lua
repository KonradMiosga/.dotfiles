return {
  "chomosuke/typst-preview.nvim",
  lazy = false, -- or ft = 'typst'
  version = "1.*",
  opts = {
    open_cmd = "qutebrowser --target window %s",
  }, -- lazy.nvim will implicitly calls `setup {}`
}
