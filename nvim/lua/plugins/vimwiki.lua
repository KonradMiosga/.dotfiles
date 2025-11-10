return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/personal/vimwiki",
        syntax = "markdown",
        ext = ".md",
      },
    }
  end,
}
