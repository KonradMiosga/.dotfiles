return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = { virtual_text = false },
    servers = {
      tinymist = {
        settings = {
          formatterMode = "typstyle",
          exportPdf = "onType",
          outputPath = "output/$name",
          semanticTokens = "disable",
        },
      },
    },
  },
}
