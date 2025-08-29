return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      clangd = {
        cmd = { "clangd", "--compile-commands-dir=." }, -- <- tell clangd where the json file is
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("compile_commands.json", ".git")(fname) or vim.fn.getcwd()
        end,
      },
    },
  },
}
