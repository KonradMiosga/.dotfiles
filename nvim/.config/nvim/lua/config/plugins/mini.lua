return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      local statusline = require('mini.statusline')
      statusline.setup({ use_icons = true })

      local surround = require('mini.surround')
      surround.setup({})

      local pairs = require('mini.pairs')
      pairs.setup({})
    end
  }
}
