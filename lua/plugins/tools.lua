return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "black",
          "clang-format",
          "cmakelang", 
          "stylua",
          "tree-sitter-cli"
        },
      })
    end,
  },
}

